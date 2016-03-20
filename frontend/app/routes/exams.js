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

            var route = this;

            exam.save().then(function() {
                route.get('controller').set('name', '');
                route.transitionTo('exams.show', exam);
            });
        }
    }
});
