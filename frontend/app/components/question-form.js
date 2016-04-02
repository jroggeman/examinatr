import Ember from 'ember';

export default Ember.Component.extend({
    actions: {
        createQuestion: function() {
            var points = this.get('question.points');
            var text = this.get('question.text');
            var answer = this.get('question.answer');

            this.sendAction('submitAction', points, text, answer);

            // Clear out model when done
            this.set('points', '');
            this.set('text', '');
            this.set('answer', '');
        },
        deleteQuestion: function() {
            this.sendAction('deleteAction');
        },
        moveUp: function() {
            this.sendAction('moveUpAction');
        },
        moveDown: function() {
            this.sendAction('moveDownAction');
        }
    }
});
