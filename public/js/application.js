var question_counter = 2;
var response_counter = 2;

$(document).ready(function() {
  var newQuestion = '<div class="question"><label>Ask a Question: </label><input type="text" name="questions[' + question_counter + ']" ><br><br><label>Give some Choices: </label><div class="responses"><input type="text" name="response1" ><input type="button" class="add_response" value="+"><br><div class="ADD_RESPONSE_HERE"><br></div><br><br></div><div id="ADD_HERE"><br></div>';
  var newResponse = '<div class="responses"><input type="text" name="response1" >  <input type="button" class="add_response" value="+"><br></div><div class="ADD_RESPONSE_HERE"></div>'
  $("#add_question").on("click", function(e)
  {
    e.preventDefault();
    $("#ADD_HERE").replaceWith(newQuestion);
    question_counter++;
  });
  $("#remove_question").on("click", function(e){
  // Look at .after as alternative to append
  $(".question").last().remove();
  question_counter--;
 });
    $(".add_response").last().on("click", function(event){
      event.preventDefault();
     ($(".ADD_RESPONSE_HERE").last()).replaceWith(newResponse);
    });
});

