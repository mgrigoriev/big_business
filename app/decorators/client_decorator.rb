# frozen_string_literal: true

class ClientDecorator < Draper::Decorator
  delegate_all

  def link
    h.link_to title, h.client_path(id)
  end
end
