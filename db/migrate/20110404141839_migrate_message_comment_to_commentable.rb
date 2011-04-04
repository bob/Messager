class MigrateMessageCommentToCommentable < ActiveRecord::Migration
  def self.up
    comments = Comment.where(:commentable_id => nil)
    comments.each do |c|
      c.commentable = Message.find(c.message_id)
      c.save
    end
    
    remove_column :comments, :message_id
  end

  def self.down
    add_column :comments, :message_id
    
    comments = Comment.where(:commentable_type => "Message")
    comments.each do |c|
      c.message_id = c.commentable_id
      c.save
    end
  end
end
