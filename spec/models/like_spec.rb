require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:like) { FactoryBot.create(:like) }

  it "ファクトリーが正常に動く" do
    expect(FactoryBot.build(:like)).to be_valid
  end
end
