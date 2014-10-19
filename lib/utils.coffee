_ = require('lodash')

class utils

	# Patterns
	@DOMAIN_PATTERN: /([^.]*\.[^.]*)$/
	@IP_PATTERN: /\b(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\b/
	#@URL_PATTERN: /https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&#=]*)/gi
	# Thx: https://gist.github.com/dperini/729294
	@URL_PATTERN: /^(?:(?:https?|ftp):\/\/)(?:\S+(?::\S*)?@)?(?:(?!(?:10|127)(?:\.\d{1,3}){3})(?!(?:169\.254|192\.168)(?:\.\d{1,3}){2})(?!172\.(?:1[6-9]|2\d|3[0-1])(?:\.\d{1,3}){2})(?:[1-9]\d?|1\d\d|2[01]\d|22[0-3])(?:\.(?:1?\d{1,2}|2[0-4]\d|25[0-5])){2}(?:\.(?:[1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))|(?:(?:[a-z\u00a1-\uffff0-9]-*)*[a-z\u00a1-\uffff0-9]+)(?:\.(?:[a-z\u00a1-\uffff0-9]-*)*[a-z\u00a1-\uffff0-9]+)*(?:\.(?:[a-z\u00a1-\uffff]{2,})))(?::\d{2,5})?(?:\/\S*)?$/i
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

	@isInt: (num) ->
		return _.isNumber(num) and num % 1 is 0

# Plug-ins
utils.Stopwatch = require('./stopwatch')

module.exports = utils