class AddUserToSecrets < ActiveRecord::Migration[6.1]
  def change
    add_reference :secrets, :user, foreign_key: true
  end
end
