# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  options =
    enableHighAccuracy: true
    timeout: 5000
    maximumAge: 0

  success = (pos) ->
    window.lat = pos.coords.latitude
    window.lon = pos.coords.longitude
    console.log(pos)
    console.log "lat " + lat
    console.log "lon " + lon
    $('#location').attr('href', "/?lat="+lat+"&lon="+lon)
    return

  error = (err) ->
    console.warn "ERROR(" + err.code + "): " + err.message
    return

  navigator.geolocation.getCurrentPosition success, error, options

  #$('#location').click ->
    #window.open("/?lat="+lat+"&lon="+lon)
