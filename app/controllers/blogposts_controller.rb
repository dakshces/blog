class BlogpostsController < ApplicationController
  
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
    @blogpost = Blogpost.find(params[:id])
  end
  
  def edit
    @blogpost = Blogpost.find(params[:id])
  end
  
  def update
    @blogpost = Blogpost.find(params[:id])
    if @blogpost.update(blogpost_params)
     flash[:notice] = "Blogpost was updated"
     redirect_to blogpost_path(@blogpost)
    else
     flash[:notice] = "Blogpost was not updated"
     render 'edit'
    end
  end
  
  private
  def blogpost_params
   params.require(:blogpost).permit(:title, :content, :tags)
  end


end
