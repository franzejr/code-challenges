require 'rails_helper'

RSpec.describe Company do

	describe 'validations' do
		it {is_expected. to validate_presence_of(:name)}
		it {is_expected. to validate_presence_of(:address)}
	end

end
