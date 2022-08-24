class AddToDog < ActiveRecord::Migration[7.0]
  def change
    add_column :dogs, :picture, :string
  end
end
