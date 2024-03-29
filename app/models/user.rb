class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :votes, dependent: :destroy
         has_many :vote_values, through: :votes
         
         def voted_for?(poll)
          vote_values.any? {|v| v.poll == poll }
         end
end