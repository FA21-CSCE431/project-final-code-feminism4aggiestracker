# location: spec/feature/integration_spec.rb
require 'rails_helper'

def login
  Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google]
  #visit logins_path
  #click_link 'Sign In'
  visit admin_google_oauth2_omniauth_authorize_path
end


#test posts create new post
#FIXME - can't make posts without member_id (need to function with Oauth)
RSpec.describe 'test posts', type: :feature do
	scenario 'create new post' do
    login
		visit new_post_path
		fill_in 'post_title', with: 'Welcome New Members'
		fill_in 'post_body', with: 'We have some new members to introduce'
		click_on 'Create Post'
		visit posts_path
		expect(page).to have_content('Welcome New Members')
	end
  scenario 'edit post' do
    #FIXME
  end
  scenario 'delete post' do
    #FIXME
  end
end
