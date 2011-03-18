class Message < ActiveRecord::Base
  IMG_DIR = "/images/Smiles/"
  EMOTIONS = [
    ["happy", "happy.gif"],
    ["boring", "boring.gif"],
    ["neutral", "neutral.gif"]
  ]

  validates_presence_of :body
  validates :emotion, :inclusion => EMOTIONS.map {|disp, value| value}

end

