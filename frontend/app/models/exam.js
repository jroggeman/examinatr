import DS from 'ember-data';

export default DS.Model.extend({
  name: DS.attr('string'),
  user: DS.belongsTo('user'),

  questions: DS.hasMany('question', { async: true })
});
