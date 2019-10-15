$(document).ready(function() {
  $('#clients-datatable').dataTable({
    'processing': true,
    'serverSide': true,
    'ajax': {
      'url': $('#clients-datatable').data('source')
    },
    'pagingType': 'full_numbers',
    'columns': [
      {'data': 'id'},
      {'data': 'title'},
      {'data': 'name'},
      {'data': 'email'},
      {'data': 'phone'}
    ]
    // pagingType is optional, if you want full pagination controls.
    // Check dataTables documentation to learn more about
    // available options.
  });
});
