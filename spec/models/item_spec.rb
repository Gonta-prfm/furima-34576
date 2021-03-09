require 'rails_helper'

RSpec.describe Item, type: :model do
  before do 
    @item = FactoryBot.build(:item)
  end
  describe '商品出品' do
    context '商品出品できるとき' do
      it 'name description category_id status_id shopping_charge_id
          shopping_area_id days_to_shop_id imageがある時' do
        expect(@item).to be_valid
      end
    end

    context '商品出品できないとき' do
      it '商品名が空だと登録できない' do
         @item.name = ''
         @item.valid?
         expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it '商品の説明が空だとと登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it '商品の詳細のカテゴリーが空だと登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
      end
      it '商品の詳細のカテゴリーが id = 1 だと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーは1以外の値にしてください")
      end
      it '商品の詳細の商品の状態が空だと登録できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品状態を入力してください")
      end
      it '商品の詳細の商品の状態が id = 1 だと登録できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品状態は1以外の値にしてください")
      end
      it '配送の配送料の負担が空だと登録できない' do
        @item.shopping_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を入力してください")
      end
      it '配送の配送料の負担 id = 1 だと登録できない' do
        @item.shopping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担は1以外の値にしてください")
      end
      it '配送の発送元の地域が空だと登録できない' do
        @item.shopping_area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を入力してください", "発送元の地域は数値で入力してください")
      end
      it '配送の発送元の地域が id = 1 だと登録できない' do
        @item.shopping_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域は1以外の値にしてください")
      end
      it '配送の発送までの日数が空だと登録できない' do
        @item.days_to_shop_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を入力してください", "発送までの日数は数値で入力してください")
      end
      it '配送の発送までの日数が id = 1 だと登録できない' do
        @item.days_to_shop_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数は1以外の値にしてください")
      end
      it '商品販売価格が空だと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格を入力してください", "販売価格は数値で入力してください")
      end
      it '商品販売価格が9,999,999円以上だと登録できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は10000000より小さい値にしてください")
      end
      it '商品販売価格が300円以下だと登録できない' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は299より大きい値にしてください")
      end
      it '商品販売価格が全角数字だと登録できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は数値で入力してください")
      end
      it '商品販売価格が全角英字だと登録できない' do
        @item.price = 'ｃｄｅｆ'
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は数値で入力してください")
      end
      it '商品販売価格が半角英字だと登録できない' do
        @item.price = 'cdef'
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は数値で入力してください")
      end
      it '商品販売価格が半角英数字混合だと登録できない' do
        @item.price = '10ab'
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は数値で入力してください")
      end
      it '出品画像が空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end
    end
  end
end

