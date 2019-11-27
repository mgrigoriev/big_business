# frozen_string_literal: true

class OrderDecorator < Draper::Decorator
  delegate_all

  def link
    h.link_to title, h.order_path(object)
  end
end
