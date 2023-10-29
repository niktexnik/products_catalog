require 'rails_helper'
require 'redis'

RSpec.describe Sessions::Create do
  subject(:interaction) { described_class }
  describe '.run' do
    subject(:run) { interaction.run(params) }
    let!(:token) { FactoryBot.create(:temporary_token_storage) }
    let(:params) { { email: token.email, token: token.token, code: token.code } }

    after do
      REDIS_CURRENT.set(token.email, params[:token], ex: 3000)
    end
    it 'returns valid' do
      expect(run).to be_valid
      expect(run.result).to have_attributes(id: run.result.id, auth_token: run.result.auth_token, email: token.email)
    end

    context 'when user not pass email' do
      before do
        params.delete(:email)
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

    context 'when user not pass token' do
      before do
        params.delete(:token)
      end
      
     it 'returns invalid' do
        expect(run).to be_invalid
        expect(run.errors.full_messages).to include("Token is required")
      end
    end

    context 'when user pass blank token' do
      before do
        params[:token] = ''
      end
      
      it 'returns invalid' do
        expect(run).to be_invalid
        expect(run.errors.full_messages).to include("Token can't be blank")
      end
    end
  
    context 'when user not pass code' do
      before do
        params.delete(:code)
      end
      
      it 'returns invalid' do
        expect(run).to be_invalid
      end
    end

    context 'when user pass blank code' do
      before do
        params[:code] = ''
      end
      
      it 'returns invalid' do
        expect(run).to be_invalid
        expect(run.errors.full_messages).to include("Code is required")
      end
    end

    context 'when user pass wrong code' do
      before do
        params[:code] = 888888
      end
      
      it 'returns invalid' do
        expect(run).to be_invalid
        expect(run.errors.full_messages).to include("Error Not verifyed!")
      end
    end

    context 'when user pass wrong email' do
      before do
        params[:email] = 'vas222@ya.ru'
      end
      
      it 'returns invalid' do
        expect(run).to be_invalid
        expect(run.errors.full_messages).to include("Error Not verifyed!")
      end
    end

    context 'when user not pass wrong code' do
      before do
        params[:token] = 'afkdbsknaskjfnjnafj324234'
      end
      
      it 'returns invalid' do
        expect(run).to be_invalid
        expect(run.errors.full_messages).to include("Error Not verifyed!")
      end
    end

    context 'when user not input code 60 sec' do
      before do
        REDIS_CURRENT.del(token.email)
      end
      
      it 'returns invalid' do
        expect(run).to be_invalid
        expect(run.errors.full_messages).to include("Error Your code was expired, please get it again")
      end
    end
  end
end
