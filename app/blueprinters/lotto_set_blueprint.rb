# frozen_string_literal: true

class LottoSetBlueprint < Blueprinter::Base
  identifier :id

  fields :rank

  field(:lotto_dividends) do |obj|
    LottoDividendBlueprint.render_as_json(obj.lotto_dividends)
  end
end
