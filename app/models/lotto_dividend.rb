# frozen_string_literal: true

class LottoDividend < ApplicationRecord
  validates_presence_of :rank, :amount_paid, :next_draw_rollover, :share_value, :num_of_shares

  belongs_to :lotto_set
end
