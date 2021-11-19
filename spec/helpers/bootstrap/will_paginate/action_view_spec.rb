require 'rails_helper'

RSpec.describe Bootstrap::WillPaginate::ActionView do
  subject { helper.class }

  it { is_expected.to include described_class }

  describe '#will_paginate' do
    let(:collection) { instance_double('relation') }

    before do
      allow(collection).to receive(:total_pages).and_return 5
      allow(collection).to receive(:current_page).and_return 2
      allow(helper).to receive(:url_for)
      allow(helper).to receive(:infer_collection_from_controller).and_return collection
    end

    context 'when options[:renderer] not given' do
      subject { helper.will_paginate collection }

      it { is_expected.to have_selector '.pagination .page-item .page-link' }
    end

    context 'when options[:renderer] given' do
      subject { helper.will_paginate collection, renderer: WillPaginate::ActionView::LinkRenderer }

      it { is_expected.to have_selector 'div' }
    end

    context 'when collection not given' do
      subject { helper.will_paginate renderer: nil }

      it { is_expected.to have_selector 'div' }
    end
  end
end
