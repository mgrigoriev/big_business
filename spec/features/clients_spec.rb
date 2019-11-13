# frozen_string_literal: true

require 'rails_helper'

feature 'User can manage clients:' do
  given(:user) { create(:user) }

  background do
    login(user)
    click_link 'Clients', match: :first
  end

  describe 'creation' do
    background { click_button 'Add client' }

    scenario 'creates a new client', js: true do
      fill_in 'Title', with: 'The first client'
      fill_in 'Name',  with: 'John'
      fill_in 'Email', with: 'john@example.com'
      fill_in 'Phone', with: '111222333'
      click_on 'Save'

      expect(current_path).to eq client_path(Client.last)

      ['The first client', 'John', 'john@example.com', '111222333'].each do |value|
        expect(page).to have_content(value)
      end
    end

    scenario 'enters invalid data', js: true do
      click_on 'Save'

      expect(page).to have_content "can't be blank"
    end
  end

  describe 'list and filter' do
    given!(:clients) { create_list(:client, 3) }

    background do
      visit clients_path
    end

    scenario 'without filter', js: true do
      wait_for_ajax

      clients.each do |client|
        expect(page).to have_content(client.title).
          and(have_content(client.name)).
          and(have_content(client.email)).
          and(have_content(client.phone))
      end
    end

    scenario 'by title', js: true do
      fill_in 'filter-term', with: clients.third.title
      wait_for_ajax

      within '.js-datatable--filtered' do
        expect(page).to     have_content clients.third.title
        expect(page).not_to have_content clients.first.title
        expect(page).not_to have_content clients.second.title
      end
    end

    scenario 'by name', js: true do
      fill_in 'filter-term', with: clients.first.name
      wait_for_ajax

      within '.js-datatable--filtered' do
        expect(page).to     have_content clients.first.title
        expect(page).not_to have_content clients.second.title
        expect(page).not_to have_content clients.third.title
      end
    end

    scenario 'by email', js: true do
      fill_in 'filter-term', with: clients.second.email
      wait_for_ajax

      within '.js-datatable--filtered' do
        expect(page).to     have_content clients.second.title
        expect(page).not_to have_content clients.first.title
        expect(page).not_to have_content clients.third.title
      end
    end
  end

  describe 'editing' do
    given!(:client) { create(:client) }

    background do
      visit clients_path
      wait_for_ajax
    end

    scenario 'edits client', js: true do
      click_on "edit-#{client.id}"

      fill_in 'Title', with: 'The first client'
      fill_in 'Name',  with: 'John'
      fill_in 'Email', with: 'john@example.com'
      fill_in 'Phone', with: '111222333'
      click_on 'Save'

      expect(current_path).to eq client_path(client)

      ['The first client', 'John', 'john@example.com', '111222333'].each do |value|
        expect(page).to have_content(value)
      end
    end
  end

  describe 'deleting' do
    given!(:client) { create(:client) }

    background do
      visit clients_path
      wait_for_ajax
    end

    scenario 'deletes client', js: true do
      expect(page).to have_content client.title

      accept_confirm 'Are you sure?' do
        click_on "delete-#{client.id}"
      end

      expect(current_path).to eq clients_path
      expect(page).not_to have_content client.title
    end
  end
end
