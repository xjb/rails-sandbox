require 'rails_helper'

RSpec.describe UserActivateJob, type: :job do
  it 'enqueued' do
    described_class.perform_later
    assert_enqueued_jobs 1, only: described_class
  end

  it 'enqueued pattern 2' do
    assert_enqueued_jobs 1, only: described_class do
      described_class.perform_later
    end
  end

  it 'performed' do
    perform_enqueued_jobs do
      described_class.perform_later
    end
    assert_no_enqueued_jobs
  end
end
