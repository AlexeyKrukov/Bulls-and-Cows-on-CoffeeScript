window.start = (form) ->
    input1 = form.digit.value
    random_array = []
    bulls = 0
    cows = 0
    black_list = []
    visited = no
    valid = (callback)->
        callback()
        return
    valid ->
            if(input1.match(/[0-9]{4}/))
                ##alert(input1)
                return
            else 
                alert("Wrong digit, try again")
                location.reload()
                return
    composition = (callback)->
        random_array = callback()
        localStorage.setItem("random", random_array)
        return
    if(form.visited.value == "no")
        composition ->
                        for i in [0..3]
                            number = Math.random() * (9)
                            number = number.toFixed(0)
                            random_array.push(number);
                        for i in [0..3]
                            for j in [0..3]
                                if random_array[i] == random_array[j] && i != j
                                    number = Math.random() * (9)
                                    number = number.toFixed(0)
                                    random_array[i] = number
                                    j = 0
                                    i = 0
                                j = 0
                        form.visited.value = "yes";                                   
                        return random_array
    input_array = input1.split('')
    ##alert(input_array)
    comparision = (callback)->
        answer = callback()
        if(answer.localeCompare("Win") == 0)
            answer_confirm = confirm("You won! Wont to play again?")
            if(answer_confirm == true)
                location.reload()
                return
            else 
                window.close()
                return
        alert(answer)
        return
    comparision ->
                    random_array = localStorage.getItem("random")
                    random_array = random_array.split(',')
                    for i in [0..3]
                        for j in [0..3]
                            if(random_array[i] == input_array[j] && i == j)
                                bulls++
                            if(random_array[i] == input_array[j] && i != j)
                                cows++
                    if(bulls == 4)
                        return "Win"
                    ##alert(localStorage.getItem("random"))
                    return bulls + " bulls " + cows + " cows."
    return