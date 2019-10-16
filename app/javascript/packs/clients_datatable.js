$(document).ready(function() {
  const dataTableSelector = '#clients-datatable';
  const filtersSelector = '.js-clients__filter-term';
  const termFieldSelector = '.js-clients__filter-term';

  const dataTable = $(dataTableSelector).dataTable({
    'responsive': false,
    'processing': true,
    'serverSide': true,
    'ajax': {
      'url': $(dataTableSelector).data('source'),
      'data': function (d) {
        d.filter = {
          'term': $(termFieldSelector).val()
        }
      }
    },
    'pagingType': 'full_numbers',
    // 'dom':
    //    "<'row'<'col-sm-12'tr>>" +
    //    "<'well'" +
    //      "<'row'<'col-sm-5'i><'col-sm-7'p>>" +
    //      "<'row'<'col-sm-12'l>>" +
    //    ">",
    'columns': [
      {'data': 'id'},
      {'data': 'title'},
      {'data': 'name'},
      {'data': 'email'},
      {'data': 'phone'}
    ],
    'fnDrawCallback': function (oSettings) {
       const response = this.api().ajax.json();

       // $('.total-amount').html(response.totalAmount);
       // $('.costs-amount').html(response.costsAmount);
       // $('.profit-amount').html(response.profitAmount);
    }
  });

  $(document).on('keyup',  filtersSelector, function() { updateDataTable(dataTable); });
  $(document).on('change', filtersSelector, function() { updateDataTable(dataTable); });
  $(document).on('paste',  filtersSelector, function() { updateDataTable(dataTable); });
});

function updateDataTable(dataTable) {
  dataTable.fnDraw();
}
