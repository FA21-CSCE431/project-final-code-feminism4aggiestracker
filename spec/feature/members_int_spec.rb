# location: spec/feature/integration_spec.rb
require 'rails_helper'

def login
  Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google]
  #visit logins_path
  #click_link 'Sign In'
  visit admin_google_oauth2_omniauth_authorize_path
end

#test for selecting members
RSpec.describe 'test member priv: ', type: :feature do
	scenario 'valid non-admin' do
    login
		visit new_member_path
		fill_in 'Name', with: 'Jack'
		select false, :from => 'member_isAdmin'
		select false, :from => 'member_isOwner'
		click_on 'Create Member'
		visit members_path
		expect(page).to have_content(false).twice
	end
	scenario 'valid admin' do
    login
		visit new_member_path
		fill_in 'Name', with: 'John'
		select true, :from => 'member_isAdmin'
		select false, :from => 'member_isOwner'
		click_on 'Create Member'
		visit members_path
		expect(page).to have_content(false)
		expect(page).to have_content(true)
	end
	scenario 'valid owner' do
    login
		visit new_member_path
		fill_in 'Name', with: 'Jen'
		select true, :from => 'member_isAdmin'
		select true, :from => 'member_isOwner'
		click_on 'Create Member'
		visit members_path
		expect(page).to have_content(true).twice
	end
end
