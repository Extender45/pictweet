require 'rails_helper'

RSpec.describe User, type: :model do
  before do
   @user=FactoryBot.build(:user)
 end  
  describe'ユーザー新規登録'do
    it'nicknameが空では登録できない'do
      @user.nickname=''
      # user=User.new(nickname:'',email:'test@example',password:'000000',password_confirmation:'000000')
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end 
    it'emailが空では登録できない'do
      @user.email=''
      # user=User.new(nickname:'test',email:'',password:'000000',password_confirmation:'000000')
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
  end
end
