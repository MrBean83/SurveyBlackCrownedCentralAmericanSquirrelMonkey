class Question < ActiveRecord::Base
  # validations
  validates :content, presence: true
  # associations
  belongs_to :survey
  has_many :responses
end
