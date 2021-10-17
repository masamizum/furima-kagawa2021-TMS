require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "必須項目が全て入力されていたら登録できる" do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上の半角英数字両方を含んでいれば登録できる' do
        @user.password = 'a12345'
        @user.password_confirmation = 'a12345'
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it "nicknameが空では登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailには＠がないと登録できない' do
        @user.email = '123456'
        @user.valid?
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email is invalid. Email requiers @ ')
      end

      it "passwordが空では登録できない" do
        @user.encrypted_password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = 'abcd5'
        @user.password_confirmation = 'abcd5'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordは半角英数字両方が含まれてないと登録できない' do
        @user.password = 'abcdefg'
        @user.password_confirmation = 'abcdefg'
        @user.valid?
        expect(@user.errors.full_messages).to include('Encrypted password Password is invalid. Include both letters and numbers')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "名前（last_name）が空では登録できない" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last_name can't be blank")
      end
      it "名前（first_name)が空では登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First_name can't be blank")
      end
      it '名前（last_name）が全角(漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.last_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last_name is invalid. Input full-width characters')
      end
      it '名前（first_name)が全角(漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.first_name = 'taro'
        @user.valid?
        expect(@user.errors.full_messages).to include('First_name is invalid. Input full-width characters')
      end

      it "名前（last_name_kana）が空では登録できない" do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Fast_name_kana can't be blank")
      end
      it "名前（first_name_kana）が空では登録できない" do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First_name_kana can't be blank")
      end
      it '名前（last_name_kana）が全角カナでないと登録できない' do
        @user.last_name_kana = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last_name_kana is invalid. Input full-width katakana character')
      end
      it '名前（first_name_kana）が全角カナでないと登録できない' do
        @user.first_name_kana = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('First_name_kana is invalid. Input full-width katakana character')
      end

      it "誕生日（birth_date）が空では登録できない" do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth_date can't be blank")
      end
    end
  end
end
