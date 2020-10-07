require 'rails_helper'
RSpec.describe Tweet, type: :model do
  before do
    @tweet = FactoryBot.build(:tweet)
    @tweet.image = fixture_file_upload('public/images/benz.jpeg')
  end

  describe '投稿する情報の保存' do
    context '投稿がうまくいく時' do
      it 'brand_id, type_id, model_year_id, title, caption, imageが存在すれば投稿できる' do
        expect(@tweet).to be_valid
      end
      it 'brand_idで1以外を選択すれば投稿できる' do
        @tweet.brand_id = '2'
        expect(@tweet).to be_valid
      end
      it 'type_idで1以外を選択すれば投稿できる' do
        @tweet.type_id = '2'
        expect(@tweet).to be_valid
      end
      it 'model_year_idで1以外を選択すれば投稿できる' do
        @tweet.model_year_id = '2'
        expect(@tweet).to be_valid
      end
    end

    context '投稿がうまくいかない時' do
      it 'brand_idが1の時投稿できない' do
        @tweet.brand_id = '1'
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('Brandを選択してください')
      end
      it 'type_idが1の時投稿できない' do
        @tweet.type_id = '1'
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('Typeを選択してください')
      end
      it 'model_year_idが1の時投稿できない' do
        @tweet.model_year_id = '1'
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('Model yearを選択してください')
      end
      it 'titleが空だと投稿できない' do
        @tweet.title = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('Titleを入力してください')
      end
      it 'captionが空だと投稿できない' do
        @tweet.caption = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('Captionを入力してください')
      end
      it 'imageが存在していないと投稿できない' do
        @tweet.image = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('Imageを選択してください')
      end
    end
  end
end
