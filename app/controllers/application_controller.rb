class ApplicationController < ActionController::Base
  protect_from_forgery

  # Always executes before any methods
  before_filter :get_author

  # Finds the author with the ID stored in the session with the key :current_user_id
  def get_author
    @current_author ||= session[:current_user_id] && Author.find(session[:current_user_id])
  end
end
