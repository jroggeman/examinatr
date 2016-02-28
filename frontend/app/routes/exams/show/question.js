import Ember from 'ember';

export default Ember.Route.extend({
    model: function(params) {
        // TODO: Inefficient
        return this.store.findAll('question').findBy('id', params.question_id);
    }
});
