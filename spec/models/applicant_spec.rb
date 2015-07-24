require 'rails_helper'

RSpec.describe Applicant, :type => :model do

  describe 'validations' do
    it {is_expected. to validate_presence_of(:name)}
    it {is_expected. to validate_presence_of(:email)}
  end
end
