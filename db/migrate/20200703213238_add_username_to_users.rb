class AddUsernameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name_string, :string
  end
end
