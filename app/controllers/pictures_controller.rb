class PicturesController < ApplicationController
  before_action  :initialize_picrure, only:[:show, :edit, :update, :destroy]

  def index
    @pictures = Picture.all.includes(:user)
  end

  def new
    if params[:back]
      @picture = current_user.pictures.new(get_params)
    else
      @picture = Picture.new
    end
  end

  def create
    @picture = current_user.pictures.new(get_params)
    if @picture.save 
      redirect_to pictures_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @picture.update(get_params)
      redirect_to pictures_path, notice:"編集しました"
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    if @picture.destroy
      redirect_to pictures_path, notice:"削除しました"
    else
      render:edit
    end
  end

  def confirm
    @picture = current_user.pictures.new(get_params)
    render :new if @picture.invalid?
  end

  private
  def get_params
    params.require(:picture).permit(:title, :image, :image_cache, :content, :user_id)
  end

  def initialize_picrure
    @picture = Picture.find(params[:id])
  end

end
