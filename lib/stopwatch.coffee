class Stopwatch

	startedAt: null
	stoppedAt: null

	constructor: (autostart = true) ->
		if (autostart) then @start()

	@create: (autostart) ->
		new Stopwatch(autostart)

	start: ->
		d = new Date()
		@startedAt = d.getTime()

	stop: ->
		d = new Date()
		@stoppedAt = d.getTime()

	result: ->
		if (not @startedAt?)
			throw new Error('You have to start stopwatch first!')
		if (not @stoppedAt?) then @stop()

		return @stoppedAt - @startedAt

module.exports = Stopwatch