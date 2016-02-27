import Ember from 'ember';

export default Ember.Handlebars.makeBoundHelper(function(points) {
    if(points === 1)
        return new Ember.Handlebars.SafeString("point");
    else
        return new Ember.Handlebars.SafeString("points");
});
