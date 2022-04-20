require 'rails_helper'

RSpec.feature 'Signup', type: :feature do
  it 'can enter a name and receive a greeting' do
    visit new_user_registration_path
    expect(page).to have_content 'REGISTER'
  end

  it 'click the login error' do
    visit 'users/sign_up'
    click_button
    expect(page).to have_content "Email can't be blank"
  end

  it 'click the login error' do
    User.create(name: 'Mre Mis', email: 'hello@example.com', password: 'password')
    visit 'users/sign_up'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    click_button
    expect(page).to have_content "Name can't be blank"
  end

  it 'click the login error' do
    visit 'users/sign_up'
    fill_in 'Name', with: 'Mre Misg'
    fill_in 'Email', with: 'mre@example.com'
    fill_in 'Password', with: 'password'
    click_button
    expect(page).to have_content 'Categories'
  end
end
