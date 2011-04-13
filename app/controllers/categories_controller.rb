class CategoriesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authenticate_admin
  
  def index
    @categories = Category.all
  end
end