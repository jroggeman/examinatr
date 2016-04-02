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
        },
        moveUp: function() {
            var route = this;
            this.modelFor('exams.show.question').moveUp().then(function() {
                route.modelFor('exams.show').reload();
                route.modelFor('exams.show.question').reload();
            });
        },
        moveDown: function() {
            var route = this;
            this.modelFor('exams.show.question').moveDown().then(function() {
                route.modelFor('exams.show').reload();
                route.modelFor('exams.show.question').reload();
            });
        },
    }
});
