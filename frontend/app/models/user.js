import DS from 'ember-data';

export default DS.Model.extend({
  username: DS.attr('string'),
  password: DS.attr('string'),
  passwordConfirmation: DS.attr('string'),
  name: DS.attr('string'),
  exams: DS.hasMany('exams', { async: true })
});
