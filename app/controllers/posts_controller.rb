class PostsController < ApplicationController

  def index
    # Fetches all posts
    @posts = Posts.all
  end

  def show
    #Fetches requested post
    @post = Posts.find(params[:id])

    @pagetitle = @post.title

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  def new
    @posts = Posts.new
  end

  def edit
    @post = Posts.find(params[:id])

    @pagetitle = 'Edit: ' + @post.title

    # Only actual author can edit this post
    if @post.author_id != @current_author.id
      redirect_to @post, notice: 'Sorry, you do not have permission to edit this post.'
    end
  end

  def create
    @post = Posts.new(:title => params[:posts][:title], :blog => params[:posts][:blog], :author_id => @current_author.id)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was created' }
      else
        format.html { redirect_to posts_new_path, notice: 'Post was not created, please make sure you filled out all the fields.' }
      end
    end
  end

  def update
    @post = Posts.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(:title => params[:posts][:title], :blog => params[:posts][:blog])
        format.html  { redirect_to(@post, :notice => 'Post was successfully updated.') }
        format.json  { head :no_content }
      else
        format.html  { render :action => "edit", :notice => 'Post was not updated.' }
        format.json  { render :json => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @post = Posts.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_path, :notice => "Post was deleted." }
    end
  end
end
