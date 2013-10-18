class Response < ActiveRecord::Base
  # validations

  # associations
  belongs_to :question
  belongs_to :surveys
  has_many :userresponse
  has_many :users, through: :userresponse
end
