require 'rails_helper'

RSpec.describe 'items/show', type: :view do
  context 'Item price' do
    before(:each) do
      assign(:item, FactoryBot.build_stubbed(:item, price: 12359))
      render
    end

    it 'displays correctly' do
      expect(rendered).to match '123,59 ₽'
    end
  end
end
