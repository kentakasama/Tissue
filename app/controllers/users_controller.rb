class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :admin_check, only:[:index]
  def index
  	@users = User.all
  end

  def show
  	@user = current_user
  end

  def edit
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

end
