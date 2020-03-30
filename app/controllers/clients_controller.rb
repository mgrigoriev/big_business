# frozen_string_literal: true

class ClientsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user!, only: :destroy
  before_action :set_client, only: %i[show edit update destroy]
  before_action :set_filter_params, only: :index

  def index
    respond_to do |format|
      format.html
      format.json { render json: ClientDatatable.new(params, view_context: view_context) }
    end
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
      redirect_to @client, flash: { success: 'Client has been updated successfully.' }
    else
      render :edit
    end
  end

  def destroy
    if @client.destroy
      redirect_to clients_path, flash: { success: 'Client has been deleted successfully.' }
    else
      redirect_to clients_path, flash: { error: @client.errors.full_messages.first }
    end
  end

  private

  def client_params
    params.require(:client).permit(:title, :name, :email, :phone)
  end

  def authorize_user!
    return unless demo_mode?

    redirect_to clients_path, flash: { info: 'Sorry, the requested action is not permitted in demo mode.' }
  end

  def set_client
    @client = Client.friendly.find(params[:id])
  end

  def set_filter_params
    @filter_params = params.fetch(:filter, {})
  end
end
