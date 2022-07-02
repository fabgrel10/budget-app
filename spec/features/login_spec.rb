require 'rails_helper'
RSpec.describe 'Logins', type: :feature do
  before { visit new_user_session_path }

  it 'displays email field' do
    expect(page).to have_field('user[email]')
  end

  it 'displays password field' do
    expect(page).to have_field('user[password]')
  end

  it 'displays login button' do
    expect(page).to have_button('Login')
  end

  context 'Form Submission' do
    it 'wrong password' do
      within 'form' do
        fill_in 'Email', with: 'mymail@gmail.com'
        fill_in 'Password', with: ''
      end
      click_button 'Login'
      expect(page).to have_content 'Invalid Email or password.'
    end

    it 'correct details' do
      @user = User.create(name: 'Punzel', email: 'd@gmail.com', password: '123456')
      within 'form' do
        fill_in 'Email', with: @user.email
        fill_in 'Password', with: @user.password
      end
      click_button 'Login'
      expect(page).to have_current_path(root_path)
    end
  end
end
