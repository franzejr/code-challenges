require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:message)}
    it { is_expected.to ensure_length_of(:message).is_at_most(140) }
  end
end
