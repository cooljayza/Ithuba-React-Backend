# frozen_string_literal: true
class Parsers::DrawReportParserFactory
  def get_report_parser(report_code)
    case report_code
    when 8
      Parsers::LottoReportParser.new
    when 13
      Parsers::DailyLottoParser.new
    when 12
      Parsers::PowerBallReportParser.new
    else
      # type code here
      nil
    end
  end
end

