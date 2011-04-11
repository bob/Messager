class Message < ActiveRecord::Base
  belongs_to :user  
  has_many :comments, :as => :commentable
  has_and_belongs_to_many :categories

  scope :current_for_user, lambda { |user|
    where(:user => user)
    order("created_at")
  }

  cattr_reader :per_page
  @@per_page = 4

  IMG_DIR = "/images/Smiles/"
  EMOTIONS = [
    ["-", ""],
    ["happy", "happy.gif"],
    ["boring", "boring.gif"],
    ["neutral", "neutral.gif"]
  ]

  COLORS =
  [
  ["-", "fff"],
  ["Red", "D80000 " ],
  ["Yellow", "dddd00" ],
  ["Green", "00cc00" ]
  ]

  validates_presence_of :body
  validates :emotion, :inclusion => EMOTIONS.map {|disp, value| value}
  validates :color, :inclusion => COLORS.map {|disp, value| value}

  def modificapable?(current_user)
    self.user == current_user
  end

end

