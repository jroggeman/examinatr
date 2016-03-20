import Ember from 'ember';

export default Ember.Route.extend({
    model: function(params) {
        return this.store.findRecord('question', params.question_id);
    },

    actions: {
        updateQuestion: function() {
            // TODO: Add promise callbacks
            this.modelFor('exams.show.question').save();
        },
        deleteQuestion: function() {
            var route = this;

            this.modelFor('exams.show.question').destroyRecord().then(function() {
                // TODO: Do we need to specify the exam here?
                route.transitionTo('exams.show');
            });
        }
    }
});
