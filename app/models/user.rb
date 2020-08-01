class User < ApplicationRecord
  USER_PARAMS = %i(fullname avatar email password).freeze

  has_many :comments, dependent: :destroy
  has_many :user_comment, class_name: Comment.name, foreign_key: :user_id
  has_many :ratings, dependent: :destroy

  enum role: {user: 0, admin: 1}

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable
end
