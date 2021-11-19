require 'rails_helper'

RSpec.describe Bootstrap::Helpers do
  subject { helper.class }

  it { is_expected.to include described_class }

  describe '#link_to' do
    context 'when block not given' do
      subject { helper.link_to 'Link text', '#' }

      it { is_expected.to have_selector '.btn' }
    end

    context 'when block given' do
      subject do
        helper.link_to '#' do
          'Link text'
        end
      end

      it { is_expected.to have_selector '.btn' }
    end
  end

  describe '#button_to' do
    context 'when block not given' do
      subject { helper.button_to 'Button text', '#' }

      it { is_expected.to have_selector '.btn' }
    end

    context 'when block given' do
      subject do
        helper.button_to '#' do
          'Button text'
        end
      end

      it { is_expected.to have_selector '.btn' }
    end
  end
end
