class RemoveNameStringFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :name_string, :string
  end
end
