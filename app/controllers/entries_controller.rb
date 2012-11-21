class EntriesController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user,   only: :destroy

  def index
  end
 
  def create
    @entry = current_user.entries.build(params[:entry])
    @shoe = Shoe.find(@entry.shoe_id)
    @distance = @entry.distance + @shoe.distance
    @shoe.update_attributes(:distance => @distance)   
    if @entry.save    
      flash[:success] = "Entry created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end

  end

  def destroy
    @entry.destroy
    redirect_to root_url
  end

  private

    def correct_user
      @entry = current_user.entries.find_by_id(params[:id])
      redirect_to root_url if @entry.nil?
    end

end