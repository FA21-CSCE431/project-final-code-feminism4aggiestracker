# location: spec/unit/unit_spec.rb
require 'rails_helper'

#unit tests using ytvideo Testing with RSpec
# https://www.youtube.com/watch?v=71eKcNxwxVY
RSpec.describe Book, type: :model do
	context 'validation tests' do
		it 'check title' do
			book = Book.new(author: 'Isaac Asimov', price: '12.99', published_date: '2020/08/15').save
			expect(book).to eq(false)
		end
		it 'check author' do
			book = Book.new(title: 'Foundation', price: '12.99', published_date: '2020/08/15').save
			expect(book).to eq(false)
		end
		it 'check price' do
			book = Book.new(title: 'Foundation', author: 'Isaac Asimov', published_date: '2020/08/15').save
			expect(book).to eq(false)
		end
		it 'check date' do
			book = Book.new(title: 'Foundation', author: 'Isaac Asimov', price: '12.99').save
			expect(book).to eq(false)
		end
	end
end

#	subject do
#		described_class.new(title: 'Foundation')
#	end
#	it 'is valid with valid attributes' do
#		expect(subject).to be_valid
#	end
#	it 'is not valid without a name' do
#		subject.title = nil
#		expect(subject).not_to be_valid
#	end
#end
