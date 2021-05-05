class BlogpostsController < ApplicationController
  
  before_action :set_blogpost, only: [:edit, :update, :show, :destroy]
  
  def index
    @blogposts = Blogpost.paginate(page: params[:page], per_page: 5)
  end
  
  def new 
    if logged_in?
      @blogpost = Blogpost.new
    else
      redirect_to root_path
    end
  end
  
  def create
    #render plain: params[:blogpost].inspect
      @blogpost = Blogpost.new(blogpost_params)
      @blogpost.user = User.first
      if @blogpost.save
        flash[:success] = "Blogpost was successfully created"
        redirect_to blogpost_path(@blogpost)
      else
        render 'new'
      end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @blogpost.update(blogpost_params)
     flash[:success] = "Blogpost was updated"
     redirect_to blogpost_path(@blogpost)
    else
     flash[:success] = "Blogpost was not updated"
     render 'edit'
    end
  end
  
  def destroy
    @blogpost.destroy
    flash[:success] = "Post was deleted"
    redirect_to blogposts_path
  end
  
  private
  def blogpost_params
   params.require(:blogpost).permit(:title, :content, :tags)
  end
  
  def set_blogpost
    @blogpost = Blogpost.find(params[:id])
  end


end
