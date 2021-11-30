# location: spec/feature/integration_spec.rb
require 'rails_helper'

def login
  Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google]
  #visit logins_path
  #click_link 'Sign In'
  visit admin_google_oauth2_omniauth_authorize_path
end

=begin
#FIXME - hardcoded so doesn't work with Oauth
RSpec.describe 'test likes', type: :feature do
	scenario 'valid inputs'do
		visit new_like_path
		fill_in 'member_id', with: '1'
		fill_in 'post_id', with: '1'
		click_on 'Create Like'
		visit likes_path
		expect(page).to have_content('1')
	end
end
=end

=begin
#test likes valid inputs
#modified 'Name', 'post_title', 'post_body'

#ActiveRecord::InvalidForeignKey:
       PG::ForeignKeyViolation: ERROR:  insert or update on table "posts" violates foreign key constraint "fk_rails_98586e02b8"
       DETAIL:  Key (member_id)=(1) is not present in table "members".

RSpec.describe 'test likes', type: :feature do
	scenario 'valid inputs'do
		visit new_member_path
		fill_in 'Name', with: 'Andrew'
		click_on 'Create Member'
		visit new_post_path
		fill_in 'post_title', with: 'test'
		fill_in 'post_body', with: 'this is a test'
		click_on 'Create Post'
		visit new_like_path
		#fill_in 'member_id', with: '1'
		#fill_in 'post_id', with: '1'
		click_on 'Create Like'
		visit post_path
		expect(page).to have_content('1')
	end
end
=end
