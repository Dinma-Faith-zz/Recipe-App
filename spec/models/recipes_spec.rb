require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'Recipe model' do
    before(:each) do
      @user = User.create name: 'Joe', email: 'joe@example.com', password: 'password'
    end

    it 'the name must not be blank' do
      recipe = Recipe.create name: '', preparation_time: 15, cooking_time: 25, description: 'description here',
                             public: true, user: @user
      expect(recipe).to_not be_valid
    end
  end
end