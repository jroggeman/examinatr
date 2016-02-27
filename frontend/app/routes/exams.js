import Ember from 'ember';

export default Ember.Route.extend({
    model: function() {
        return this.store.findAll('exam');
    },

    actions: {
        createExam: function() {
            var name = this.get('controller').get('name');
            var exam = this.store.createRecord('exam', {
                name: name
            });

            exam.save();

            this.get('controller').set('name', '');
            this.transitionTo('exams.show', exam);
        }
    }
});
