package CON2;

public class ConferenceRoomDTO {

	private String Booking_no ;
	 private String user_empid;
	 private String user_email;
     private String user_name;
	 private String user_branch;
	 private String user_dept ;
	 private String booking_for_person;
	 private String booking_for_branch;
	 private String booking_for_dept;
    private String purpose;
    private String booking_room_type;
    private String meeting_type;
    
    private String from_date;
    private String from_time;
    private String to_date ;
    private String to_time;
    private String no_of_attendies ;
    private String remarks;
    private String cc ;
    private String status;
    private String Cancel_remarks ;

    private String item ;
    private String quantity ;
    private String amenity_remarks ;
    
    private String name ;
    private String email ;
    private String type ;
    
    public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
    
    public String getItem() {
		return item;
	}
	public void setItem(String item) {
		this.item = item;
	}
	
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	
	public String getAremarks() {
		return amenity_remarks;
	}
	public void setAremarks(String amenity_remarks) {
		this.amenity_remarks = amenity_remarks;
	}
	 
	public String getBookingNo() {
		return Booking_no;
	}
	public void setBookingNo(String Booking_no) {
		this.Booking_no = Booking_no;
	}

	 public String getUserEmpid() {
			return user_empid;
		}
		public void setUserEmpid(String user_empid) {
			this.user_empid = user_empid;
		}
	    public String getUserEmail() {
			return user_email;
		}
		public void setUserEmail(String user_email) {
			this.user_email = user_email;
		}
		public String getUserName() {
			return user_name;
		}
		public void setUserName(String user_name) {
			this.user_name = user_name;
		}
		public String getUserBranch() {
			return user_branch;
		}
		public void setUserBranch(String user_branch) {
			this.user_branch = user_branch;
		}
		public String getUserDept() {
			return user_dept;
		}
		public void setUserDept(String user_dept) {
			this.user_dept = user_dept;
		}
		public String getBookingForPerson() {
			return booking_for_person;
		}
		public void setBookingForPerson(String booking_for_person) {
			this.booking_for_person = booking_for_person;
		}
		
		public void setBookingForBranch(String booking_for_branch) {
			this.booking_for_branch = booking_for_branch;
		}
		public String getBookingForBranch() {
			return booking_for_branch;
		}
		
		public String getBookingForDept() {
			return booking_for_dept;
		}
		public void setBookingForDept(String booking_for_dept) {
			this.booking_for_dept = booking_for_dept;
		}
		public String getPurpose() {
			return purpose;
		}
		public void setPurpose(String purpose) {
			this.purpose = purpose;
		}
		
		public String getBookingRoomType() {
			return booking_room_type;
		}
		public void setBookingRoomType(String booking_room_type) {
			this.booking_room_type = booking_room_type;
		}
		
		public String getMeetingType() {
			return meeting_type;
		}
		public void setMeetingType(String meeting_type) {
			this.meeting_type = meeting_type;
		}
		public String getFromdate() {
			return from_date;
		}
		public void setFromdate(String from_date) {
			this.from_date = from_date;
		}
		public String getFromtime() {
			return from_time;
		}
		public void setFromtime(String from_time) {
			this.from_time = from_time;
		}
		public String getTodate() {
			return to_date;
		}
		public void setTodate(String to_date) {
			this.to_date = to_date;
		}
		public String getTotime() {
			return to_time;
		}
		public void setTotime(String to_time) {
			this.to_time = to_time;
		}
		public String getNoAttendies() {
			return no_of_attendies;
		}
		public void setNoAttendies(String no_of_attendies) {
			this.no_of_attendies = no_of_attendies;
		}
		public String getRemarks() {
			return remarks;
		}
		public void setRemarks(String remarks) {
			this.remarks = remarks;
		}
		public String getCc() {
			return cc;
		}
		public void setCc(String cc) {
			this.cc = cc;
		}
		public String getStatus() {
			return status;
		}
		public void setStatus(String status) {
			this.status = status;
		}
		public String getCancelRemarks() {
			return Cancel_remarks;
		}
		public void setCancelRemarks(String Cancel_remarks) {
			this.Cancel_remarks = Cancel_remarks;
		}
}
