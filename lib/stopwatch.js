// Generated by CoffeeScript 1.7.1
var Stopwatch;

Stopwatch = (function() {
  Stopwatch.prototype.startedAt = null;

  Stopwatch.prototype.stoppedAt = null;

  function Stopwatch(autostart) {
    if (autostart == null) {
      autostart = true;
    }
    if (autostart) {
      this.start();
    }
  }

  Stopwatch.create = function(autostart) {
    return new Stopwatch(autostart);
  };

  Stopwatch.prototype.start = function() {
    var d;
    d = new Date();
    return this.startedAt = d.getTime();
  };

  Stopwatch.prototype.stop = function() {
    var d;
    d = new Date();
    return this.stoppedAt = d.getTime();
  };

  Stopwatch.prototype.result = function() {
    if (this.startedAt == null) {
      throw new Error('You have to start stopwatch first!');
    }
    if (this.stoppedAt == null) {
      this.stop();
    }
    return this.stoppedAt - this.startedAt;
  };

  return Stopwatch;

})();

module.exports = Stopwatch;