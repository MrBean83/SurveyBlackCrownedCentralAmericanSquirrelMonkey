class Userresponse < ActiveRecord::Base
  # validations
  
  # associations
  belongs_to :user
  belongs_to :response
end
