class AddColorToMessage < ActiveRecord::Migration
  def self.up
    add_column :messages, :color, :string, :default => "ffffff"
  end

  def self.down
    remove_column :messages, :color
  end
end

