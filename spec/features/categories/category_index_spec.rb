require 'rails_helper'

RSpec.feature 'Category Index', type: :feature do
  before(:each) do
    @user = User.create(name: 'Mihreteab Misganaw', email: 'mre@example.com', password: 'password')
    @category = Category.create(name: 'Shopping', icon: 'https://i.imgur.com/Ar3Lf3Dt.png', user_id: @user.id)
    visit user_session_path
    fill_in 'Email', with: 'mre@example.com'
    fill_in 'Password', with: 'password'
    click_button
  end

  it 'Login successfully' do
    expect(page).to have_current_path(root_path)
  end

  it 'show Categories heading' do
    expect(page).to have_content 'Categories'
  end

  it 'show category name' do
    expect(page).to have_content @category.name
  end

  it 'show category icon' do
    expect(page).to have_selector('img')
  end
  it 'Navigate to the create category' do
    click_link('Add Category')
    expect(page).to have_current_path(new_category_path)
  end
end
