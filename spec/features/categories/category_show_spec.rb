require 'rails_helper'

RSpec.feature 'Category Show', type: :feature do
  before(:each) do
    @user = User.create(name: 'Mre Misg', email: 'mre@example.com', password: 'password')
    @category = Category.create(name: 'Shopping', icon: 'https://i.imgur.com/Ar3Lf3Dt.png', user_id: @user.id)
    visit user_session_path
    fill_in 'Email', with: 'mre@example.com'
    fill_in 'Password', with: 'password'
    click_button
    click_link('Shopping')
  end

  it 'Navigate to the show category' do
    expect(page).to have_current_path(category_path(@category))
  end

  it 'show Catgory Details heading' do
    expect(page).to have_content 'Category Details'
  end

  it 'show category name' do
    expect(page).to have_content @category.name
  end

  it 'Navigate to the create transaction' do
    click_link('Add transaction')
    expect(page).to have_current_path(new_category_expense_path(@category))
  end
end
