require 'rails_helper'

RSpec.describe Blog, type: :model do
  let!(:admin_user){ create(:admin_user) }

  it "titleがあれば有効な状態であること" do
    blog = build(:blog, user_id: admin_user.id)
    expect(blog).to be_valid
  end

  it "titleがなければ無効な状態であること" do
    blog = build(:blog, title: nil, user_id: admin_user.id)
    expect(blog).not_to be_valid
  end

end