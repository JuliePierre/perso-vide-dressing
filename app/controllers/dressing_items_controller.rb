class DressingItemsController < ApplicationController

  def new
    @dressing_item = DressingItem.new
  end

  def create
    @dressing_item = DressingItem.new(dressing_items_params)
    @dressing_item.user = current_user

    if params[:dressing_item][:photo].nil?
      @dressing_item.remote_photo_url = Outfit.find(params[:dressing_item][:outfit_id]).photo.url
    end

    if @dressing_item.save
      redirect_to dressing_user_path(current_user)
    else
      render :new
    end
  end

  def index
    @user = User.find(params[:user_id])
    @user_dressing = @user.dressing_items
  end


  private

  def dressing_items_params
    params.require(:dressing_item).permit(:name, :category, :photo, :photo_cache)
  end
end