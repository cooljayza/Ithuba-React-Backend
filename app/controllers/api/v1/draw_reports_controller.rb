# frozen_string_literal: true
module Api
  module V1
    class DrawReportsController < ApplicationController
      before_action :set_v1_lotto_draw, only: :show
      def show
        render json: LottoDrawBlueprint.render_as_json(@lotto_draw)
      end

      def index
        render json: LottoDrawBlueprint.render_as_json(LottoDraw.all)
      end

      def create
        render json: { message: 'Files not uploaded' }, status: :bad_request unless v1_file_params
        results = []
        files = v1_file_params
        files.each do |_, file|
          text = file.read
          result = Parsers::DrawReportParserFactory.new.get_report_parser(get_code(file))&.parse(text)
          lotto_draw = LottoDraw.new(result)
          if lotto_draw.save
            results.push({ file.original_filename => LottoDrawBlueprint.render_as_json(lotto_draw) })
          else
            results.push( { file.original_filename => "File Already captured" })
          end
          rescue
            results.push({ file.original_filename => "Invalid file" })
        end

        render json: results
      end

      private

      def get_text
        File.read('improved_share_calc_report_p012_c07996_english.rep')
      end

      def v1_file_params
        params[:files]
      end

      def get_code(file)
        file.original_filename.split('_')[-3].gsub('p','').to_i
      end

      def set_v1_lotto_draw
        @lotto_draw = LottoDraw.find(params[:id])

        render json: { message: "No Lotto draw found with Id=#{params[:id]}" } , status: :not_found unless @lotto_draw
      end
    end
  end
end
