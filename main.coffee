window.start = (form) ->
    input1 = form.digit.value
    random_array = []
    bulls = 0
    cows = 0
    valid = (callback)->
        callback()
        return
    valid ->
            if(input1.match(/[0-9]{4}/))
                alert(input1)
                return
            else 
                alert("Wrong digit, try again")
                location.reload()
                return
    composition = (callback)->
        random_array = callback()
        alert(random_array)
        return
     composition ->
                    for i in [0..3]
                        number = Math.random() * (9)
                        number = number.toFixed(0)
                        random_array.push number
                    return random_array
    input_array = input1.split('')
    alert(input_array)
    comparision = (callback)->
        answer = callback()
        if(answer.localeCompare("Win") == 0)
            answer_confirm = confirm("You won! Wont to play again?")
            if(answer_confrim == 1)
                location.reload()
            else window.close()
    return
    comparision ->
                    for i in [0..3]
                        for j in [0..3]
                            if(random_array[i] == input_array[j] && i == j)
                                bulls++
                            if(random_array[i] == input_array[j] && i != j)
                                cows++
                    if(bulls == 4)
                        return "Win"
    return