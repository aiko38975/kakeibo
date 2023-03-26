class CreateRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :records do |t|
      t.datetime :recorded_at, null: false
      t.integer :price, null: false
      t.text :description
      t.timestamps
    end
  end
end
