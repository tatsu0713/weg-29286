class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.references :user,          foreign_key: true
      t.integer :brand_id,         null: false
      t.integer :type_id,          null: false
      t.integer :model_year_id,    null: false
      t.string :title,             null: false
      t.text :caption,             null: false
      t.timestamps
    end
  end
end
