import { moduleForModel, test } from 'ember-qunit';

moduleForModel('exam', 'Unit | Model | exam', {
  // Specify the other units that are required for this test.
  needs: ['model:user']
});

test('it exists', function(assert) {
  let model = this.subject();
  // let store = this.store();
  assert.ok(!!model);
});
