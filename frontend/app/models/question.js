import DS from 'ember-data';

export default DS.Model.extend({
  number: DS.attr('number'),
  text: DS.attr('string'),
  answer: DS.attr('string'),
  points: DS.attr('number'),

  exam: DS.belongsTo('exam')
});
