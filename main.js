// Generated by CoffeeScript 1.12.6
(function() {
  window.start = function(form) {
    var black_list, bulls, comparision, composition, cows, input1, input_array, random_array, valid, visited;
    input1 = form.digit.value;
    random_array = [];
    bulls = 0;
    cows = 0;
    black_list = [];
    visited = false;
    valid = function(callback) {
      callback();
    };
    valid(function() {
      if (input1.match(/[0-9]{4}/)) {

      } else {
        alert("Wrong digit, try again");
        location.reload();
      }
    });
    composition = function(callback) {
      random_array = callback();
      localStorage.setItem("random", random_array);
    };
    if (form.visited.value === "no") {
      composition(function() {
        var i, j, k, l, m, number;
        for (i = k = 0; k <= 3; i = ++k) {
          number = Math.random() * 9;
          number = number.toFixed(0);
          random_array.push(number);
        }
        for (i = l = 0; l <= 3; i = ++l) {
          for (j = m = 0; m <= 3; j = ++m) {
            if (random_array[i] === random_array[j] && i !== j) {
              number = Math.random() * 9;
              number = number.toFixed(0);
              random_array[i] = number;
              j = 0;
              i = 0;
            }
            j = 0;
          }
        }
        form.visited.value = "yes";
        return random_array;
      });
    }
    input_array = input1.split('');
    comparision = function(callback) {
      var answer, answer_confirm;
      answer = callback();
      if (answer.localeCompare("Win") === 0) {
        answer_confirm = confirm("You won! Wont to play again?");
        if (answer_confirm === true) {
          location.reload();
          return;
        } else {
          window.close();
          return;
        }
      }
      alert(answer);
    };
    comparision(function() {
      var i, j, k, l;
      random_array = localStorage.getItem("random");
      random_array = random_array.split(',');
      for (i = k = 0; k <= 3; i = ++k) {
        for (j = l = 0; l <= 3; j = ++l) {
          if (random_array[i] === input_array[j] && i === j) {
            bulls++;
          }
          if (random_array[i] === input_array[j] && i !== j) {
            cows++;
          }
        }
      }
      if (bulls === 4) {
        return "Win";
      }
      return bulls + " bulls " + cows + " cows.";
    });
  };

}).call(this);
