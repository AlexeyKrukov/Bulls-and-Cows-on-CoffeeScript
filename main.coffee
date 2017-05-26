window.start = (form) ->
    input1 = form.digit.value
    array = []
    ###do valid(do->
        (if(input1.match(/[0-9]4/))
            alert(input1)
        else 
            alert("Wrong digit, try again")
            location.reload())
    )###
    ###valid = (callback)->
    do callback.call(this)
    return###
    composition = (callback)->
        do callback
    do composition(do-> 
            for i in [0..3]
                number = Math.random() * (9)
                number = number.toFixed(0)
                array.push number
            return array
    )
    return