import Ember from 'ember';

export default Ember.Route.extend({
    model: function() {
        return {};
    },

    actions: {
        createQuestion: function() {
            var text = this.model.get('text');//get('controller').get('text');
            var answer = this.get('controller').get('answer');
            var points = this.get('controller').get('points');

            var question = this.store.createRecord('question', {
                text: text,
                answer: answer,
                points: points,
                exam_id: this.modelFor('exams.show').id
            });

            question.save();
            this.transitionTo('exams.show.question', question);
        }
    }
});
