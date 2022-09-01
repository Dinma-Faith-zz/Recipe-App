require 'rails_helper'

RSpec.describe 'Public recipes view', type: :feature do
  describe 'PublicRecipes#index' do
    before(:each) do
      user = User.create! name: 'Micro', email: 'micro@example.com', password: 'password'
      (1..5).each do |i|
        user.recipes.create name: "Recipe number #{i}", preparation_time: 60, cooking_time: 90,
                            description: 'Steps goes here', public: true
      end

      visit new_user_session_path
      fill_in 'Email', with: 'tom@example.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      visit public_recipes_path
    end

    it 'should see the header' do
      expect(page).to have_content 'Public Recipes'
    end
  end
end