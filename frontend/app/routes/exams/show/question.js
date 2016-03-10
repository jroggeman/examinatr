import Ember from 'ember';

export default Ember.Route.extend({
    model: function(params) {
        return this.store.findRecord('question', params.question_id);
    },

    actions: {
        updateQuestion: function() {
            this.modelFor('exams.show.question').save();
            /*
            var text = this.modelFor('exams.show.question').text
            var answer = this.modelFor('exams.show.question').answer
            var points = this.modelFor('exams.show.question').points

            var question = this.store.findRecord('question', this.modelFor('exams.show.question').id).then(function(question) {
                question.set('text', text);
                question.set('answer', answer);
                question.set('points', points);

                question.save();
            });
            */
        }
    }
});
