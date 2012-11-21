class StaticPagesController < ApplicationController
  def home
    @entry = current_user.entries.build if signed_in?
    @shoe = current_user.shoes.build if signed_in?
  end

  def help
  end

  def about
  end  

  def contact
  end   
end
