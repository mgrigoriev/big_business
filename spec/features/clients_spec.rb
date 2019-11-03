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

    background { visit clients_path }

    scenario 'without filter', js: true do
      clients.each do |client|
        expect(page).to have_content(client.title).
          and(have_content(client.name)).
          and(have_content(client.email)).
          and(have_content(client.phone))
      end
    end

    scenario 'by title', js: true do
      fill_in 'filter-term', with: clients.third.title

      expect(page).to     have_content clients.third.title
      expect(page).to_not have_content clients.first.title
      expect(page).to_not have_content clients.second.title
    end

    scenario 'by name', js: true do
      fill_in 'filter-term', with: clients.first.name

      expect(page).to     have_content clients.first.title
      expect(page).to_not have_content clients.second.title
      expect(page).to_not have_content clients.third.title
    end

    scenario 'by email', js: true do
      fill_in 'filter-term', with: clients.second.email

      expect(page).to     have_content clients.second.title
      expect(page).to_not have_content clients.first.title
      expect(page).to_not have_content clients.third.title
    end
  end

  describe 'editing' do
    given!(:client) { create(:client) }

    background { visit clients_path }

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

    background { visit clients_path }

    scenario 'deletes client', js: true do
      expect(page).to have_content client.title

      click_on "delete-#{client.id}"

      expect(current_path).to eq clients_path
      expect(page).to_not have_content client.title
    end
  end
end
