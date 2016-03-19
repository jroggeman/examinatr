import Ember from 'ember';

export default Ember.Route.extend({
    model: function() {
        //return this.store.createRecord('question');
        // TODO: Why does a new record create [object]s?
        return {};
    },

    actions: {
        createQuestion: function() {
            var text = this.modelFor('exams.show.new').text;
            var answer = this.modelFor('exams.show.new').answer;
            var points = this.modelFor('exams.show.new').points;

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
            });
        }
    }
});
