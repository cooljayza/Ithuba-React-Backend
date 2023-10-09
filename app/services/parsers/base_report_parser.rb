# frozen_string_literal: true

class Parsers::BaseReportParser
  def parse(text)
    lines = get_lines(text)
    sections = get_sections(lines)

    section_1 = sections[0]

    sets = get_report_sets(sections)
    { draw_date: get_report_date(section_1), draw_id: get_draw_number(section_1), sequence_number: get_draw_sequence(section_1),
      roll_over_number: get_rollover_number(section_1), lotto_sets_attributes: sets }
  end

  private


  def get_report_sets(sections)
    new_sections = []

    sections.each_with_index do |section, index|
      start_index = get_div_start_index(section)
      end_index = get_div_end_index(section, start_index)
      dividends = section[start_index..end_index]
      new_sections.push({ rank: index+1, lotto_dividends_attributes: get_dividends(dividends) })
    end
    new_sections
  end

  def get_draw_sequence(lines)
    lines[1].split[0].split(':')[1].to_i
  end

  def validate(lines)
    return false if lines.length.zero?

    return false if lines.select{ |line| line[0] == '_'}.length.zero?

    true
  end

  def get_report_date(lines)
    text = lines[1]
    DateTime.parse(text.split[-2,2].join(' '))
  end

  def get_lines(text)
    text.split("\n").select {|line| line[0] != "\r" }
  end

  def get_draw_number(lines)
    lines[3].split[-1].strip.to_i
  end

  def get_dividends(lines)
    dividends = []
    lines.each { |line|
      values = line.split.map { |value| value.strip.gsub(',', '').gsub('R', '').to_f }
      div = { rank: values[0], share_value: values[1], num_of_shares: values[2],
              amount_paid: values[3], next_draw_rollover: values[4] }
      dividends.push(div)
    }
    dividends
  end

  def get_rollover_number(lines)
    lines[4].split[-1].strip.to_i
  end

  def get_div_start_index(lines)
    index = -1
    until lines[index].strip.starts_with?('Div')  and index < lines.length
      index += 1
    end
    index >= 0 ? index + 1 : -1
  end

  def get_div_end_index(lines, start_index)
    index = start_index
    line = lines[start_index]
    until line.strip.starts_with?('Total') and index < lines.length
      index += 1
      line = lines[index]
    end
    start_index == index ? -1 : index - 1
  end

  def get_sections(lines)
    sections = []
    length = lines.length
    count = 0
    new_lines = []
    while count < length
      if lines[count].start_with?('zaieste1')
        sections.push(new_lines)
        new_lines = []
      end
     new_lines.push(lines[count])
     count+=1
    end
    sections
  end
end