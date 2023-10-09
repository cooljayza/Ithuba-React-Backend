# frozen_string_literal: true

class LottoDividendBlueprint < Blueprinter::Base
  identifier :id

  fields :rank, :share_value, :num_of_shares, :amount_paid, :next_draw_rollover

end
