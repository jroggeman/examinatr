import Ember from 'ember';
import config from './config/environment';

const Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.route('exams', function() {
    this.route('show', { path: ':exam_id' }, function() {
      this.route('question', { path: 'questions/:question_id' });
      this.route('new', { path: 'questions/new' });
    });

    this.route('users');
    this.route('question');
  });
});

export default Router;
