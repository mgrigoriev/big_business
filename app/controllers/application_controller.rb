# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_js_variables

  def demo_mode?
    BigBusiness::DEMO_MODE
  end

  private

  def set_js_variables
    gon.push(
      env: Rails.env
    )
  end
end
