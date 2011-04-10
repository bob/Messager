class Comment < ActiveRecord::Base
  belongs_to :message
  belongs_to :user
  belongs_to :commentable, :polymorphic => true
  
  cattr_reader :per_page
  @@per_page = 2

  validates_presence_of :body
  
  def destroyable?(current_user)
    self.user == current_user or self.commentable.user == current_user
  end
end
