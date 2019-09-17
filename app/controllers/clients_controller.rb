# frozen_string_literal: true

class ClientsController < ApplicationController
  def index
    @clients = Client.by_title
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end
end
