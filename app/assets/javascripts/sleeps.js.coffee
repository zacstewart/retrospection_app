# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  margin =
    top: 20
    bottom: 20
    left: 10
    right: 10
  width = 940
  height = 300

  d3.json '/sleeps.json', (sleeps) ->
    sleeps.forEach (sleep) ->
      sleep.date = Date.parse(sleep.slept_at)

    xScale = d3.scale.ordinal()
      .domain(d3.range(sleeps.length))
      .rangeRoundBands([width - margin.left - margin.right, margin.left + margin.right], .1)

    yScale = d3.scale.linear()
      .domain([0, d3.max(sleeps.map((d) -> d.seconds_asleep))])
      .range([height - margin.top - margin.bottom, margin.top + margin.bottom])

    yAxis = d3.svg.axis()
      .scale(yScale)
      .orient('right')
      .tickSize(1)
      .tickPadding(5)

    svg = d3.select('#sleeps').append('svg')
        .attr('class', 'chart bar')
        .attr('width', width)
        .attr('height', height)

    svg.append('g')
      .selectAll('rect.bar')
        .data(sleeps)
      .enter().append('rect')
        .attr('class', 'bar')
        .attr('fill', 'steelblue')
        .attr('x', (d, i) -> xScale(i))
        .attr('y', (d) -> yScale(d.seconds_asleep))
        .attr('height', (d) -> height - margin.top - margin.bottom - yScale(d.seconds_asleep))
        .attr('width', xScale.rangeBand())

    svg.append('g')
        .attr('class', 'y axis')
        .attr('fill', '#333')
        .call(yAxis)
      .selectAll('text')
        .text((d) -> (d / 3600).toFixed(2))
