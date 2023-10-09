# frozen_string_literal: true

class LottoDraw < ApplicationRecord
  validates_presence_of :draw_date, :draw_id, :code, :name, :sequence_number, :roll_over_number
  validates_uniqueness_of :draw_id

  has_many :lotto_sets

  accepts_nested_attributes_for :lotto_sets
end
