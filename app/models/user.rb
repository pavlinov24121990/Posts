class User < ApplicationRecord
  # Include default devise modules. Others available are:
    validates :first_name, presence: true, length: {minimum: 2}
    validates :second_name, presence: true, length: {minimum: 5}
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable
         has_many :posts, dependent: :destroy
         has_many :comments, dependent: :destroy
end
