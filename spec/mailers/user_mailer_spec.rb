require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  describe '#sign_up' do
    subject(:mail) { described_class.sign_up }

    it { expect(mail.to).to eq ['notifications@example.com'] }
    it { expect(mail.from).to eq ['from@example.com'] }
    it { expect(mail.subject).to eq '[UserMailer] sign_up' }
    it { expect(mail.html_part.body).to match /html/ }
    it { expect(mail.text_part.body).to match /text/ }
  end
end
