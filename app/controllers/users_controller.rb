class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :admin_check, only:[:index]

  def index
  	@users = User.search(params[:search]).page(params[:page]).reverse_order
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      flash[:notice] = "お客様情報を更新しました。"
    end
    redirect_to user_path(params[:id])
  end

  def destroy
    user = User.find(params[:id])
    if user.destroy
      flash[:notice] = "退会いたしました。ご利用いただきありがとうございました。"
    redirect_to root_path
    end
  end

  def admin_check
  	if current_user.admin == false
  		redirect_to items_path
  	end
  end


  private

	def select_params
		params.require(:select).permit(:user_id, :item_id, :check_box)
	end

  def user_params
    params.require(:user).permit(:zip_code, :home_address)
  end

end
