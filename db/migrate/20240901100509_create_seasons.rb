class CreateSeasons < ActiveRecord::Migration[7.1]
  def change
    create_table :seasons do |t|
      t.string :title
      t.text :plot
      t.integer :number

      t.timestamps
    end
  end
end
