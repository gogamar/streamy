class CreateMoviesPurchaseOptionsJoinTable < ActiveRecord::Migration[7.1]
  def change
    create_table :movies_purchase_options, id: false do |t|
      t.bigint :movie_id, null: false
      t.bigint :purchase_option_id, null: false

      t.index [:movie_id, :purchase_option_id], unique: true
      t.index :movie_id
      t.index :purchase_option_id
    end

    add_foreign_key :movies_purchase_options, :movies
    add_foreign_key :movies_purchase_options, :purchase_options
  end
end
