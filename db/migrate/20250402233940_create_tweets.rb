class CreateTweets < ActiveRecord::Migration[7.2]
  def change
    create_table :tweets do |t|
      t.text :content, null: false
      t.string :image
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
