(function($) {

var PROP_NAME = 'bubbly';

function Bubbly() {
  this.options = {
    css: 'bubbly',
    dismiss: 'dissolve',
    message: 'bring a bottle of bub'
  }
}

$.extend(Bubbly.prototype, {

  setOptions: function(opts) {
    $.extend(this.options, opts || {});
    return this;
  },

  makeBubble: function(ele, msg, opts) {
    var el$ = $(ele);
    // mark ele.data to indicate instrumented
    $.data(el$, 'isBubble', true);
    $.data(el$, 'bubbleOpts', $.extend(this.options, opts || {}));
    // construct bubble using correct opts
    var bub$ = $('<div>').
      attr({
        'id': 'bubble-' + el$.attr('id'),
        'class': this.options.css
      }).
      html(msg); // compute msg
    el$.after(bub$)
//    bub$.wait(2000).fadeOut('slow', function(){bub$.remove();});
  },

  changeBubble: function(ele, opts, val) {
  },

  destroy: function(ele) {
    var el$ = $(ele);
  },

  getOptions: function(ele) {
    var el = $.data(ele, PROP_NAME);
    return el.settings;
  }
});


var getters = ['getOptions'];

$.fn.bubbly = function(msg, opts) {
  var args = Array.prototype.slice.call(arguments, 1);
  if ($.inArray(opts, getters) > -1) {
    return $.bubbly[opts].apply($.bubbly, [this[0]].concat(args));
  }
  return this.each(function() {
    if (typeof opts == 'string') {
      $.bubbly[opts].apply($.bubbly, [this].concat(args));
    }
    else {
      $.bubbly.makeBubble(this, msg, opts || {});
    }
  });
}

$.bubbly = new Bubbly(); // singleton instance



$.fn.wait = function(time, type) {
  time = time || 1000;
  type = type || "fx";
  return this.queue(type, function() {
    var self = this;
    setTimeout(function() {
      $(self).dequeue();
    }, time);
  });
};




})(jQuery);

