require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'valid?' do
    subject { user }

    context 'when factory' do
      let(:user) { build :user }

      it { is_expected.to be_valid }
    end

    context 'when name is empty' do
      let(:user) { build :user, name: '' }

      it { is_expected.not_to be_valid }
    end

    context 'when name is present' do
      let(:user) { build :user, name: Faker::Name.name }

      it { is_expected.to be_valid }
    end
  end
end
