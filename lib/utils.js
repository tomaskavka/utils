// Generated by CoffeeScript 1.7.1
var utils;

utils = (function() {
  function utils() {}

  utils.DOMAIN_PATTERN = /([^.]*\.[^.]*)$/;

  utils.IP_PATTERN = /\b(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\b/;

  utils.URL_PATTERN = /https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)/gi;

  utils.isDomain = function(str) {
    return str === str.match(utils.DOMAIN_PATTERN)[0];
  };

  utils.isIPAddress = function(str) {
    return str.match(utils.IP_PATTERN) != null;
  };

  utils.isURL = function(str) {
    var match;
    match = str.match(utils.URL_PATTERN);
    if (match != null) {
      return str === match[0];
    } else {
      return false;
    }
  };

  return utils;

})();

utils.Stopwatch = require('./stopwatch');

module.exports = utils;