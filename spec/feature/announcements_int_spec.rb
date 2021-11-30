# location: spec/feature/integration_spec.rb
require 'rails_helper'

def login
  Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google]
  #visit logins_path
  #click_link 'Sign In'
  visit admin_google_oauth2_omniauth_authorize_path
end

RSpec.describe 'test announcements: ', type: :feature do
	scenario 'valid announcement' do
    login
		visit announcements_path
		fill_in 'announcement_title', with: 'Hello World'
		fill_in 'announcement_message', with: 'Hello World is our message!'
		click_on 'Post'
		expect(page).to have_content('Hello World')
		expect(page).to have_content('Hello World is our message!')
	end
	scenario 'edit annnoucements' do
    login
		visit announcements_path
		fill_in 'announcement_title', with: 'Temp123'
		fill_in 'announcement_message', with: 'Temp-message'
		click_on 'Post'
		expect(page).to have_content('Temp123')
		expect(page).to have_content('Temp-message')
		click_on 'edit'
		fill_in 'announcement_message', with: 'message123'
		click_on 'commit'
		visit announcements_path
		expect(page).to have_content('message123')
	end
	scenario 'delete announcement' do
    login
		visit announcements_path
		fill_in 'announcement_title', with: 'Temp'
		fill_in 'announcement_message', with: 'Temp message'
		click_on 'Post'
		expect(page).to have_content('Temp')
		expect(page).to have_content('Temp message')
		click_on 'delete'
		click_on 'Confirm Delete'
		expect(page).not_to have_content('Temp')
		expect(page).not_to have_content('Temp message')
	end
end
