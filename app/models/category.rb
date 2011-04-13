class Category < ActiveRecord::Base
  has_and_belongs_to_many :messages
  
  def name
    # self["name_#{I18n.locale}".to_sym]
    case I18n.locale.to_s
    when "en"
      self[:name]
    when "ru"
      self[:name_ru].blank? ? self[:name] : self[:name_ru]
    else
      self[:name]
    end    
  end
end