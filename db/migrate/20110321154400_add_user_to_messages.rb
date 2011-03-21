class AddUserToMessages < ActiveRecord::Migration
  def self.up
    add_column :messages, :user_id, :integer, :null => false
  end

  def self.down
    remove_column :messages, :user_id
  end
end
