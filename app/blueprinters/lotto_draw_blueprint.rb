# frozen_string_literal: true

class LottoDrawBlueprint < Blueprinter::Base
  identifier :id

  fields :code, :name, :draw_date, :sequence_number, :roll_over_number, :draw_id

  field(:lotto_sets) do |obj|
    LottoSetBlueprint.render_as_json(obj.lotto_sets)
  end
end
