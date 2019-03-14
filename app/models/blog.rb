class Blog < ApplicationRecord
  has_many :entries
  belongs_to :user

  validates :title, presence: true
end
