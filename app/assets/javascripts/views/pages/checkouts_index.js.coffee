require ['views/base/view', 'd3'], (View, d3) ->
  class CheckoutsIndex extends View
    autoRender: true

    render: ->
      @setupChart()

    setupChart: ->
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