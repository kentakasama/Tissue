class HomeController < ApplicationController
  def top
  	if current_user
  		if current_user.admin == true
			redirect_to selects_path
  		elsif current_user.selects.blank?
  			redirect_to items_path
  		else
  			redirect_to user_path(current_user)
  		end
  	end
  end
end

