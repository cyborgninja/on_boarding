require 'rails_helper'

RSpec.describe 'Blog管理', type: system do
  let!(:admin_user){ create(:admin_user) }
  before do
    login_as(admin_user, scope: :user)
    visit new_blog_url
  end

  scenario 'Blogの新規作成時にtitleを入力した場合はデータが保存され閲覧画面に遷移すること' do
    fill_in 'title', with: 'test_blog'
    expect {
      click_buttton 'Create Blog'
    }.to change(Blog, count).by(1)
    expect(current_path).to eq blogs_path
    expect(page).to have_content 'Blog was successfully created.'
  end

  scenario 'Blogの新規作成時にtitleを入力した場合にエラーが表示されること' do
    fill_in 'title', with: ''
    click_button 'Create Blog'
    expect(current_page).to have_content "can't be blank"
  end
end