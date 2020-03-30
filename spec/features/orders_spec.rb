# frozen_string_literal: true

require 'rails_helper'

feature 'User can manage orders:' do
  include ActiveSupport::NumberHelper

  given(:user) { create(:user) }
  given!(:client) { create(:client) }

  background do
    login(user)
    click_link 'Orders', match: :first
  end

  describe 'creation' do
    background { click_button 'Add order' }

    scenario 'creates a new order', js: true do
      select client.title, from: 'Client'
      fill_in 'Title', with: 'The first order'
      fill_in 'Invoice number', with: '123'
      fill_in 'Price', with: '1000'
      fill_in 'Cost', with: '200'
      click_on 'Save'

      expect(page).to have_current_path order_path(Order.last)

      ['The first order', '123', '1,000', '200'].each do |value|
        expect(page).to have_content(value)
      end
    end

    scenario 'enters invalid data', js: true do
      click_on 'Save'

      expect(page).to have_content "can't be blank"
    end
  end

  describe 'list and filter' do
    given!(:orders) { create_list(:order, 3) }

    background { visit orders_path }

    scenario 'without filter', js: true do
      orders.each do |order|
        [
          order.client.title,
          order.title,
          order.status.humanize,
          order.invoice_number,
          number_to_currency(order.price),
          number_to_currency(order.cost)
        ].each do |value|
          expect(page).to have_content(value)
        end
      end
    end

    scenario 'by title', js: true do
      fill_in 'filter-term', with: orders.third.title
      wait_for_ajax

      within '.js-datatable--filtered' do
        expect(page).to have_content orders.third.title
        expect(page).not_to have_content orders.first.title
        expect(page).not_to have_content orders.second.title
      end
    end

    scenario 'by client', js: true do
      fill_in 'filter-term', with: orders.first.client.title
      wait_for_ajax

      within '.js-datatable--filtered' do
        expect(page).to have_content orders.first.title
        expect(page).not_to have_content orders.second.title
        expect(page).not_to have_content orders.third.title
      end
    end

    scenario 'by id', js: true do
      fill_in 'filter-term', with: orders.second.id
      wait_for_ajax

      within '.js-datatable--filtered' do
        expect(page).to have_content orders.second.title
        expect(page).not_to have_content orders.first.title
        expect(page).not_to have_content orders.third.title
      end
    end

    scenario 'by invoice number', js: true do
      fill_in 'filter-term', with: orders.third.invoice_number
      wait_for_ajax

      within '.js-datatable--filtered' do
        expect(page).to have_content orders.third.title
        expect(page).not_to have_content orders.first.title
        expect(page).not_to have_content orders.second.title
      end
    end

    scenario 'by status', js: true do
      orders.first.update(status: :done)
      select 'Done', from: 'status'

      expect(page).to have_content orders.first.title
      expect(page).to_not have_content orders.second.title
      expect(page).to_not have_content orders.third.title
    end
  end

  describe 'editing' do
    given!(:order) { create(:order) }
    given!(:another_client) { create(:client) }

    background { visit orders_path }

    scenario 'edits order', js: true do
      click_on "edit-#{order.id}"

      select another_client.title, from: 'Client'
      select 'Done', from: 'Status'
      fill_in 'Title', with: 'The first order'
      fill_in 'Invoice number', with: '123'
      fill_in 'Price', with: '1000'
      fill_in 'Cost', with: '200'
      click_on 'Save'

      expect(page).to have_current_path order_path(order), ignore_query: true

      [
        another_client.title,
        'Done',
        'The first order',
        '123',
        '1,000',
        '200',
        '800'
      ].each do |value|
        expect(page).to have_content(value)
      end
    end
  end

  describe 'deleting' do
    given!(:order) { create(:order) }

    background { visit orders_path }

    scenario 'deletes order', js: true do
      expect(page).to have_content order.title

      accept_confirm 'Are you sure?' do
        click_on "delete-#{order.id}"
      end

      expect(page).to have_current_path orders_path, ignore_query: true
      expect(page).not_to have_content order.title
    end
  end
end
