RSpec.feature 'Admin tries to use admin dashboard', type: :feature do
  let(:user) { FactoryBot.create(:user, is_admin: true) }

  before(:each) do
    login_as user
  end

  scenario 'successfully' do
    visit '/'
    expect(page).to have_content 'Панель управления'

    click_link 'Панель управления'
    expect(page).to have_current_path '/admin'
  end
end
