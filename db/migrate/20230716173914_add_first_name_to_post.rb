class AddFirstNameToPost < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :second_name, :string
  end
end
