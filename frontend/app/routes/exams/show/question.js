import Ember from 'ember';

export default Ember.Route.extend({
    model: function(params) {
        return this.store.findRecord('question', params.question_id);
    },

    actions: {
        updateQuestion: function() {
            var route = this;
            this.modelFor('exams.show.question').save().then(function() {
                route.notify.success('Successfully updated question!');
            }, function(error) {
                route.notify.warning('Couldn\'t update the question.');
            });
        },
        deleteQuestion: function() {
            var route = this;

            if(confirm('Are you sure you want to delete this question?')) {
                this.modelFor('exams.show.question').destroyRecord().then(function() {
                    route.transitionTo('exams.show');
                }, function(error) {
                    route.notify.error('Something went wrong while deleting the question :(');
                });
            }
        },
        moveUp: function() {
            var route = this;
            this.modelFor('exams.show.question').moveUp().then(function() {
                route.modelFor('exams.show').reload();
                route.modelFor('exams.show.question').reload();
            }, function(error) {
                route.notify.warning('Couldn\'t move question :/');
            });
        },
        moveDown: function() {
            var route = this;
            this.modelFor('exams.show.question').moveDown().then(function() {
                route.modelFor('exams.show').reload();
                route.modelFor('exams.show.question').reload();
            }, function(error) {
                route.notify.warning('Couldn\'t move question :/');
            });
        },
    }
});
