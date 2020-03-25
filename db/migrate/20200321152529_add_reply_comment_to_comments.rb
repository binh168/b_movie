class AddReplyCommentToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :reply_comment, :integer
    change_column :comments, :content, :text
  end
end
