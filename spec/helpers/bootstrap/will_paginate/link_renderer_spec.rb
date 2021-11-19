require 'rails_helper'

RSpec.describe Bootstrap::WillPaginate::LinkRenderer do
  let(:link_renderer) { described_class.new }
  let(:current_page) { 2 }
  # let(:total_pages) { 5 }

  before do
    collection = instance_double('collection')
    allow(collection).to receive(:current_page).and_return current_page
    # allow(collection).to receive(:total_pages).and_return total_pages
    link_renderer.instance_variable_set :@collection, collection
    link_renderer.instance_variable_set :@options, {}
    link_renderer.instance_variable_set :@template, helper
    allow(helper).to receive(:url_for)
  end

  describe '#page_number' do
    subject { link_renderer.send :page_number, page }

    context 'when current page' do
      let(:page) { 2 }

      it { is_expected.to have_selector '.page-item.active .page-link' }
    end

    context 'when not current page' do
      let(:page) { 1 }

      it { is_expected.to have_selector '.page-item .page-link' }
    end
  end

  describe '#previous_or_next_page' do
    subject { link_renderer.send :previous_or_next_page, page, 'text', 'classname' }

    context 'when previous or next page' do
      let(:page) { 3 }

      it { is_expected.to have_selector '.page-item .page-link' }
    end

    context 'when not previous or next page' do
      let(:page) { false }

      it { is_expected.to have_selector '.page-item.disabled .page-link' }
    end
  end

  describe '#html_container' do
    subject { link_renderer.send :html_container, 'html' }

    it { is_expected.to have_selector '.pagination' }
  end
end
