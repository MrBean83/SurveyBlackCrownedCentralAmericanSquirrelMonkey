$(document).ready(function() {  

  var question_counter = 1;
  var response_counter = 1;
  function newResponse() { return '<div class="responses"><input type="text" name="question' + question_counter + '[response' + response_counter + ']" ><br></div><div class="ADD_RESPONSE_HERE"></div>' }
  function newQuestion() { return '<div class="question"><label>Ask a Question: </label><input type="text" name="question' + question_counter + '[question]" ><br><br><label>Give some Choices: </label><div class="responses"><input type="text" name="question' + question_counter + '[response' + response_counter + ']" >  <input type="button" class="add_response" value="+"><br></div><div class="ADD_RESPONSE_HERE"></div><br><br></div>' }

  $("#add_question").on("click", function(e)
  {
    e.preventDefault();
    question_counter++;
    response_counter ++;
    $("#ADD_HERE").replaceWith(newQuestion());

    $(".add_response").last().on("click", function(event){
      event.preventDefault();
      response_counter ++;
      ($(".ADD_RESPONSE_HERE").last()).replaceWith(newResponse());
    });
  });

  $("#remove_question").on("click", function(e){
  // Look at .after as alternative to append
  $(".question").last().remove();
  question_counter--;
});

  $(".add_response").last().on("click", function(event){
    event.preventDefault();
    response_counter ++;
    $(".ADD_RESPONSE_HERE").last().replaceWith(newResponse());
  });
});

