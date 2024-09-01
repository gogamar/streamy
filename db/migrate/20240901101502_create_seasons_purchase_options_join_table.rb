class CreateSeasonsPurchaseOptionsJoinTable < ActiveRecord::Migration[7.1]
  def change
    create_table :seasons_purchase_options, id: false do |t|
      t.bigint :season_id, null: false
      t.bigint :purchase_option_id, null: false

      t.index [:season_id, :purchase_option_id], unique: true
      t.index :season_id
      t.index :purchase_option_id
    end

    add_foreign_key :seasons_purchase_options, :seasons
    add_foreign_key :seasons_purchase_options, :purchase_options
  end
end
