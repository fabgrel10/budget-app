require 'rails_helper'

RSpec.describe 'categories#index', type: :system do
  describe 'New' do
    before(:each) do
      User.create(name: 'John Doe', email: 'john_doe@mail.com', password: '123456')
      visit new_user_session_path
      fill_in 'Email', with: 'john_doe@mail.com'
      fill_in 'Password', with: '123456'
      click_button 'Login'
    end

    it 'shows the categories page' do
      expect(page).to have_content('Categories')
    end

    it "has  an 'Add Category' button" do
      expect(page).to have_link('Add Category')
    end

    it 'redirects to the categories#new page' do
      click_link 'Add Category'
      expect(page).to have_content('New Category')
    end
  end
end
