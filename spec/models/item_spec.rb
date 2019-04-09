require 'rails_helper'

RSpec.describe Item, type: :model do
  before(:each) do
    @rand_number = rand(10_000)
    @item_w_slug = FactoryBot.create(:item, name: "СЛОВО#{@rand_number}", slug: "СЛОВО#{@rand_number}")
    @item_w_same_slug = FactoryBot.create(:item, name: "СЛОВО#{@rand_number}", slug: "СЛОВО#{@rand_number}")
    @item_w_o_slug = FactoryBot.create(:item, name: "БУКВА#{@rand_number}", slug: nil)
  end

  context 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_numericality_of(:price).only_integer.is_greater_than(0) }
  end

  context 'Association with Category' do
    it { should belong_to(:category).optional }
  end

  context 'When the slug is setting up' do
    context 'in uppercase and cyrillic' do
      it 'save slug in lowercase and latin' do
        expect(@item_w_slug.slug).to eq "slovo#{@rand_number}"
      end
    end

    context 'as existed' do
      it 'save item and make uniq slug' do
        expect(@item_w_same_slug.slug).not_to eq "slovo#{@rand_number}"
        expect(@item_w_same_slug.slug).to include "slovo#{@rand_number}"
      end
    end
  end

  context 'When the slug is not specified explicitly' do
    it 'save slug as name' do
      expect(@item_w_o_slug.slug).to eq "bukva#{@rand_number}"
    end
  end
end
