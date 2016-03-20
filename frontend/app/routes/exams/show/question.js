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

            if(confirm('Are you sure you want to delete this question?')) {
                this.modelFor('exams.show.question').destroyRecord().then(function() {
                    route.transitionTo('exams.show');
                });
            }
        }
    }
});
