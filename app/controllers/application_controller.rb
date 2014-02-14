class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_admin!, only: [ :edit, :update, :destroy ]
  
  def tag_list
    Game.pluck(:tags).flatten.uniq
  end
  def style_list
    Style.pluck(:name)
  end
end
