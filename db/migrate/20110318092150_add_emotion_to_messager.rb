class AddEmotionToMessager < ActiveRecord::Migration
  def self.up
    add_column :messages, :emotion, :string, :default => 'neutral.gif'
  end

  def self.down
    remove_column :messages, :emotion
  end
end

