# frozen_string_literal: true

class Parsers::DailyLottoParser < Parsers::BaseReportParser
  def parse(text)
    { code: 13, name: 'Daily Lotto' }.merge(super(text))
  end
end
