/**
 * Google App Script to update the location of events with some name on some calendar
 * 
 * Rationale: 
 * All class events are kept in their own calendar, and named appropriately. 
 * Each individual class event was updated to include the lecture title.
 * Doing so split the recurring event into a bunch of individual events, so updating the location of one didn't update all of them.
 */

function myFunction() {
  var calendarId = 'blablah@group.calendar.google.com';
  var startDate = new Date(); // assuming you want to update events from now
  var endDate = new Date(2014, 12, 6); // until the end of Fall 2014 semester
  var className = 'CS4420';
  var newLocation = 'CULC 152';
  
  var events = CalendarApp.getCalendarById(calendarId).getEvents(startDate, endDate, {search: className});
  for (var i = 0 ; i < events.length ; i++) {
    var event = events[i];
    event.setLocation(newLocation);
  }
}
