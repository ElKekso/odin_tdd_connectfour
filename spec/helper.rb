# frozen_string_literal: false

module Helpers
  def create_cf_board(value = 0)
    Array.new(7) { Array.new(6, value) }
  end
end
