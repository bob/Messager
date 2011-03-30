class Comment < ActiveRecord::Base
  belongs_to :message
  belongs_to :user
  
  validates_presence_of :body
  
  def destroyable?(current_user)
    self.user == current_user or self.message.user == current_user
  end
end
