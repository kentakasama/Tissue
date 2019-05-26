require 'rails_helper'

RSpec.describe HomeController, type: :controller do
    describe 'Aboutページ' do
      context "Aboutページが正しく表示される" do
        before do
          get :about
        end
        it 'リクエストは200 OKとなること' do
          expect(response.status).to eq 200
        end
      end
    end


    describe 'Topページ　登録済みユーザーの画面遷移' do
      let(:user) { create(:user) }
      # userをcreateし、let内に格納
        context "Topページを表示させる" do
          before do
            login_user user
            # controller_macros.rb内のlogin_userメソッドを呼び出し
            get :top
          end
        end

        it 'リクエストは200 OKとなること' do
          expect(response.status).to eq 200
        end
    end

    describe 'Topページ adminの画面遷移' do
      let(:admin) { create(:admin) }
      # userをcreateし、let内に格納
        context "Topページを表示させる" do
          before do
            login_user admin
            # controller_macros.rb内のlogin_userメソッドを呼び出し
            get :top
          end
        end

        it 'リクエストは200 OKとなること' do
          expect(response.status).to eq 200
        end
    end
end