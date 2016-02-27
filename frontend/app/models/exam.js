import DS from 'ember-data';

export default DS.Model.extend({
  name: DS.attr('string'),
  totalPoints: DS.attr('number'),
  user: DS.belongsTo('user'),

  questions: DS.hasMany('question', { async: true })
});
