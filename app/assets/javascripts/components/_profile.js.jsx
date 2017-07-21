const Profile = React.createClass({
    render() {
        return ( <div>
            <form>
                <div className="form-group">
                    <input type="text" name="current_password" className="form-control" placeholder="Current Password"/>
                </div>
                <div className="form-group">
                    <input type="text" name="new_password" className="form-control" placeholder="New Password"/>
                </div>
                <div className="form-group">
                    <input type="text" name="confirm_password" className="form-control" placeholder="Confirm Password"/>
                </div>
            </form>
        </div> )
    }
});