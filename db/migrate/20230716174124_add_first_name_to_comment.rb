class AddFirstNameToComment < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :fist_name, :string
  end
end
