# frozen_string_literal: true

module Reports
  class TopClientsController < ApplicationController
    def index
      @report = Report::TopClients.new
    end
  end
end
