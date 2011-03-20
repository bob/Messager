class Message < ActiveRecord::Base

  IMG_DIR = "/images/Smiles/"
  EMOTIONS = [
    ["happy", "happy.gif"],
    ["boring", "boring.gif"],
    ["neutral", "neutral.gif"]
  ]

  COLORS =
  [
  ["Red", "cc0000" ],
  ["Yellow", "dddd00" ],
  ["Green", "00cc00" ]
  ]

  validates_presence_of :body
  validates :emotion, :inclusion => EMOTIONS.map {|disp, value| value}
  validates :color, :inclusion => COLORS.map {|disp, value| value}


end

