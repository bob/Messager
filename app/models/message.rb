class Message < ActiveRecord::Base

  COLORS =
  [
  ["Red", "cc0000" ],
  ["Yellow", "dddd00" ],
  ["Green", "00cc00" ]
  ]
  validates_presence_of :body
  validates :color, :inclusion => COLORS.map {|disp, value| value}

end

