# frozen_string_literal: true

class Parsers::LottoReportParser < Parsers::BaseReportParser
  def parse(text)
    { code: 8, name: 'Lotto' }.merge(super(text))
  end
end
