class Distan.Views.Distance extends Backbone.View
  initialize: ->
    @buildFrom()
    @buildTo()

    $('.from__form').on 'submit', @buildFrom
    $('.to__form').on 'submit', @buildTo

  buildFrom: (e) =>
    e.preventDefault() if e
    $from = $('#from')
    from = $from.find('input').val()
    console.log from
    geocoder = new google.maps.Geocoder()
    geocoder.geocode(address: from, @renderFrom)

  buildTo: (e) =>
    e.preventDefault() if e
    $to = $('#to')
    to = $to.find('input').val()
    console.log to
    geocoder = new google.maps.Geocoder()
    geocoder.geocode(address: to, @renderTo)

  renderFrom: (res, status) =>
    latlng = res[0].geometry.location
    @buildMap(latlng, 'from__map')

  renderTo: (res, status) =>
    latlng = res[0].geometry.location
    @buildMap(latlng, 'to__map')

  buildMap: (latlng, id) =>
    mapOptions =
      zoom: 15
      center: latlng
      mapTypeId: google.maps.MapTypeId.ROADMAP

    @map = new google.maps.Map(document.getElementById(id), mapOptions)

$ -> new Distan.Views.Distance()
