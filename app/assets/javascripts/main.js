require.config({
  baseUrl: "/assets",
  paths: {
    "jquery": "jquery/jquery",
    "jqery-ujs": "jquery-ujs/src/rails",
    "bootstrap-dropdown": "twitter/bootstrap/bootstrap-dropdown",
    "bootstrap-modal": "twitter/bootstrap/bootstrap-modal",
    "handlebars": "handlebars",
    "typeahead": "typeahead.js/dist/typeahead",
    "underscore": "underscore/underscore",
    "d3": "d3/d3"
  },
  shim: {
    "jquery-ujs": {
      deps: ["jquery"]
    },
    "bootstrap-dropdown": {
      deps: ["jquery"]
    },
    "bootstrap-modal": {
      deps: ["jquery"]
    },
    "typeahead": {
      deps: ["jquery"]
    }
  }
});

require(['jquery', 'underscore', 'router'], function($, _, CopeRouter) {

  // setup & remove globals
  $.noConflict(true);
  _.noConflict();

  $(function() {
    new CopeRouter();
    Backbone.history.start({pushState: true});
  });
});
