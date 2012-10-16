class EntriesController < ApplicationController
  before_filter :signed_in_user

  def index
  end

  def create
    @entry = current_user.entries.build(params[:entry])
    if @entry.save
      flash[:success] = "Entry created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end
end