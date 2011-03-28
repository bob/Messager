class Relation < ActiveRecord::Base
  belongs_to :user
  belongs_to :translator, :class_name => "User", :foreign_key => "translator_id"
end