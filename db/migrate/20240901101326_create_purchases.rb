class CreatePurchases < ActiveRecord::Migration[7.1]
  def change
    create_table :purchases do |t|
      t.decimal :price
      t.string :video_quality
      t.datetime :expiration_time
      t.references :user, null: false, foreign_key: true
      t.references :purchase_option, null: false, foreign_key: true
      t.references :content, polymorphic: true, null: false

      t.timestamps
    end
  end
end
