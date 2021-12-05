# location: spec/feature/integration_spec.rb
require 'rails_helper'

def login
  Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google]
  #visit logins_path
  #click_link 'Sign In'
  visit admin_google_oauth2_omniauth_authorize_path
end

=begin
#test activities valid inputs
RSpec.describe 'test activities', type: :feature do
	scenario 'valid inputs' do
		visit new_activity_path
		fill_in 'name', with: 'Meeting'
		fill_in 'points', with: '10'
		click_on 'Create Activity'
		visit activity_path
		expect(page).to have_content('Meeting')
	end
end
=end
