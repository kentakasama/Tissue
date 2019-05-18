class SelectController < ApplicationController
	before_action :authenticate_user!

    def index
    	@user = User.find(current_user.id)
    	# ユーザーに紐づいたSelectのItem.id
    	@select = Select.find(current_user.id)
    end

	def create
    params[:select].each do |di1,di2|
      if di2 == "1"
         @select = Select.new(item_id: di1)
         @select.user_id = current_user.id
         @select.save
      end
    end
    redirect_to "/selects"
	end

	def select_params
		params.require(:select).permit(:user_id, :item_id, :check_box)
	end
end
