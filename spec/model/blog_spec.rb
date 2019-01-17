require 'rails_helper'

describe Blog, type: :model do
  specify "titleがあれば有効な状態であること" do
    blog = Blog.new(title: "test")
    expect(blog).to be_valid
  end

  specify "titleがなければ無効な状態であること" do
    blog = Blog.new(title: "")
    expect(blog).not_to be_valid
  end
end
