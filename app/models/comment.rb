class Comment < ApplicationRecord
  belongs_to :entry

  COMMENT_STATUS_APPROVED = "approved".freeze
  COMMENT_STATUS_APPROVED = "unapproved".freeze
end
