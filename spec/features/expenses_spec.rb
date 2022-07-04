require 'rails_helper'

RSpec.describe 'categories#new', type: :system do
  describe 'New' do
    before(:all) do
      User.destroy_all
      Category.destroy_all
    end
    before(:each) do
      @user = User.create(name: 'John Doe', email: 'john_doe@mail.com', password: '123456')
      @user.save
      @group = Category.new(name: 'Shopping', user_id: @user.id,
                            icon: Rack::Test::UploadedFile.new('spec/example.jpeg', 'image/jpeg'))
      @group.save
      visit new_user_session_path
      fill_in 'Email', with: 'john_doe@mail.com'
      fill_in 'Password', with: '123456'
      click_button 'Login'
      find('.category').click
    end

    it 'shows a new category' do
      expect(page).to have_content('Shopping')
    end

    it "has an 'Add Expense' button" do
      expect(page).to have_link('Add Expense')
    end

    it 'redirects to new expenses#new view' do
      click_link 'Add Expense'
      expect(page).to have_content('New Expense')
    end

    it 'shows the amount field' do
      click_link 'Add Expense'
      expect(page).to have_field('Amount')
    end

    it 'creates a new expense' do
      click_link 'Add '
      fill_in 'Name', with: 'Eggs'
      fill_in 'Amount', with: '100'
      click_button 'Add Expense'
      expect(page).to have_content('Shopping')
    end
  end
end
