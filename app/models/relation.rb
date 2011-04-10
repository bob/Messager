class Relation < ActiveRecord::Base
  belongs_to :user, :foreign_key => "user_id"
  belongs_to :translator, :class_name => "User", :foreign_key => "translator_id"
end
