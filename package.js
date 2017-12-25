Package.describe({
  name: 'ashish979:clusterize-blaze',
  version: '0.0.1',
  summary: 'modified clusterize.js to use with blaze',
  git: 'https://github.com/ashish979/clusterize-blaze.git',
  documentation: 'README.md'
});

Package.onUse(function(api) {
  api.versionsFrom('1.6.0.1');
  api.use('ecmascript');
  api.use('coffeescript@1.2.3');
  api.use('mquandalle:jade@0.4.9');
  api.use('mquandalle:jade-compiler@0.4.5');
  api.use('templating');
  api.addFiles('clusterize.css', 'client');
  api.mainModule('clusterize.coffee', 'client');
});

Npm.depends({
    globals: "11.1.0",
    amd: '0.0.0',
    commonjs: '0.0.1'
});
