# location: spec/feature/integration_spec.rb
require 'rails_helper'

def login
  Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google]
  #visit logins_path
  #click_link 'Sign In'
  visit admin_google_oauth2_omniauth_authorize_path
end

RSpec.describe 'test points: ', type: :feature do
	scenario 'valid points' do
		visit new_member_path
		fill_in 'Name', with: 'Jacob'
		select false, :from => 'member_isAdmin'
		select false, :from => 'member_isOwner'
		fill_in 'member_totalPoints', with: '110'
		click_on 'Create Member'
		visit members_path
		expect(page).to have_content('110')
	end
	scenario 'invalid points' do
		visit members_path
		expect(page).not_to have_content('1000000')
	end
end
