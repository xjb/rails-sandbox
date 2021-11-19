require 'rails_helper'

RSpec.describe UsersHelper, type: :helper do
  subject { helper.class }

  it { is_expected.to include described_class }
end
