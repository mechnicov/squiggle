RSpec.feature 'User tries to use admin dashboard', type: :feature do
  let(:user) { FactoryBot.create(:user) }

  before(:each) do
    login_as user
  end

  scenario 'unsuccessfully' do
    visit '/'
    expect(page).not_to have_content 'Панель управления'

    visit '/admin'
    expect(page).to have_content I18n.t('not_authorized')
    expect(page).to have_current_path '/'
  end
end
