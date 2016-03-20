import Ember from 'ember';
import { moduleForModel, test } from 'ember-qunit';

moduleForModel('exam', 'Unit | Model | exam', {
    needs: ['model:user', 'model:question']
});

test('totalPoints', function(assert) {
    let store = this.store();
    var result = -1;

    Ember.run(function() {
        var exam = store.createRecord('exam', { questions: [
            store.createRecord('question', {
                text: 'First question',
                points: 6
            }),
            store.createRecord('question', {
                text: 'Second question',
                points: 3
            })
        ]});

        result = exam.get('totalPoints');
    });

    assert.equal(result, 9);
});
