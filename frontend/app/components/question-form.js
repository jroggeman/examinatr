import Ember from 'ember';

export default Ember.Component.extend({
    actions: {
        createQuestion: function() {
            var points = this.get('points');
            var text = this.get('text');
            var answer = this.get('answer');

            this.sendAction('submitAction', points, text, answer);

            // Clear out model when done
            this.set('points', '');
            this.set('text', '');
            this.set('answer', '');
        }
    }
});
