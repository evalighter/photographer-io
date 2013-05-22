class CommentThread < ActiveRecord::Base
  include IdentityCache

  belongs_to :user
  belongs_to :threadable, polymorphic: true
  has_many :comments
  has_many :commenters, through: :comments, source: :user

  validates :user_id, :threadable_id, :threadable_type, presence: true
end