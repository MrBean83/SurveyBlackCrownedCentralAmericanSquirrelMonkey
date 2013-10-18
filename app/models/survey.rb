class Survey < ActiveRecord::Base
  # validations

  # associations
  has_many :questions
  has_many :responses
  has_many :completedsurvey
  has_many :users, through: :completedsurvey
end
