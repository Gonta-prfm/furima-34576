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
        expect(@user.errors.full_messages).to include("ニックネームを入力してください") 
      end
      it 'passwordが空では登録出来ない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください", "パスワードは不正な値です", "パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it 'emailに＠が無いと登録出来ない' do
        @user.email = 'test.example'
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です") 
      end
      it '重複したemailがあると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it 'passwordが6文字以上無いと登録出来ない' do
        @user.password = 'y0000'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません", "パスワードは6文字以上で入力してください", "パスワードは不正な値です")
      end
      it 'passwordとpassword_cofirmationが一致していないと登録出来ない' do
        @user.password              = 't00000'
        @user.password_confirmation = 't11111'
        @user.password == @user.password_confirmation
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'passwordは半角英数字混合で無いと登録出来ない' do
        @user.password = 'testtest'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません", "パスワードは不正な値です")
      end
      it 'passwordは数字だけでは登録出来ない' do
        @user.password = '0000000'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません", "パスワードは不正な値です")
      end
      it 'passwordは全角では登録出来ない' do
        @user.password = 'ｐｐｐｐ１１１'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません", "パスワードは不正な値です")
      end
      it 'ユーザーの本名は名字が無いと登録出来ない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名字(全角)を入力してください", "名字(全角)は不正な値です")
      end
      it 'ユーザーの本名は名前が無いと登録出来ない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前(全角)を入力してください", "お名前(全角)は不正な値です")
      end
      it 'ユーザーの名字は全角（漢字・ひらがな・カタカナ）で無いと登録出来ない' do
        @user.family_name = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include("名字(全角)は不正な値です")
      end
      it 'ユーザーの名前は全角（漢字・ひらがな・カタカナ）で無いと登録出来ない' do
        @user.first_name = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前(全角)は不正な値です")
      end
      it 'ユーザーの名字のフリガナが無いと登録出来ない' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名字カナ(前角)を入力してください", "名字カナ(前角)は不正な値です")
      end
      it 'ユーザーの名前のフリガナが無いと登録出来ない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前カナ(全角)を入力してください", "お名前カナ(全角)は不正な値です")
      end
      it 'ユーザーの名字のフリガナは全角（カタカナ）で無いと登録出来ない' do
        @user.family_name_kana = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include("名字カナ(前角)は不正な値です")
      end
      it 'ユーザーの名前のフリガナは全角（カタカナ）で無いと登録出来ない' do
        @user.first_name_kana = '太朗'
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前カナ(全角)は不正な値です")
      end
      it 'ユーザーの生年月日が無いと登録出来ない' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
    end
  end
end
