class CreatePurchaseOptions < ActiveRecord::Migration[7.1]
  def change
    create_table :purchase_options do |t|
      t.decimal :price
      t.string :video_quality

      t.timestamps
    end
  end
end
