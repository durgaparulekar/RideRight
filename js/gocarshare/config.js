requirejs.config({
  baseUrl: "js/lib",
  paths: {
    "app": "../gocarshare"
  },
  shim: {
    "backbone": {
      deps: ["underscore"],
      exports: "Backbone"
    },
    "underscore": {
      exports: "_"
    }
  }
});