import { moduleForModel, test } from 'ember-qunit';

moduleForModel('question', 'Unit | Model | question', {
  // Specify the other units that are required for this test.
  needs: ['model:exam']
});

test('it exists', function(assert) {
  let model = this.subject();
  // let store = this.store();
  assert.ok(!!model);
});
