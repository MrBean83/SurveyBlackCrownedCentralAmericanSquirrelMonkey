class User < ActiveRecord::Base
  # validations

  # associations
  has_many :completedsurvey
  has_many :userresponse
  has_many :surveys, through: :completedsurvey
  has_many :responses, through: :userresponse

end
