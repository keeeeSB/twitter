require 'rails_helper'

RSpec.describe Tweet, type: :model do
  let(:tweet) { FactoryBot.create(:tweet) }

  it "ファクトリーが正常に動く" do
    expect(FactoryBot.build(:tweet)).to be_valid
  end

  it "正常な値を入力すると、ツイートできる" do
    user = FactoryBot.create(:user)
    tweet = user.tweets.create(
      content: "railsなう。"
    )
    expect(tweet).to be_valid
  end

  describe "バリデーションのテスト" do
    it "内容は必須である" do
      tweet.content = " "
      expect(tweet).to_not be_valid
    end
  end
end
