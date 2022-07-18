class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :category
      t.string :description
      t.integer :available
      t.integer :amount
      t.integer :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
