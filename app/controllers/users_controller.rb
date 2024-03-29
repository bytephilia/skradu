# encoding: UTF-8
class UsersController < ApplicationController
before_filter :signed_in_user, only: [:index, :edit, :update]
before_filter :correct_user,   only: [:edit, :update]
before_filter :admin_user,     only: :destroy

  def show
    @user = User.find(params[:id])
    @entries = @user.entries.paginate(page: params[:page], :per_page => 10)
    @shoes = @user.shoes.paginate(page: params[:page], :per_page => 10)
  end

  def new
  	@user = User.new
  end

  def edit
  end

  def index
    @users = User.paginate(page: params[:page])
  end  

  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Velkomin(n) á Skráðu.is!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end  

  private

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end

end
