Package.describe({
  summary: "Sets reactive variables device-screensize, device-orientation and device-retina based on bootstrap 3 breakpoints",
  version: "1.0.0",
  name: "bootstrap3-media-query",
  githubUrl: "https://github.com/funkyeah/bootstrap3-media-query"
});

Package.onUse(function(api) {
  api.use(['coffeescript@1.0.0']);
  api.versionsFrom('METEOR@0.9.3.1');
  api.addFiles(['funkyeah:media-query.coffee'], 'client');
});

Package.onTest(function(api) {
  api.use('tinytest');
  api.use('funkyeah:media-query');
  api.addFiles(['funkyeah:media-query-tests.js'], 'client');
});
