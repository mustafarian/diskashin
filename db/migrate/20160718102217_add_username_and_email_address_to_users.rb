class AddUsernameAndEmailAddressToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :username, :string
    add_column :users, :email_address, :string
  end
end
