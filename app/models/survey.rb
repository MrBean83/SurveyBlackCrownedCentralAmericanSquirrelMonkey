class Survey < ActiveRecord::Base
  # validations
  validates :name, presence: true
  # associations
  has_many :questions
  has_many :responses
  has_many :completedsurvey
  has_many :users, through: :completedsurvey
  has_one :photo
end
