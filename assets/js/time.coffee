---
---
scale = {}
scale['second'] = 1000
scale['minute'] = scale['second'] * 60
scale['hour'] = scale['minute'] * 60
scale['day'] = scale['hour'] * 24
scale['month'] = scale['day'] * 30
scale['year'] = scale['day'] * 365

units = Object.keys(scale).reverse() # we need the values in desc order

# friendly time string between 2 dates
elapsed = (previous, current) ->
    unless current?
        current = new Date()
    
    diff = current - previous

    match = units.find (unit) -> diff / scale[unit] >= 1
    
    unless match?
        match = units[units.length - 1]
    
    value = Math.floor diff / scale[match]

    "#{value} #{match}#{ if value == 1 then '' else 's' } ago"

# display time in decorated span
render = (time) ->
    date = Date.parse time.getAttribute 'datetime'
    span = time.querySelector '.ago'
    if span?
        span.innerHTML = elapsed date

timeElements = document.querySelectorAll 'time'
render time for time in timeElements