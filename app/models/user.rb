class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :fullname, :avatar
  
  has_many :messages
  
  has_attached_file :avatar, 
    # :path => ':rails_root/public/assets/avatars/:id/:style/:basename.:extension',
    # :url => '...',
    :styles => { :medium => "300x300>", :thumb => "100x100>" },
    :default_url => "rails.png"
    
  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/pjpeg', 'image/png', 'image/gif']
  validates_attachment_size :avatar, :less_than => 500.kilobytes

  has_many :relations
  # Subscribers - reading me
  # has_many :subscribers, :class_name => "User"
  
  has_many :comments, :as => :commentable
  
  # Translators - I'm reading  
  has_many :translators, :through => :relations, :source => :translator
  
  # Relations
  
  
end
