class Question < ActiveRecord::Base
  # validations

  # associations
  belongs_to :survey
  has_many :responses
end
