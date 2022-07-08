class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.string :type
      t.string :description
      t.boolean :available
      t.integer :quantity
      t.integer :exchange_status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
