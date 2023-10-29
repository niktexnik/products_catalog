require 'rails_helper'
require 'redis'

RSpec.describe Sessions::Login do
  subject(:interaction) { described_class }
  describe '.run' do
    subject(:run) { interaction.run(params) }

    let(:params) { { email: 'ololo@rspec.ru' } }

    it 'returns valid' do
      expect(run).to be_valid
    end

    context 'when user not pass email' do
      before do
        params[:email] = nil
      end
      
      it 'returns invalid' do
        expect(run).to be_invalid
        expect(run.errors.full_messages).to include("Email is required")
      end
    end

    context 'when user pass blank email' do
      before do
        params[:email] = ''
      end
      
      it 'returns invalid' do
        expect(run).to be_invalid
        expect(run.errors.full_messages).to include("Email can't be blank")
      end
    end

    context 'when user pass invalid email' do
      before do
        params[:email] = 'lolo'
      end
      
     it 'returns invalid' do
        expect(run).to be_invalid
        expect(run.errors.full_messages).to include("Wrong email please check your email")
      end
    end
  end
end
