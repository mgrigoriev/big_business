# frozen_string_literal: true

module Report
  class TopClients
    def items
      @items ||= clients_to_price_sum_hash.map do |client_title, price_cents|
        [client_title, Money.new(price_cents), percentage_of(price_cents)]
      end.sort_by(&:last).reverse
    end

    def chart_data
      @chart_data ||= items.map do |client_title, _price_cents, percentage|
        [client_title, percentage]
      end
    end

    private

    def clients_to_price_sum_hash
      Order.joins(:client).group('clients.title').sum(:price_cents)
    end

    def percentage_of(price_cents)
      (price_cents.to_f * 100 / total_price_sum).round
    end

    def total_price_sum
      @total_price_sum ||= Order.sum(:price_cents)
    end
  end
end
