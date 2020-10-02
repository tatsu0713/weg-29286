class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.references :user,          foreign_key: true
      t.integer :category_id,      null: false
      t.integer :tweet_status_id,  null: false
      t.timestamps
    end
  end
end
