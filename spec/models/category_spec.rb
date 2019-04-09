require 'rails_helper'

RSpec.describe Category, type: :model do
  before(:each) do
    @rand_number = rand(10_000)
    @category_w_slug = FactoryBot.create(:category, name: "СЛОВО#{@rand_number}", slug: "СЛОВО#{@rand_number}")
    @category_w_same_slug = FactoryBot.create(:category, name: "СЛОВО#{@rand_number}", slug: "СЛОВО#{@rand_number}")
    @category_w_o_slug = FactoryBot.create(:category, name: "БУКВА#{@rand_number}", slug: nil)
  end

  context 'Validations of name presence' do
    it { should validate_presence_of :name }
  end

  context 'Association with Item' do
    it { should have_many(:items).dependent(:nullify) }
  end

  context 'When the slug is setting up' do
    context 'in uppercase and cyrillic' do
      it 'save slug in lowercase and latin' do
        expect(@category_w_slug.slug).to eq "slovo#{@rand_number}"
      end
    end

    context 'as existed' do
      it 'save category and make uniq slug' do
        expect(@category_w_same_slug.slug).not_to eq "slovo#{@rand_number}"
        expect(@category_w_same_slug.slug).to include "slovo#{@rand_number}"
      end
    end
  end

  context 'When the slug is not specified explicitly' do
    it 'save slug as name' do
      expect(@category_w_o_slug.slug).to eq "bukva#{@rand_number}"
    end
  end
end
