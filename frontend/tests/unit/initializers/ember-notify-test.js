import Ember from 'ember';
import EmberNotifyInitializer from '../../../initializers/ember-notify';
import { module, test } from 'qunit';

let application;

module('Unit | Initializer | ember notify', {
  beforeEach() {
    Ember.run(function() {
      application = Ember.Application.create();
      application.deferReadiness();
    });
  }
});

// Replace this with your real tests.
test('it works', function(assert) {
  EmberNotifyInitializer.initialize(application);

  // you would normally confirm the results of the initializer here
  assert.ok(true);
});
