require 'rails_helper'

RSpec.describe MailgunMailer, type: :mailer do
  subject(:mail) {described_class}

  describe '#send_verify_code' do
    subject(:send_verify_code) { mail.send_verify_code(email, code) }

    let(:email) { 'user@example.com' }
    let(:code) { '123456' }
  
    it 'sends an email with the correct subject' do
      expect(send_verify_code.subject).to eq('Your authorization code')
    end

    it 'sends an email to the specified recipient' do
      expect(send_verify_code.to).to include(email)
    end

    it 'includes the code in the email body' do
      expect(send_verify_code.body.encoded).to include(code)
    end
  end
end
