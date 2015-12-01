(function(){
  var ReactCSSTransitionGroup = React.addons.CSSTransitionGroup;
  var AttendanceRow = React.createClass({
      render: function() {
          return (
              <tr>
                <td>{this.props.attendance.name}</td>
                <td>{this.props.attendance.time}</td>
              </tr>
          );
      }
  });
  window.AttendanceTable = React.createClass({
    name: 'AttendanceTable',
    render: function() {
        var rows = this.props.attendances.map(function(attendance) {
          return (<AttendanceRow attendance={attendance} key={attendance.id} />);
        });
        return (
            <table>
              <thead>
                <tr>
                  <th>Name</th>
                  <th>Time</th>
                </tr>
              </thead>
              <ReactCSSTransitionGroup component="tbody" transitionName="bounce" transitionEnterTimeout={1000} transitionLeaveTimeout={1000}>
                {rows}
              </ReactCSSTransitionGroup>
            </table>
        );
    }
  });
}).call(this);
