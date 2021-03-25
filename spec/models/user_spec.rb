require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
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
