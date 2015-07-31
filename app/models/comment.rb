class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  def author
    user.username
  end
end
