# frozen_string_literal: true

Money.locale_backend = :i18n

MoneyRails.configure do |config|
  config.default_currency = :usd

  config.default_format = {
    no_cents_if_whole: true
  }
end
