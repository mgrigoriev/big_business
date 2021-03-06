# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user!, only: :destroy
  before_action :set_order, only: %i[show edit update destroy]
  before_action :set_filter_params, only: :index

  def index
    respond_to do |format|
      format.html
      format.json { render json: OrderDatatable.new(params, view_context: view_context) }
    end
  end

  def show; end

  def new
    @order = Order.new
  end

  def edit; end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to @order, flash: { success: 'Order has been created successfully.' }
    else
      render :new
    end
  end

  def update
    if @order.update(order_params)
      redirect_to @order, flash: { success: 'Order has been updated successfully.' }
    else
      render :edit
    end
  end

  def destroy
    if @order.destroy
      redirect_to orders_path, flash: { success: 'Order has been deleted successfully.' }
    else
      redirect_to orders_path, flash: { error: @order.errors.full_messages.first }
    end
  end

  private

  def order_params
    params.require(:order).permit(
      :client_id, :title, :status, :invoice_number, :invoice_date, :price, :cost, :payed_amount
    )
  end

  def authorize_user!
    return unless demo_mode?

    redirect_to orders_path, flash: { info: 'Sorry, the requested action is not permitted in demo mode.' }
  end

  def set_order
    @order = Order.friendly.find(params[:id]).decorate
  end

  def set_filter_params
    @filter_params = params.fetch(:filter, {})
  end
end
