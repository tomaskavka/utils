should = require('chai').should()
utils = require('../lib/utils.js')

describe('isDomain', ->
	it('wrong domains', ->
		utils.isDomain({domain: 'tomaskavka.cz'}).should.be.false
		utils.isDomain('http://www.tomaskavka.cz').should.be.false
		utils.isDomain('www.tomaskavka.cz').should.be.false
		utils.isDomain('192.168.0.19').should.be.false
	)

	it('OK', ->
		utils.isDomain('tomaskavka.cz').should.be.true
	)
)

describe('isIPAddress', ->
	it('wrong IP addresses', ->
		utils.isIPAddress({ip: '256.2.2'}).should.be.false
		utils.isIPAddress('http://www.tomaskavka.cz').should.be.false
		utils.isIPAddress('256.2.2').should.be.false
		utils.isIPAddress('256.168.0.19').should.be.false
	)

	it('OK', ->
		utils.isIPAddress('225.19.19.19').should.be.true
	)
)

describe('isURL', ->
	it('wrong URL addresses', ->
		utils.isURL({url: 'tomaskavka.cz'}).should.be.false
		utils.isURL('tomaskavka.cz').should.be.false
		utils.isURL('ftp://www.tomaskavka.cz').should.be.false
		utils.isURL('225.168.0.19').should.be.false
	)

	it('OK', ->
		utils.isURL('http://www.tomaskavka.cz').should.be.true
		utils.isURL('https://www.tomaskavka.cz').should.be.true
		utils.isURL('http://www.tomaskavka.cz/test').should.be.true
	)
)

describe('between', ->
	describe('number', ->
		it('missing', ->
			utils.between().should.be.false
		)

		it('wrong type', ->
			utils.between({test: 'ok'}).should.be.false
		)
	)

	describe('min', ->
		it('missing', ->
			utils.between(19).should.be.false
		)

		it('wrong type', ->
			utils.between(19, {test: 'ok'}).should.be.false
		)
	)

	describe('max', ->
		it('missing', ->
			utils.between(19, 0).should.be.false
		)

		it('wrong type', ->
			utils.between(19, 0, {test: 'ok'}).should.be.false
		)
	)

	it('OK', ->
		utils.between(19, 20, 210).should.be.false
		utils.between(19, 0, 18).should.be.false
		utils.between(19, 19, 20).should.be.true
		utils.between(19, 0, 19).should.be.true
		utils.between(19, 0, 20).should.be.true
	)
)

describe('isInt', ->
	it('wrong integers', ->
		utils.isInt({int: 20}).should.be.false
		utils.isInt('20').should.be.false
		utils.isInt(20.2).should.be.false
		utils.isInt(NaN).should.be.false
	)

	it('OK', ->
		utils.isInt(-10).should.be.true
		utils.isInt(0).should.be.true
		utils.isInt(19).should.be.true
	)
)