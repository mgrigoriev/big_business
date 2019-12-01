# frozen_string_literal: true

class OrderDecorator < Draper::Decorator
  delegate_all

  def link_with_client_subtitle
    h.capture do
      h.concat link
      h.concat h.tag.div client.title, class: 'text-muted'
    end
  end

  def link
    h.link_to title, h.order_path(object)
  end

  def status_badge
    h.tag.span status.humanize, class: "status status-#{status.dasherize}"
  end

  def formatted_invoice_date
    invoice_date.to_s(:rfc822) if invoice_date.present?
  end
end
