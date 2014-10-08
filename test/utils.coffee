should = require('chai').should()
utils = require('../lib/utils.js')

describe('isDomain', ->
	it('wrong domains', ->
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