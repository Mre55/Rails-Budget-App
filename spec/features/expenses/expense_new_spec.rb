require 'rails_helper'

RSpec.feature 'Expense new', type: :feature do
  before(:each) do
    @user = User.create(name: 'Mre Misg', email: 'mre@example.com', password: 'password')
    @category = Category.create(name: 'Shopping', icon: 'https://i.imgur.com/Ar3Lf3Dt.png', user_id: @user.id)
    visit user_session_path
    fill_in 'Email', with: 'mre@example.com'
    fill_in 'Password', with: 'password'
    click_button
    click_link('Shopping')
    click_link('Add transaction')
  end

  it 'show Add Transcation heading' do
    expect(page).to have_content 'Add Transaction'
  end

  it 'show category icon' do
    expect(page).to have_selector('input')
  end
  it 'display success message' do
    fill_in 'Name', with: 'eggs'
    fill_in 'Amount', with: 10
    click_button 'Create Transaction'
    expect(page).to have_content 'Transaction created successfully.'
  end
end
