import Ember from 'ember';

export default Ember.Route.extend({
    model: function() {
        return this.store.createRecord('question');
    },

    actions: {
        createQuestion: function(points, text, answer) {
            var route = this;
            if(!points || !text || !answer) {
                route.notify.warning('Please fill out entire form!');
                return;
            }

            var question = this.store.createRecord('question', {
                text: text,
                answer: answer,
                points: points,
                exam: this.modelFor('exams.show')
            });

            var route = this;
            var controller = this.controllerFor('exams.show.new');

            question.save().then(function() {
                controller.set('model', route.model());
                route.transitionTo('exams.show.new');
            }, function(error) {
                question.destroyRecord();
                route.notify.warning('Couldn\' create question :/');
            });
        }
    }
});
