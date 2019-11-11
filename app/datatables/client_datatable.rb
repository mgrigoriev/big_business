class ClientDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable

  def_delegators :@view, :manage_buttons_for, :edit_client_path, :client_path

  def initialize(params, opts = {})
    @view = opts[:view_context]
    super
  end

  def view_columns
    @view_columns ||= {
      id: { source: 'Client.id', cond: :eq },
      title: { source: 'Client.title', cond: :like },
      name: { source: 'Client.name', cond: :like },
      email: { source: 'Client.email', cond: :like },
      phone: { source: 'Client.phone', searchable: false },
      actions: { searchable: false }
    }
  end

  def data
    records.map do |record|
      {
        id: record.id,
        title: record.decorate.link,
        name: record.name,
        email: record.email,
        phone: record.phone,
        actions: manage_buttons_for(record, edit_path: edit_client_path(record), destroy_path: client_path(record)),
        DT_RowId: record.id
      }
    end
  end

  def get_raw_records
    Client.search(params[:filter])
  end
end
