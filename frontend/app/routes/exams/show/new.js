import Ember from 'ember';

export default Ember.Route.extend({
    model: function() {
        return {};
    },

    actions: {
        createQuestion: function() {
            //var text = this.get('controller').get('text');
            var text = this.modelFor('exams.show.new').text;
            var answer = this.modelFor('exams.show.new').answer;
            var points = this.modelFor('exams.show.new').points;

            var question = this.store.createRecord('question', {
                text: text,
                answer: answer,
                points: points,
                exam: this.modelFor('exams.show')
            });

            question.save();
            this.transitionTo('exams.show.question', question);
        }
    }
});
