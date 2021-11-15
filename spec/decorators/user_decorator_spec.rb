require 'rails_helper'

RSpec.describe UserDecorator, type: :decorator do
  subject(:decorated) { user }

  let(:user) { ActiveDecorator::Decorator.instance.decorate(build(:user)) }

  it { is_expected.to be_a User }

  it { expect(decorated.prefecture_name).to be_present }
end
