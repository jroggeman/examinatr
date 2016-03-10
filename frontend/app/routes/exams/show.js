import Ember from 'ember';

export default Ember.Route.extend({
    model: function(params) {
        var exams = this.modelFor('exams');
        return exams.findBy('id', params.exam_id);
    }
});
