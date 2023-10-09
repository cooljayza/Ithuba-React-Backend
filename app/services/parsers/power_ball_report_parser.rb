# frozen_string_literal: true

class Parsers::PowerBallReportParser < Parsers::BaseReportParser
  def parse(text)
    { code: 12, name: 'Power Ball' }.merge(super(text))
  end
end
