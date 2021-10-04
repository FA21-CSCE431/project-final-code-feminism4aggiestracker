# location: spec/feature/integration_spec.rb
require 'rails_helper'


#test for selecting members
RSpec.describe 'test member priv', type: :feature do
	scenario 'valid non-admin' do
		visit new_member_path
		fill_in 'name', with: 'Jack'
		select false, :from => 'member_isAdmin'
		select false, :from => 'member_isOwner'
		click_on 'Update Member'
		visit members_path
		expect(page).to have_content(false)
	end
end
