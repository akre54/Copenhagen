require.config({
  baseUrl: '/assets',
  paths: {
    'jquery': 'jquery/jquery',
    'jqery-ujs': 'jquery-ujs/src/rails',
    'bootstrap-dropdown': 'twitter/bootstrap/bootstrap-dropdown',
    'bootstrap-modal': 'twitter/bootstrap/bootstrap-modal',
    'handlebars': 'handlebars',
    'typeahead': 'typeahead.js/dist/typeahead',
    'underscore': 'underscore/underscore',
    'backbone': 'backbone/backbone',
    'chaplin': 'chaplin/amd/chaplin',
    'd3': 'd3/d3'
  },
  shim: {
    'jquery': {
      init: function() {
        return $.noConflict(true);
      }
    },
    'jquery-ujs': ['jquery'],
    'bootstrap-dropdown': ['jquery'],
    'bootstrap-modal': ['jquery'],
    'typeahead': ['jquery'],
    'underscore': {
      init: function() {
        return _.noConflict();
      }
    },
    'backbone': {
      deps: ['underscore', 'jquery'],
      init: function() {
        return Backbone.noConflict();
      }
    }
  }
});

require(['jquery', 'backbone', 'router', 'bootstrap-dropdown'], function($, Backbone, CopeRouter) {
  $(function() {
    new CopeRouter();
    Backbone.history.start({pushState: true});
  });
});
