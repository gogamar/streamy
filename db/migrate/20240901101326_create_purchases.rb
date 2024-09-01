class CreatePurchases < ActiveRecord::Migration[7.1]
  def change
    create_table :purchases do |t|
      t.references :content, polymorphic: true, null: false
      t.decimal :price
      t.string :video_quality
      t.string :expiration_time
      t.references :purchase_option, null: false, foreign_key: true

      t.timestamps
    end
  end
end
