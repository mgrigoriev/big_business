class ClientDatatable < AjaxDatatablesRails::ActiveRecord
  def view_columns
    @view_columns ||= {
      id: { source: 'Client.id', cond: :eq },
      title: { source: 'Client.title', cond: :like },
      name: { source: 'Client.name', cond: :like },
      email: { source: 'Client.email', cond: :like },
      phone: { source: 'Client.phone', searchable: false }
    }
  end

  def data
    records.map do |record|
      {
        id: record.id,
        title: record.title,
        name: record.name,
        email: record.email,
        phone: record.phone,
        DT_RowId: record.id
      }
    end
  end

  def get_raw_records
    Client.search(params[:filter])
  end
end
