class AddSecondNameToPost < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :firs_name, :string
  end
end
