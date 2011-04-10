class Comment < ActiveRecord::Base
  belongs_to :message
  belongs_to :user
  belongs_to :commentable, :polymorphic => true

  validates_presence_of :body

  cattr_reader :per_page
  @@per_page = 5

  def destroyable?(current_user)
    self.user == current_user or (self.commentable.instance_of?(Message) and self.commentable.user == current_user) or (self.commentable.instance_of?(User) and self.commentable == current_user)
  end
end

