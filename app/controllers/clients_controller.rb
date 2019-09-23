# frozen_string_literal: true

class ClientsController < ApplicationController
  before_action :set_client, only: %i[show edit update destroy]

  def index
    @clients = Client.by_title
  end

  def show; end

  def new
    @client = Client.new
  end

  def edit; end

  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to @client, flash: { success: 'Client has been created successfully' }
    else
      render :new
    end
  end

  def update
    if @client.update(client_params)
      redirect_to @client, flash: { success: 'Client has been updated successfully' }
    else
      render :edit
    end
  end

  def destroy
    @client.destroy
    redirect_to clients_path, flash: { success: 'Client has been deleted successfully' }
  end

  private

  def client_params
    params.require(:client).permit(:title, :name, :email, :phone)
  end

  def set_client
    @client = Client.friendly.find(params[:id])
  end
end
