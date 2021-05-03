class BlogpostsController < ApplicationController
  
  before_action :set_blogpost, only: [:edit, :update, :show, :destroy]
  
  def index
    @blogposts = Blogpost.all
  end
  
  def new 
    @blogpost = Blogpost.new
  end
  
  def create
    #render plain: params[:blogpost].inspect
    @blogpost = Blogpost.new(blogpost_params)
    if @blogpost.save
      flash[:notice] = "Blogpost was successfully created"
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
     flash[:notice] = "Blogpost was updated"
     redirect_to blogpost_path(@blogpost)
    else
     flash[:notice] = "Blogpost was not updated"
     render 'edit'
    end
  end
  
  def destroy
    @blogpost.destroy
    flash[:notice] = "Post was deleted"
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
