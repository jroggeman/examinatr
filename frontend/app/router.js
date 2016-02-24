import Ember from 'ember';
import config from './config/environment';

const Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.route('exams', { path: '/exams' });
  this.route('exams.show', { path: '/exams/:exam_id' });

  this.route('users');
  this.route('question');
});

export default Router;
