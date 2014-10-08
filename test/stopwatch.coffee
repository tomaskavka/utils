should = require('chai').should()
Stopwatch = require('../lib/utils.js').Stopwatch

describe('Construction', ->
	it('with deactivated autostart', ->
		sw = new Stopwatch(false)
		(not sw.startedAt?).should.be.true
		(not sw.stoppedAt?).should.be.true

		sw = Stopwatch.create(false)
		(not sw.startedAt?).should.be.true
		(not sw.stoppedAt?).should.be.true
	)

	it('with activated autostart', ->
		sw = new Stopwatch
		sw.startedAt.should.be.above(1412706791719)
		(not sw.stoppedAt?).should.be.true

		sw = Stopwatch.create()
		sw.startedAt.should.be.above(1412706791719)
		(not sw.stoppedAt?).should.be.true
	)
)

describe('Start', ->
	it('everything OK', ->
		sw = new Stopwatch(false)
		(not sw.startedAt?).should.be.true
		sw.start()
		sw.startedAt.should.be.above(1412706791719)
		(not sw.stoppedAt?).should.be.true

		sw = Stopwatch.create(false)
		(not sw.startedAt?).should.be.true
		sw.start()
		sw.startedAt.should.be.above(1412706791719)
		(not sw.stoppedAt?).should.be.true
	)
)

describe('Stop', ->
	it('everything OK', ->
		sw = new Stopwatch
		sw.startedAt.should.be.above(1412706791719)
		(not sw.stoppedAt?).should.be.true
		sw.stop()
		sw.stoppedAt.should.be.above(1412706791719)

		sw = Stopwatch.create()
		sw.startedAt.should.be.above(1412706791719)
		(not sw.stoppedAt?).should.be.true
		sw.stop()
		sw.stoppedAt.should.be.above(1412706791719)
	)
)

describe('Result', ->
	it('not started yet', ->
		sw = new Stopwatch(false)
		(not sw.startedAt?).should.be.true
		(not sw.stoppedAt?).should.be.true
		(->
			sw.result()
		).should.throw('You have to start stopwatch first!')

		sw = Stopwatch.create(false)
		(not sw.startedAt?).should.be.true
		(not sw.stoppedAt?).should.be.true
		(->
			sw.result()
		).should.throw('You have to start stopwatch first!')
	)

	it('everything OK', ->
		sw = new Stopwatch
		sw.startedAt.should.be.above(1412706791719)
		(not sw.stoppedAt?).should.be.true
		setTimeout(->
			res = sw.result()
			res.should.be.above(10)
			res.should.equal(sw.stoppedAt - sw.startedAt)
		, 10)

		sw = Stopwatch.create()
		sw.startedAt.should.be.above(1412706791719)
		(not sw.stoppedAt?).should.be.true
		setTimeout(->
			res = sw.result()
			res.should.be.above(10)
			res.should.equal(sw.stoppedAt - sw.startedAt)
		, 10)
	)
)