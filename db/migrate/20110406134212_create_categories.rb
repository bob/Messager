class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string :name
      t.text :description
      
      t.timestamps
    end
    
    Category.create(:name => "Music")
    Category.create(:name => "Movies")
    Category.create(:name => "Books")
    Category.create(:name => "Girls")
    Category.create(:name => "Programming")
  end

  def self.down
    drop_table :categories
  end
end
