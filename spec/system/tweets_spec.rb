require 'rails_helper'

RSpec.describe "ツイート機能", type: :system do
  let(:user) { FactoryBot.create(:user) }

  before do
    sign_in user
    visit root_path
  end

  scenario "ユーザーはツイートできる" do
    click_link "ツイート"

    expect {
      fill_in "いまどうしてる？", with: "railsなう。"
      click_button "ツイート"
    }.to change(user.tweets, :count).by(1)

    expect(page).to have_content "ツイートしました。"
    expect(current_path).to eq tweets_path
  end
end
