require 'rails_helper'
RSpec.describe Products::Index, type: :interaction do
  subject(:interaction) { described_class }
  
  describe '.run' do
    subject(:run) { interaction.run(params) }

    let!(:product1) { FactoryBot.create(:product, name: 'A', description: 'E') }
    let!(:product2) { FactoryBot.create(:product, name: 'B', description: 'B') }
    let!(:product3) { FactoryBot.create(:product, name: 'C', description: 'G') }
    let!(:product4) { FactoryBot.create(:product, name: 'D', description: 'Z') }
    let!(:product5) { FactoryBot.create(:product, name: 'E', description: 'A') }
    let(:params) { { page: 1, limit: 5, sorting_field: 'id', sorting_order: 'asc' } }
    context 'when valid parameters are provided' do
      it 'returns paginated products with defined default params' do
        expect(run).to be_valid
        expect(run.result.pluck(:name)).to eq(['A', 'B', 'C', 'D', 'E'])
      end
    end

    context 'when sorting by name in descending order' do
      it 'returns products sorted by name in descending order' do
        params[:sorting_field] = 'name'
        params[:sorting_order] = 'desc'
        expect(run).to be_valid
        expect(run.result.pluck(:name)).to eq(['E', 'D', 'C', 'B', 'A'])
      end
    end

    context 'when sorting by description in descending order' do
      it 'returns products sorted by description in ascending order' do
        params[:sorting_field] = 'description'
        params[:sorting_order] = 'asc'
        expect(run).to be_valid
        expect(run.result.pluck(:description)).to eq(["A", "B", "E", "G", "Z"])
      end
    end

    context 'when page param limit present' do
      it 'returns products sorted by description in ascending order' do
        params[:page] = 2
        params[:limit] = 2
        expect(run).to be_valid
        expect(run.result.size).to eq(2)
      end

      it 'returns products sorted by description in ascending order' do
        params[:page] = 3
        params[:limit] = 2
        expect(run).to be_valid
        expect(run.result.size).to eq(1)
      end
    end
    
    describe 'validations' do
      it 'validates the sorting field' do
        params[:sorting_field] = 'Date'
        expect(run).to be_invalid
        expect(run.errors.full_messages).to include("Sorting field is not included in the list")
      end

      it 'validates the sorting order' do
        params[:sorting_order] = 'SQL Injection'
        expect(run).to be_invalid
        expect(run.errors.full_messages).to include("Sorting order is not included in the list")
      end
    end
  end
end
