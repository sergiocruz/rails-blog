class AuthorsController < ApplicationController
  def index
    @author = Author.new

    @pagetitle = "Welcome to Rails Blog"
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    # Name
    name = params[:author][:name]

    # Fetching author object
    @author = Author.find_or_create_by_name(name)

    # Saves in session
    session[:current_user_id] = @author.id

    # Redicts to posts page
    redirect_to posts_path
  end

  def destroy
  end

  def update
  end

  def forget
    session[:current_user_id] = nil
    redirect_to root_path
  end
end
