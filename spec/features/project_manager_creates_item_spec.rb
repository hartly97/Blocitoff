require 'rails_helper'

 feature 'Project manager creates ITEM' do
   scenario 'Successfully' do
     visit new_item_path
     fill_in 'Description', with: 'Meet up with the team'
     click_button 'Save'
   end
 end
