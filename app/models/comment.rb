class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :film

  validates :content, presence: true
  
  COMMENT_PARAMS = %i(content film_id reply_comment).freeze

  scope :list_comment, ->(film_id){where(film_id: film_id, reply_comment: nil)}
  scope :order_comment, ->{order created_at: :desc}

  def sub_comments
    Comment.where reply_comment: id
  end
end
