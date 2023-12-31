class Post < ApplicationRecord
  validates :title, presence: true, length: {minimum: 2}
  validates :body, presence: true, length: {minimum: 5}
  has_many :comments, dependent: :destroy
  belongs_to :user
end
