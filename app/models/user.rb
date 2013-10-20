class User < ActiveRecord::Base
  # validations
  validates :name, presence: true, uniqueness: true, length: { minimum: 3 }
  validates :password, presence: true, length: { in: 6..20 }
  # associations
  has_many :completedsurvey
  has_many :userresponse
  has_many :surveys, through: :completedsurvey
  has_many :responses, through: :userresponse

end
