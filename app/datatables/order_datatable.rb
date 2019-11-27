# frozen_string_literal: true

class OrderDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable

  def_delegators :@view, :manage_buttons_for, :edit_order_path, :order_path

  def initialize(params, opts = {})
    @view = opts[:view_context]
    super
  end

  def view_columns
    @view_columns ||= {
      id: { source: 'Order.id' },
      title: { source: 'Order.title' },
      status: { source: 'Order.status' },
      price: { source: 'Order.price_cents' },
      cost: { source: 'Order.cost_cents' },
      profit: { source: 'Order.profit' },
      invoice_number: { source: 'Order.invoice_number' },
      invoice_date: { source: 'Order.invoice_date' },
      actions: {}
    }
  end

  def data
    records.map do |record|
      {
        id: record.id,
        title: record.decorate.link,
        status: record.status,
        price: record.price.format,
        cost: record.cost.format,
        profit: record.profit.format,
        invoice_number: record.invoice_number,
        invoice_date: record.invoice_date,
        actions: manage_buttons_for(record, edit_path: edit_order_path(record), destroy_path: order_path(record)),
        DT_RowId: record.id
      }
    end
  end

  def get_raw_records # rubocop:disable Naming/AccessorMethodName
    Order.with_aggregates.search(params[:filter])
  end
end
