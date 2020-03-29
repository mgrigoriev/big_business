# frozen_string_literal: true

class ReloadSeed
  def self.call
    ActiveRecord::Base.transaction do
      ActiveRecord::Base.connection.execute('TRUNCATE clients RESTART IDENTITY CASCADE')
      ActiveRecord::Base.connection.execute('TRUNCATE orders RESTART IDENTITY')

      Rails.application.load_seed
    end
  end
end
