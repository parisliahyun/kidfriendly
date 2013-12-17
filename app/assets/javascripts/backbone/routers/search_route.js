// var SearchRouter = Backbone.Router.extend({
//   routes: {
//     "results": "addThis"
//   },

//   initialize: function(searchList) {
//     console.log("Initialized SearchRouter...");
//     this.searchList = searchList;
//   },

//   addThis: function() {
//     console.log("---> Navigated to addThis!");

//     this.searchList.reset();

//     // make a copy of the collection to iterate over, so that if we
//     // destroy elements it doesn't screw up our current index
//     _.clone(this.searchList).each( function(nameofmodel) {
//     });
//   },

// });