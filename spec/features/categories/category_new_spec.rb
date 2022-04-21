require 'rails_helper'

RSpec.feature 'Category New', type: :feature do
  before(:each) do
    @user = User.create(name: 'Mre Mis', email: 'mre@example.com', password: 'password')
    @group = Category.create(name: 'Shopping', icon: 'https://i.imgur.com/Ar3Lf3Dt.png', author_id: @user.id)
    visit user_session_path
    fill_in 'Email', with: 'mre@example.com'
    fill_in 'Password', with: 'password'
    click_button
    click_link('Add Category')
  end

  it 'Navigate to the create category' do
    expect(page).to have_current_path(new_category_path)
  end

  it 'show Add Catgory heading' do
    expect(page).to have_content 'Add Category'
  end

  it 'display success message' do
    fill_in 'Name', with: 'eggs'
    click_button 'Create Category'
    expect(page).to have_content 'Category created successfully.'
  end

  it 'show category icon' do
    expect(page).to have_selector('input')
  end
end
