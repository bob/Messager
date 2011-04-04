class Comment < ActiveRecord::Base
  belongs_to :message
  belongs_to :user
  belongs_to :commentable, :polymorphic => true
  
  validates_presence_of :body
  
  def destroyable?(current_user)
    self.user == current_user or self.commentable.user == current_user
  end
end
