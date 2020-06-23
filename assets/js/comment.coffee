---
---
submitComment = (e) ->
    e.preventDefault()

    form = e.target
    
    formData = new FormData(form)
    formData.delete 'options[redirect]'
    
    reqBody = new URLSearchParams(formData) # [formData...]
    console.log reqBody.toString() # TODO: 

    request = 
        method: form.method
        body: reqBody
    
    console.log request # TODO: 

    fetch form.action, request
    .then (response) ->
        # TODO:
        console.log response # TODO: 

    true

form = document.querySelector '.comment-form'
form.addEventListener 'submit', submitComment, false