# frozen_string_literal: true

class LottoSet < ApplicationRecord
  validates_presence_of :rank

  belongs_to :lotto_draw
  has_many :lotto_dividends

  accepts_nested_attributes_for :lotto_dividends
end
