class ShoesController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user,   only: :destroy

  def index
  end
 
  def create
    @shoe = current_user.shoes.build(params[:shoe])
    @shoe.distance = 0
    if @shoe.save    
      flash[:success] = "shoe created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
    @shoe.destroy
    redirect_to root_url
  end

  private

    def correct_user
      @shoe = current_user.shoes.find_by_id(params[:id])
      redirect_to root_url if @shoe.nil?
    end

end