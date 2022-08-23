class CreateDogs < ActiveRecord::Migration[7.0]
  def change
    create_table :dogs do |t|
      t.string :name
      t.integer :age
      t.string :location
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
