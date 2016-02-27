import Ember from 'ember';

export default Ember.Route.extend({
    actions: {
        createQuestion: function() {
            var number = this.get('controller').get('number');
            var text = this.get('controller').get('text');
            var answer = this.get('controller').get('answer');
            var points = this.get('controller').get('points');

            var question = this.store.createRecord('question', {
                number: number,
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
