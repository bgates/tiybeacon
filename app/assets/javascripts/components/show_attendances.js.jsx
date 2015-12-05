(function(){
  var ReactCSSTransitionGroup = React.addons.CSSTransitionGroup;
  var AttendanceRow = React.createClass({
      render: function() {
          return (
              <tr>
                <td>{this.props.attendance.name}</td>
                <td>{this.props.attendance.time}</td>
                <td><img src={this.props.attendance.avatar_url}/></td>
              </tr>
          );
      }
  });
  window.AttendanceTable = React.createClass({
    name: 'AttendanceTable',
    loadAttendanceFromServer: function(){
      $.ajax({
        url: '/',
        dataType: 'json',
        cache: false,
        success: function(data){
          console.log(data);
          this.setState({data: data["attendances"]});
        }.bind(this),
        error: function(xhr, status, err){
          console.error('shit', status, err.toString());
        }.bind(this)
      });
    },
    getInitialState: function(){
      return { data: [] };
    },
    componentDidMount: function(){
      this.loadAttendanceFromServer();
      setInterval(this.loadAttendanceFromServer, 1000);
    },
    render: function() {
        var rows = this.state.data.map(function(attendance) {
          return (<AttendanceRow attendance={attendance} key={attendance.id} />);
        });
        return (
            <table>
              <thead>
                <tr>
                  <th>Name</th>
                  <th>Time</th>
                  <th>Pic</th>
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
