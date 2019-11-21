class ClientDatatable {
  constructor() {
    // Selectors
    this.dataTableSelector = '#clients-datatable';
    this.termFieldSelector = '.js-clients__filter-term';

    // Bind 'this'
    this.init = this.init.bind(this);
    this.initDataTable = this.initDataTable.bind(this);
  }

  init() {
    $(document).ready(this.initDataTable);
  }

  initDataTable() {
    this.dataTable = $(this.dataTableSelector).dataTable({
      responsive: false,
      processing: true,
      serverSide: true,
      ajax: {
        url: $(this.dataTableSelector).data('source'),
        data: data => {
          data.filter = { term: $(this.termFieldSelector).val() }; // eslint-disable-line
        }
      },
      pagingType: 'full_numbers',
      dom:
        "<'row'<'col-sm-12'tr>>" +
        "<'datatable__controls-wrapper'" +
        "<'row'<'col-sm-5'i><'col-sm-7'p>>" +
        '>',
      columns: [
        { data: 'id' },
        { data: 'title' },
        { data: 'name' },
        { data: 'email' },
        { data: 'phone' },
        { data: 'actions', orderable: false }
      ],
      fnDrawCallback: () => {
        // const response = this.api().ajax.json();
        // $('.total-amount').html(response.totalAmount);
        // $('.costs-amount').html(response.costsAmount);
        // $('.profit-amount').html(response.profitAmount);
      }
    });
  }
}

const clientDatatable = new ClientDatatable();
clientDatatable.init();
