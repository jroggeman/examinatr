import Ember from 'ember';
import DS from 'ember-data';

export default DS.Model.extend({
  name: DS.attr('string'),
  user: DS.belongsTo('user'),

  questions: DS.hasMany('question', { async: true }),

  totalPoints: Ember.computed('questions.@each.points', function() {
      var questions = this.get('questions');
      return questions.reduce(function(prevValue, question) {
          return prevValue + parseInt(question.get('points'));
      }, 0);
  }),
});
