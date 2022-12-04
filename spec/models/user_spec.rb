require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
#ユーザー情報
  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'emailに@が含まれていなければ登録できない' do
      @user.email = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが6文字以上でなければ登録できない' do
      @user.password = '0000a'
      @user.password_confirmation = '0000a'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it 'passwordが半角英数字混合でなければ登録できない' do
      @user.password = '000000'
      @user.password_confirmation = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it 'passwordと確認が一致していなければ登録できない' do
      @user.password = '00000a'
      @user.password_confirmation = '00000b'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'emailが一意性でなければ登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
#本人情報確認
    it 'お名前(全角)は、名字がそれぞれ必須であること' do
      @user.lastname_in_kanji = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname in kanji can't be blank")
    end
    it 'お名前(全角)は、名前がそれぞれ必須であること' do
      @user.firstname_in_kanji = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname in kanji can't be blank")
    end
    it 'お名前(カナ)は、名字がそれぞれ必須であること' do
      @user.lastname_in_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname in kana can't be blank")
    end
    it 'お名前(カナ)は、名前がそれぞれ必須であること' do
      @user.firstname_in_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname in kana can't be blank")
    end
    it '名字(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること。' do
      @user.lastname_in_kanji = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname in kanji is invalid")
    end
    it '名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること。' do
      @user.firstname_in_kanji = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname in kanji is invalid")
    end
    it '名字カナ(全角)は、全角（カタカナ）での入力が必須であること。' do
      @user.lastname_in_kana = '山田'
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname in kana is invalid")
    end
    it '名前カナ(全角)は、全角（カタカナ）での入力が必須であること。' do
      @user.firstname_in_kana = '太郎'
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname in kana is invalid")
    end
    it '生年月日が必須であること' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
