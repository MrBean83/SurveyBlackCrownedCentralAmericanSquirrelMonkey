class Completedsurvey < ActiveRecord::Base
  # validations
  
  # associations
  belongs_to :user
  belongs_to :survey
end
