# frozen_string_literal: true

module FlashHelper
  FLASH_TYPES = {
    success: 'alert-success',
    error: 'alert-danger',
    notice: 'alert-info'
  }.with_indifferent_access.freeze

  def flash_messages
    flash.map do |message_type, message|
      tag.div(class: "alert #{flash_alert_class(message_type)} alert-dismissible fade show", role: 'alert') do
        concat message
        concat flash_close_button
      end
    end.join.html_safe
  end

  def flash_close_button
    tag.button(
      tag.span('&times;'.html_safe, aria: { hidden: true }),
      type: 'button',
      class: 'close',
      data: { dismiss: 'alert' },
      aria: { label: 'Close' }
    )
  end

  def flash_alert_class(message_type)
    FLASH_TYPES.fetch(message_type, 'alert-info')
  end
end
