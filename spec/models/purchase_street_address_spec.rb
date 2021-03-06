require 'rails_helper'

RSpec.describe PurchaseStreetAddress, type: :model do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase = FactoryBot.build(:purchase_street_address, user_id: user.id, item_id: item.id)
      sleep 0.1
    end
    describe '商品購入機能' do
      context '商品購入できる時' do
        it 'クレジットカード決済ができ、必須記入事項が書かれている時' do
        expect(@purchase).to be_valid
      end
      it '建物の名前が空でも登録できる' do
        @purchase.buliding_name = ''
        expect(@purchase).to be_valid
      end
    end

      context '商品購入できないとき' do
        it 'クレジットカードの情報が空だと登録できない' do
          @purchase.token = ''
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Token can't be blank")
        end
        it 'user_idが空だと登録できない' do
          @purchase.user_id = ''
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("User can't be blank")
        end
        it 'item_idが空だと登録できない' do
          @purchase.item_id = ''
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Item can't be blank")
        end
        it '郵便番号が空だと登録できない' do
          @purchase.postal_code = ''
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid")
        end
        it '郵便番号に「-」が無いとと登録できない' do
          @purchase.postal_code = '1234567'
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Postal code is invalid")
        end
        it '郵便番号が半角数字で入力しないと登録できない' do
          @purchase.postal_code = '１２３４５６７'
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Postal code is invalid")
        end
        it '郵便番号のハイフンの前に数字が３つ無いと登録できない' do
          @purchase.postal_code = '12-34567'
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Postal code is invalid")
        end
        it '郵便番号のハイフンの後に数字が４つ無いと登録できない' do
          @purchase.postal_code = '1234-567'
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Postal code is invalid")
        end
        it '郵便番号が英数字混合だと登録できない' do
          @purchase.postal_code = '123-abc'
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Postal code is invalid")
        end
        it '都道府県が空だと登録できない' do
          @purchase.prefecture_id = ''
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Prefecture can't be blank")
        end
        it '都道府県がid = 0 だと登録できない' do
          @purchase.prefecture_id = 0
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Prefecture must be other than 0")
        end
        it '市区町村が空だと登録できない' do
          @purchase.municipality = ''
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Municipality can't be blank")
        end
        it '番地が空だと登録できない' do
          @purchase.address = ''
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Address can't be blank")
        end
        it '電話番号が空だと登録できない' do
          @purchase.phone_number = ''
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
        end
        it '電話番号が半角数字で入力しないと登録できない' do
          @purchase.phone_number = '１２３４５６７８９１２'
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Phone number is invalid")
        end
        it '電話番号が１０文字より少ないと登録できない' do
          @purchase.phone_number = '123456789'
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Phone number is invalid")
        end
        it '電話番号に「-」があると登録できない' do
          @purchase.phone_number = '123ー4567ー8912'
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Phone number is invalid")
        end
        it '電話番号が英数字混合だと登録できない' do
          @purchase.phone_number = '123abcd4567'
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Phone number is invalid")
        end
      end
  end
end