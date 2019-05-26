class SelectController < ApplicationController
	before_action :authenticate_user!
    before_action :admin_check, only:[:index]


    def index
        # .searchはモデルで定義しているメソッドを呼び出す。
        @selects = Select.search(params[:search]).page(params[:page]).reverse_order
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
      if di2 == "1" && di1 != nil
        if current_user.select.present?
            @select = Select.find_by(user_id: current_user.id)
            @select.item_id = di1
            @select.update(select_params)
        else
            @select = Select.new(select_params)
            @select.item_id = di1
            @select.user_id = current_user.id
            @select.save
        end
        redirect_to "/selects/#{@select.id}"
    else
        flash[:notice] = "※商品を選択してください"
        redirect_to items_path
      end
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
end
