require 'rails_helper'

RSpec.describe SelectController, type: :controller do
	describe '商品選択後にSelect/Showページに遷移される' do
		let(:user) { create(:user) }
		context "select/showページが正しく表示される" do
			before do
				login_user user
				item = create(:item)
				select = create(:select)

			get :show, params: { id: select.id}
			end
		it 'select/showが表示される' do
          expect(response.status).to eq 200
        end
		end
	end

	# describe 'selectが作成されなかった場合item/indexに遷移する' do
	# 	let(:user) { create(:user) }
	# 	let(:item){ create(:item)}
	# 	context "item/indexに遷移する" do
	# 		before do
	# 			login_user user
	# 			item = create(:item)
	# 		get :show
	# 		end
	# 	end
	# 	it 'item/indexが表示される' do
 #          expect(response.status).to eq 302
 #        end
	# end

	describe 'AdminUserのみSelect/indexを閲覧できる' do
		let(:admin) { create(:admin) }
		context "AdminUserのみSelect/indexを閲覧できる" do
			before do
				login_user admin
                get :index
			end
		it 'select/indexが表示される' do

          expect(response.status).to eq 200
        end
		end

	end

	describe 'AdminUserのみSelect/indexを閲覧できる' do
		let(:user) { create(:user) }
		context "一般UserはSelect/indexを閲覧できない" do
			before do
				login_user user
				get :index

			end
		it 'select/indexが表示されない' do
          expect(response.status).to eq 302
        end
		end

	end
end
