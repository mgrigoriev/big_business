# frozen_string_literal: true

module MoneyHelper
  def format_money_for_input(money)
    money.format(symbol: false, thousands_separator: false, no_cents_if_whole: true)
  end
end
