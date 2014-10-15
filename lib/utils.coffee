_ = require('lodash')

class utils

	# Patterns
	@DOMAIN_PATTERN: /([^.]*\.[^.]*)$/
	@IP_PATTERN: /\b(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\b/
	@URL_PATTERN: /https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)/gi

	# Methods

	# Www
	@isDomain: (str) ->
		if not _.isString(str) then return false
		return (str is str.match(utils.DOMAIN_PATTERN)[0])

	@isIPAddress: (str) ->
		if not _.isString(str) then return false
		return str.match(utils.IP_PATTERN)?

	@isURL: (str) ->
		if not _.isString(str) then return false
		match = str.match(utils.URL_PATTERN)
		return if match? then (str is match[0]) else false

	# Number
	@between: (number, min, max) ->
		if not _.isNumber(number) or not _.isNumber(min) or not _.isNumber(max)
			return false
		return min <= number <= max

# Plug-ins
utils.Stopwatch = require('./stopwatch')

module.exports = utils