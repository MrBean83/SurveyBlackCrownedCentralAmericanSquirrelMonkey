$(document).ready(function() {
  var newQuestion = '<div class="question"><label>Ask a Question: </label><input type="text" name="question_content" ><br><br><label>Give some Choices: </label><div class="responses"><input type="text" name="response1" ><br></div><br><br></div><div id="ADD_HERE"><br></div>';
  var question_counter = 1;
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
});
