user = User.create(name: "Zack", password: "password")
questioneer = User.create(name: "Guy", password: "password")
survey = Survey.create(user_id: user.id, name: "How awesome are you?")
question = Question.create(survey_id: survey.id, content: "Are you cool?")
response_1 = Response.create(question_id: question.id, survey_id: survey.id, content: "Yes")
response_2 = Response.create(question_id: question.id, survey_id: survey.id, content: "No")
response_3 = Response.create(question_id: question.id, survey_id: survey.id, content: "Maybe")
response_4 = Response.create(question_id: question.id, survey_id: survey.id, content: "So")
completed_survey = Completedsurvey.create(user_id: questioneer.id, survey_id: survey.id )
user_response = Userresponse.create(user_id: questioneer.id, response_id: response_1.id )


survey2 = Survey.create(user_id: questioneer.id, name: "Cats")
question2 = Question.create(survey_id: survey2.id, content: "Do You Like Cats?")
response2 = Response.create(question_id: question2.id, survey_id: survey2.id, content: "No")
completed_survey2 = Completedsurvey.create(user_id: user.id, survey_id: survey2.id )
user_response2 = Userresponse.create(user_id: user.id, response_id: response2.id )
