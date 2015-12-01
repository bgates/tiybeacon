 (function() {
   var ShowAttendancesFactory = React.createFactory(AttendanceTable);

   $(function() {
     return $('[data-reactive]').each(function(_, elm) {
       var reactivePath = $(elm).attr('data-reactive');
       var source = new EventSource(reactivePath);
       return source.addEventListener('message', function(e) {
         console.log('data is', e.data);
         return ReactDOM.render(ShowAttendancesFactory(JSON.parse(e.data)), elm);
       });
     });
   });

}).call(this);
