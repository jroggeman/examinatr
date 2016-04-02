import DS from 'ember-data';
import { memberAction } from 'ember-api-actions';

export default DS.Model.extend({
  number: DS.attr('number'),
  text: DS.attr('string'),
  answer: DS.attr('string'),
  points: DS.attr('number'),

  exam: DS.belongsTo('exam'),

  moveUp: memberAction({
      path: 'move_up',
      type: 'post'
  }),
});
