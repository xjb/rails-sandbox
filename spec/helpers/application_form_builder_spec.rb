require 'rails_helper'

RSpec.describe ApplicationFormBuilder do
  subject(:builder) { described_class.new(object_name, object, helper, options) }

  # NOTE: https://github.com/rails/rails/blob/main/actionview/lib/action_view/helpers/form_helper.rb#L1677
  let(:object_name) { helper.model_name_from_record_or_class(object).param_key }
  let(:object) { build :user }
  let(:options) { {} }

  it { is_expected.to be_a described_class }

  describe '#enum_select' do
    subject { builder.enum_select(:role) }

    context 'when rendered content' do
      it { is_expected.to have_selector 'select' }
      it { is_expected.to have_selector 'option', text: 'administrator' }
      it { is_expected.to have_selector 'option', text: 'manager' }
      it { is_expected.to have_selector 'option', text: 'supporter' }
      it { is_expected.to have_selector 'option', text: 'customer' }
      it { is_expected.to have_selector 'option', text: 'guest' }
    end
  end
end
