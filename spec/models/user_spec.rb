require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      context '新規登録がうまくいくとき' do
        it 'nicknameとemail、passwordとpassword_confirmation、last_name、first_name、last_name_kana、first_name_kana、birth_dateが存在すれば登録できること' do
          expect(@user).to be_valid
        end
      end

      context '新規登録がうまくいかないとき' do
        it 'nicknameが空だと登録できない' do
          @user.nickname = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end
        it 'nicknameが7文字以上であれば登録できない' do
        end
        it 'emailが空では登録できない' do
          @user.email = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end
        it '重複したemailが存在する場合登録できない' do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email has already been taken')
        end
        it 'emailは、＠を含まないと登録できない' do
          @user.email = 'abc.com'
          @user.valid?
          expect(@user.errors.full_messages).to include('Email is invalid')
        end
        it 'passwordが空では登録できない' do
          @user.password = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
        it 'passwordが5文字以下であれば登録できない' do
          @user.password = '123ab'
          @user.password_confirmation = '123ab'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
        end
        it 'passwordが英数混合でなければ登録できない' do
          @user.password = '1234567'
          @user.password_confirmation = '1234567'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
        end
        it 'passwordが存在してもpassword_confirmationが空では登録できない' do
          @user.password_confirmation = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it 'last_nameが空では登録できない' do
          @user.last_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name can't be blank")
        end
        it 'first_nameが空では登録できない' do
          @user.first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end
        it 'last_name_kanaが空では登録できない' do
          @user.last_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana can't be blank")
        end
        it 'first_name_kanaが空では登録できない' do
          @user.first_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana can't be blank")
        end
        it 'last_nameが全角ではないと登録できない' do
          @user.last_name = 'yamada'
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
        end
        it 'first_nameが全角ではないと登録できない' do
          @user.first_name = 'taro'
          @user.valid?
          expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
        end
        it 'last_name_kanaが全角カナではないと登録できない' do
          @user.last_name_kana = '山田'
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana 全角カナ文字を使用してください")
        end
        it 'first_name_kanaが全角カナではないと登録できない' do
          @user.first_name_kana = '太郎'
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana 全角カナ文字を使用してください")
        end
        it 'birth_dateが空では登録できない' do
          @user.birth_date = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Birth date can't be blank")
        end
      end
    end
  end
end
