# frozen_string_literal: true

module OrderHelper
  def order_status_options_for_select
    Order.statuses.keys.map { |status| [status.humanize, status] }
  end
end
