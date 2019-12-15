// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from '@rails/ujs'
import * as ActiveStorage from '@rails/activestorage'
import * as DataTables from 'datatables.net-bs4'

import 'bootstrap'
import 'select2'
import 'select2/dist/css/select2.css'

import './bs_tooltips'
import './select2'
import './client_datatable'
import './order_datatable'
import './filter'

import '../stylesheets/application.scss'

Rails.start();
ActiveStorage.start();
DataTables(window, $);
