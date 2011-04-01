class Message < ActiveRecord::Base

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

  belongs_to :user
  
  has_many :comments

  def modificapable?(current_user)
    self.user == current_user
  end

end

