require 'rails_helper'

RSpec.describe Bootstrap::FormBuilder do
  subject(:builder) { described_class.new(object_name, object, helper, options) }

  # NOTE: https://github.com/rails/rails/blob/main/actionview/lib/action_view/helpers/form_helper.rb#L1677
  let(:object_name) { :dummy }
  let(:object) { instance_double('DummyModel', attr: 'Dummy value') }
  let(:options) { {} }

  describe '#text_field' do
    subject { builder.text_field :attr }

    context 'when rendered content' do
      it { is_expected.to have_selector '.form-control' }
    end
  end

  describe '#password_field' do
    subject { builder.password_field :attr }

    context 'when rendered content' do
      it { is_expected.to have_selector '.form-control' }
    end
  end

  describe '#text_area' do
    subject { builder.text_area :attr }

    context 'when rendered content' do
      it { is_expected.to have_selector '.form-control' }
    end
  end

  describe '#color_field' do
    subject { builder.color_field :attr }

    context 'when rendered content' do
      it { is_expected.to have_selector '.form-control.form-control-color' }
    end
  end

  describe '#search_field' do
    subject { builder.search_field :attr }

    context 'when rendered content' do
      it { is_expected.to have_selector '.form-control' }
    end
  end

  describe '#telephone_field' do
    subject { builder.telephone_field :attr }

    context 'when rendered content' do
      it { is_expected.to have_selector '.form-control' }
    end
  end

  describe '#phone_field' do
    subject { builder.phone_field :attr }

    context 'when rendered content' do
      it { is_expected.to have_selector '.form-control' }
    end
  end

  describe '#date_field' do
    subject { builder.date_field :attr }

    let(:object) { instance_double('DummyModel', attr: Time.zone.today) }

    context 'when rendered content' do
      it { is_expected.to have_selector '.form-control' }
    end
  end

  describe '#time_field' do
    subject { builder.time_field :attr }

    let(:object) { instance_double('DummyModel', attr: Time.zone.now) }

    context 'when rendered content' do
      it { is_expected.to have_selector '.form-control' }
    end
  end

  describe '#datetime_field' do
    subject { builder.datetime_field :attr }

    let(:object) { instance_double('DummyModel', attr: Time.zone.now) }

    context 'when rendered content' do
      it { is_expected.to have_selector '.form-control' }
    end
  end

  describe '#datetime_local_field' do
    subject { builder.datetime_local_field :attr }

    let(:object) { instance_double('DummyModel', attr: Time.zone.now) }

    context 'when rendered content' do
      it { is_expected.to have_selector '.form-control' }
    end
  end

  describe '#month_field' do
    subject { builder.month_field :attr }

    let(:object) { instance_double('DummyModel', attr: Time.zone.today) }

    context 'when rendered content' do
      it { is_expected.to have_selector '.form-control' }
    end
  end

  describe '#week_field' do
    subject { builder.week_field :attr }

    let(:object) { instance_double('DummyModel', attr: Time.zone.today) }

    context 'when rendered content' do
      it { is_expected.to have_selector '.form-control' }
    end
  end

  describe '#url_field' do
    subject { builder.url_field :attr }

    context 'when rendered content' do
      it { is_expected.to have_selector '.form-control' }
    end
  end

  describe '#email_field' do
    subject { builder.email_field :attr }

    context 'when rendered content' do
      it { is_expected.to have_selector '.form-control' }
    end
  end

  describe '#number_field' do
    subject { builder.number_field :attr }

    context 'when rendered content' do
      it { is_expected.to have_selector '.form-control' }
    end
  end

  describe '#range_field' do
    subject { builder.range_field :attr }

    context 'when rendered content' do
      it { is_expected.to have_selector '.form-range' }
    end
  end

  describe '#label' do
    subject { builder.label :attr }

    context 'when rendered content' do
      it { is_expected.to have_selector '.form-label' }
    end
  end

  describe '#check_box' do
    subject { builder.check_box :attr }

    context 'when rendered content' do
      it { is_expected.to have_selector '.form-check-input' }
    end
  end

  describe '#radio_button' do
    subject { builder.radio_button :attr, true }

    context 'when rendered content' do
      it { is_expected.to have_selector '.form-check-input' }
    end
  end

  describe '#file_field' do
    subject { builder.file_field :attr }

    context 'when rendered content' do
      it { is_expected.to have_selector '.form-control' }
    end
  end

  describe '#submit' do
    before do
      allow(object).to receive(:persisted?).and_return false
    end

    context 'when rendered content' do
      subject { builder.submit }

      it { is_expected.to have_selector '.btn' }
    end

    context 'when rendered content with option' do
      subject { builder.submit id: 'dummy' }

      it { is_expected.to have_selector '.btn' }
    end
  end

  describe '#button' do
    before do
      allow(object).to receive(:persisted?).and_return false
    end

    context 'when rendered content' do
      subject { builder.button }

      it { is_expected.to have_selector '.btn' }
    end

    context 'when rendered content with option' do
      subject { builder.button id: 'dummy' }

      it { is_expected.to have_selector '.btn' }
    end
  end

  describe '#select' do
    subject { builder.select :attr, choices }

    let(:choices) { [] }

    context 'when rendered content' do
      it { is_expected.to have_selector '.form-select' }
    end
  end

  describe '#collection_select' do
    subject { builder.collection_select :attr, collection, value_method, text_method }

    let(:collection) { [] }
    let(:value_method) { :first }
    let(:text_method) { :last }

    context 'when rendered content' do
      it { is_expected.to have_selector '.form-select' }
    end
  end

  describe '#grouped_collection_select' do
    subject do
      builder.grouped_collection_select :id, collection, group_method, group_label_method, option_key_method,
                                        option_value_method
    end

    let(:object) do
      instance_double('DummyModel', id: 'Dummy id', name: 'Dummy name', group_id: 'gid', group_name: 'group_name')
    end
    let(:collection) { [] }
    let(:group_method) { :group_id }
    let(:group_label_method) { :group_name }
    let(:option_key_method) { :id }
    let(:option_value_method) { :name }

    context 'when rendered content' do
      it { is_expected.to have_selector '.form-select' }
    end
  end

  describe '#time_zone_select' do
    subject { builder.time_zone_select :attr }

    context 'when rendered content' do
      it { is_expected.to have_selector '.form-select' }
    end
  end

  describe '#collection_check_boxes' do
    subject { builder.collection_check_boxes :id, collection, value_method, text_method }

    let(:object) { instance_double('DummyModel', id: 'Dummy id', name: 'Dummy name') }
    let(:collection) { [object] }
    let(:value_method) { :id }
    let(:text_method) { :name }

    context 'when rendered content' do
      it { is_expected.to have_selector '.form-check-input' }
    end
  end

  describe '#collection_radio_buttons' do
    subject { builder.collection_radio_buttons :id, collection, value_method, text_method }

    let(:object) { instance_double('DummyModel', id: 'Dummy id', name: 'Dummy name') }
    let(:collection) { [object] }
    let(:value_method) { :id }
    let(:text_method) { :name }

    context 'when rendered content' do
      it { is_expected.to have_selector '.form-check-input' }
    end
  end
end
