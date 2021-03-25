require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'email,password,nickname,family_name,first_name,read_family,read_first,birthが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailに一意性があること' do
        @user.save
        another_user = User.new(nickname: 'sample', email: 'sample@sample', password: 'pppppp12', password_confirmation: 'pppppp12', family_name: '田中', first_name: '角栄', read_family: 'タナカ', read_first: 'カクエイ', birth: '1999-03-05')
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'emailが@を含む' do
        @user.email = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが6文字以上でないと登録できない' do
        @user.password = 'aaa12'
        @user.password_confirmation = 'aaa12'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordが英語のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordが全角では登録できない' do
        @user.password = '１１１１１１p'
        @user.password_confirmation = '１１１１１１p'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'famili_nameが空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it 'fmaily_nameがローマ字では登録できない' do
        @user.family_name = 'tanaka'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name is invalid')
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameがローマ字では登録できない' do
        @user.first_name = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it 'read_familyが空では登録できない' do
        @user.read_family = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Read family can't be blank")
      end
      it 'read_familyが漢字では登録できない' do
        @user.read_family = '田中'
        @user.valid?
        expect(@user.errors.full_messages).to include('Read family is invalid')
      end
      it 'read_firstが空では登録できない' do
        @user.read_first = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Read first can't be blank")
      end
      it 'read_firstがひらがなでは登録できない' do
        @user.read_first = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include('Read first is invalid')
      end
      it 'birthが空では登録できない' do
        @user.birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth can't be blank")
      end
    end
  end
end
