# location: spec/feature/integration_spec.rb
require 'rails_helper'

def login
  Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google]
  #visit logins_path
  #click_link 'Sign In'
  visit admin_google_oauth2_omniauth_authorize_path
end

RSpec.describe 'test events', type: :feature do
	scenario 'create new event' do
		visit new_event_path
		fill_in 'event_name', with: 'General Meeting'
		select '2021', :from => 'event_date_1i'
		select 'October', :from => 'event_date_2i'
		select '12', :from => 'event_date_3i'
		#select false, :from => 'event_status' #ERROR can't edit
		click_on 'Create Event'
		visit events_path
		expect(page).to have_content('General Meeting')
	end
end
