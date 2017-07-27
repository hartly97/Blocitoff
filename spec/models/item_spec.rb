require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:user) { User.create!(email: "user@bloccit.com", password: "password") }
  let(:item) {Item.create!(name: "New item name", user_id: user)}

  it { is_expected.to belong_to(:user) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_length_of(:name).is_at_least(3) }
end
