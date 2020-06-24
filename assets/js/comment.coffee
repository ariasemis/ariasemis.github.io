---
---
submitComment = (e) ->
    e.preventDefault()
    form = e.target
    button = e.submitter

    # disable while in progress
    button.disabled = true
    button.classList.add 'loading'
    button.innerHTML = 'Sending...'
    
    sucMsg = document.querySelector '.success-message'
    sucMsg.style.display = 'none'
    errMsg = document.querySelector '.error-message'
    errMsg.style.display = 'none'
    
    # data
    formData = new FormData(form)
    formData.delete 'options[redirect]'
    reqBody = new URLSearchParams(formData)

    # submit
    request = 
        method: form.method
        body: reqBody
    fetch form.action, request
    .then (response) ->
        button.classList.remove 'loading'

        if response.ok
            msg = document.querySelector '.success-message'
            msg.style.display = 'block'

            button.classList.add 'disallowed'
            button.innerHTML = 'Submitted'
        else
            msg = document.querySelector '.error-message'
            msg.style.display = 'block'
            
            button.disabled = false
            button.innerHTML = 'Submit'

    true

form = document.querySelector '.comment-form'
form.addEventListener 'submit', submitComment, false