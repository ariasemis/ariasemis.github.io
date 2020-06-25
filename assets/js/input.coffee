---
---
# set size of textarea based on content
# it exploits the fact that labels automatically size to their content
# by setting the label:after content to the content of the textarea
# most of the functionality is actually in the CSS class
for element in document.querySelectorAll '.autosize'
    do (element) ->
        textarea = element.querySelector 'textarea'
        textarea.style.resize = 'none'
        textarea.addEventListener 'input', (e) -> element.dataset.value = textarea.value
