# Configures your navigation
 SimpleNavigation::Configuration.run do |navigation|

 navigation.items do |primary|
  
    primary.item :home, "home", root_path#, :highlights_on	
    primary.item :about, "About", about_path#, :highlights_on
    
    if current_user
      primary.item :profile, "profile", profile_path#, :highlights_on
      primary.item :current_status, "current_status", current_status_path#, :highlights_on
      primary.item :history, "history", messages_path#, :highlights_on
      primary.item :friends, "Friends", show_friends_path#, :highlights_on
    end

 end

#	SimpleNavigation::Builder.config do |map|
#  map.navigation :default, :i18n => true do |navigation|
#    navigation.menu :home, "Wellcome", :url => { :controller => "home", :action => "index" } do |home|
#      home.menu :settings, "Appliction Settings", :url => { :controller => "home", :action => "settings"}
#    end
#    navigation.menu :pages, :url => { :controller => "pages", :action => "index" } do |pages|
#      pages.menu :page_one, "One", :url => { :controller => "pages", :action => "one" }
#      pages.menu :page_two, "Two", :url => { :controller => "pages", :action => "two" }
#    end
#  end
#end


  # Specify a custom renderer if needed.
  # The default renderer is SimpleNavigation::Renderer::List which renders HTML lists.
  # The renderer can also be specified as option in the render_navigation call.
  # navigation.renderer = Your::Custom::Renderer

  # Specify the class that will be applied to active navigation items. Defaults to 'selected'
  # navigation.selected_class = 'your_selected_class'

  # Item keys are normally added to list items as id.
  # This setting turns that off
  # navigation.autogenerate_item_ids = false

  # You can override the default logic that is used to autogenerate the item ids.
  # To do this, define a Proc which takes the key of the current item as argument.
  # The example below would add a prefix to each key.
  # navigation.id_generator = Proc.new {|key| "my-prefix-#{key}"}

  # If you need to add custom html around item names, you can define a proc that will be called with the name you pass in to the navigation.
  # The example below shows how to wrap items spans.
  # navigation.name_generator = Proc.new {|name| "<span>#{name}</span>"}

  # The auto highlight feature is turned on by default.
  # This turns it off globally (for the whole plugin)
  # navigation.auto_highlight = false


end
