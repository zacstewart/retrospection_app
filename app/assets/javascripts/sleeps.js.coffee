# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  margin =
    top: 10
    bottom: 10
  width = 940
  height = 200

  d3.json '/sleeps.json', (sleeps) ->
    xScale = d3.scale.ordinal()
      .domain(d3.range(sleeps.length))
      .rangeRoundBands([height - margin.top - margin.bottom, 0], .2)

    heightScale = d3.scale.linear()
      .domain([0, d3.max(sleeps.map((d) -> d.seconds_asleep))])
      .range([0,height])

    svg = d3.select('#sleeps').append('svg')
        .attr('class', 'chart bar')
        .attr('width', width)
        .attr('height', height)
      .append('g')
        .attr('transform', "translate(10, 10)")

    svg.selectAll('rect')
      .data(sleeps)
    .enter().append('rect')
      .attr('x', (d, i) -> xScale(i))
      .attr('y', (d) -> height - heightScale(d.seconds_asleep))
      .attr('height', (d) -> heightScale(d.seconds_asleep))
      .attr('width', xScale.rangeBand())
