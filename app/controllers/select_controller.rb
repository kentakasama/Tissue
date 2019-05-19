class SelectController < ApplicationController
	before_action :authenticate_user!
    before_action :admin_check, only:[:index]


    def index
    	@selects = Select.all
    end

    def show
        # userが商品選択後に、遷移される
        # 且つ、表示されている内容は、一番最後に選択したものにしたい。
        @user = User.find(current_user.id)
        @select = Select.find(params[:id])
    end

	def create
    # params[:select]で送られてきた、item_idと0.1で1のitem_idとuser_idを保存
    params[:select].each do |di1,di2|
      if di2 == "1"
         @select = Select.new(item_id: di1)
         @select.user_id = current_user.id
         @select.save
      end
    end
    redirect_to "/selects/#{@select.id}"
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
