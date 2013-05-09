require ['jquery', 'd3', 'typeahead'], ($, d3) ->

  # for checkouts#show. eventually need these to be separate files
  $('#checkout_biker_netid').typeahead
    name: 'bikers'
    valueKey: 'netid'
    prefetch:
      url: '/bikers.json'
      filter: (resp) ->
        for biker in resp
          biker.tokens = biker.full_name.split(' ').concat(biker.netid)
        resp
    template: (data) ->
      "<div class='tt-suggestion'><p>#{data.full_name} <strong>(#{data.netid})</strong></p></div>"

  # for checkouts#index. eventually need these to be separate files
  w = 20
  h = 80
  data = COPE.checkouts || {} # fallback is temporary since appears on every page

  x = d3.scale.linear()
    .domain([0, 1])
    .range([0, w])

  y = d3.scale.linear()
    .domain([0, 100])
    .rangeRound([0, h])

  chart = d3.select("#chart-contain").append("svg")
    .attr("class", "chart")
    .attr("width", w * data.length - 1)
    .attr("height", h)

  chart.selectAll("rect")
    .data(data)
    .enter().append("rect")
    .attr("x", (d, i) -> x(i) - .5 )
    .attr("y", (d) -> h - y(d.id) - .5 )
    .attr("width", w)
    .attr("height", (d) -> y(d.id) )

  chart.append("line")
    .attr("x1", 0)
    .attr("x2", w * data.length)
    .attr("y1", h - .5)
    .attr("y2", h - .5)
    .style("stroke", "#000")