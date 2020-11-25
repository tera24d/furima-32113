require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  describe '#create' do
    before do
      @user_order = FactoryBot.build(:user_order)
    end

    describe '商品購入機能' do
      context '商品購入ができるとき' do
        it 'addressesとtokenがあれば購入できること' do
          expect(@user_order).to be_valid
        end
      end

      context '商品購入ができないとき' do
        it 'クレジットカード情報が必須であり、正しいこと' do
          @user_order.token = nil
          @user_order.valid?
          expect(@user_order.errors.full_messages).to include("Token can't be blank")
        end

        it '郵便番号にはハイフンが必要であること（123-4567となる）' do
          @user_order.postal_code = 1_234_567
          @user_order.valid?
          expect(@user_order.errors.full_messages).to include('Postal code Input correctly')
        end

        it '郵便番号が空では購入できないこと' do
          @user_order.postal_code = nil
          @user_order.valid?
          expect(@user_order.errors.full_messages).to include("Postal code can't be blank")
        end

        it '都道府県が空では購入できないこと' do
          @user_order.prefecture_id = 0
          @user_order.valid?
          expect(@user_order.errors.full_messages).to include('Prefecture select')
        end

        it '市区町村が空では購入できないこと' do
          @user_order.city = nil
          @user_order.valid?
          expect(@user_order.errors.full_messages).to include("City can't be blank")
        end

        it '番地が空では購入できないこと' do
          @user_order.addresses = nil
          @user_order.valid?
          expect(@user_order.errors.full_messages).to include("Addresses can't be blank")
        end

        it '電話番号が空では購入できないこと' do
          @user_order.phone_number = nil
          @user_order.valid?
          expect(@user_order.errors.full_messages).to include("Phone number can't be blank")
        end

        it '電話番号にはハイフンは不要で、11桁以内であること' do
          @user_order.phone_number = '090-1234-5678'
          @user_order.valid?
          expect(@user_order.errors.full_messages).to include('Phone number Input only number', 'Phone number is too long (maximum is 11 characters)')
        end
      end
    end
  end
end
