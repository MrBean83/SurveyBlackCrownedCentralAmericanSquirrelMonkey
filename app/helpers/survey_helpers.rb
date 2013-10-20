helpers do

  def incomplete_surveys
    surveys = []
    completed = User.find(session[:user_id]).completedsurvey

    completed.each do |survey|
      surveys << Survey.find(survey.survey_id)
    end

    Survey.all - surveys
  end

end
