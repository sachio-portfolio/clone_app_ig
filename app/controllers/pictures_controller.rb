class PicturesController < ApplicationController
  before_action :set_picture, only: %i[ show edit update destroy ]

  def index
    @pictures = Picture.all
  end
  def show
  end
  def new
    if params[:back]
      @picture = current_user.pictures.new(picture_params)
    else
      @picture = current_user.pictures.new
    end
  end
  def edit
  end
  def create
    @picture = current_user.pictures.build(picture_params)
    if params[:back]
      render :new
    else
      if @picture.save
        redirect_to user_path(current_user.id)
        flash.now[:notice] = "Picture was successfully created."
      else
        render :new
      end
    end
  end
  def update
    if @picture.update(picture_params)
      redirect_to @picture
      flash.now[:notice] = "Picture was successfully updated."
    else
      render :edit
    end
  end
  def destroy
    @picture.destroy
    redirect_to pictures_url
    flash.now[:notice] = "Picture was successfully destroyed."
  end
  private
  def set_picture
    @picture = Picture.find(params[:id])
  end
  def picture_params
    params.require(:picture).permit(:image, :image_cache, :content)
  end
end
