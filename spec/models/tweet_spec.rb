require 'rails_helper'

RSpec.describe Tweet, type: :model do
  befoure do
    @tweet=FactoryBot.build(:tweet)
  end
  describe'seve tweet'do
    context'can uplording tweet'do
      it 'have image and text'do
        expect(@tweet).to be_valid
      end
      it'have onry image'do
        @tweet.image=''
        expect(@tweet).to be_valid
      end
    end
    context'can not uplording tweet'do
      it 'enpty the text'do
        @tweet.text=''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("text can't be enpty")

      end
      it'can not understand username is can not tweet'do
        @tweet.user=nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("User ABSO MUST exist")

      end
    end
  end
end
