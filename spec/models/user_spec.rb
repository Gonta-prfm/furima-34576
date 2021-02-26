require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる時' do
      it 'nickname、password、password_cofirmation、famiry_name、first_name、
          family_name_kana、first_name_kana、birth_dayがあれば登録できる' do
          expect(@user).to be_valid
      end
    end
    context '新規登録できない時' do
      it 'nicknameが空では登録出来ない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank") 
      end
      it 'passwordが空では登録出来ない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'emailに＠が無いと登録出来ない' do
        @user.email = 'test.example'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid") 
      end
      it 'passwordが6文字以上無いと登録出来ない' do
        @user.password = 'y0000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordとpassword_cofirmationが一致していないと登録出来ない' do
        @user.password              = 't00000'
        @user.password_confirmation = 't11111'
        @user.password == @user.password_confirmation
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordは半角英数字混合で無いと登録出来ない' do
        @user.password = 'testtest'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password ")
      end
      it 'ユーザーの本名は名字が無いと登録出来ない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it 'ユーザーの本名は名前が無いと登録出来ない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'ユーザーの名字は全角（漢字・ひらがな・カタカナ）で無いと登録出来ない' do
        @user.family_name = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid")
      end
      it 'ユーザーの名前は全角（漢字・ひらがな・カタカナ）で無いと登録出来ない' do
        @user.first_name = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it 'ユーザーの名字のフリガナが無いと登録出来ない' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank", "Family name kana ")
      end
      it 'ユーザーの名前のフリガナが無いと登録出来ない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana ")
      end
      it 'ユーザーの名字のフリガナは全角（カタカナ）で無いと登録出来ない' do
        @user.family_name_kana = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana ")
      end
      it 'ユーザーの名前のフリガナは全角（カタカナ）で無いと登録出来ない' do
        @user.first_name_kana = '太朗'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana ")
      end
      it 'ユーザーの生年月日が無いと登録出来ない' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
    end
  end
end
