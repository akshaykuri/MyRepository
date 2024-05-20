package CON2;

public class IspOutage {

	 private String ispOutageId;
	  private int branchId;
	  private int branchNo; 
	  private String linkType;
	  private String circuitId;
	  private String troubleTicketNo;
	  private String connectionDowndate;
	  private String linkdowntime;	  
	  private String conRestoreddate;
	  private String linkrestoredtime;
	  private String callLoggeddate;
	  private String calllogtime;
	  private String outageReport;
	  private String reason;
	  private String remarks;
	  private String branchName;
	  private String branchLocation;
	  private String isp_name;
	 
	public String getIspOutageId() {
		return ispOutageId;
	}
	public void setIspOutageId(String ispOutageId) {
		this.ispOutageId = ispOutageId;
	}
	public int getBranchId() {
		return branchId;
	}
	public void setBranchId(int branchId) {
		this.branchId = branchId;
	}
	public int getBranchNo() {
		return branchNo;
	}
	public void setBranchNo(int branchNo) {
		this.branchNo = branchNo;
	}

	public String getLinkType() {
		return linkType;
	}
	public void setLinkType(String linkType) {
		this.linkType = linkType;
	}
	public String getCircuitId() {
		return circuitId;
	}
	public void setCircuitId(String circuitId) {
		this.circuitId = circuitId;
	}
	public String getTroubleTicketNo() {
		return troubleTicketNo;
	}
	public void setTroubleTicketNo(String troubleTicketNo) {
		this.troubleTicketNo = troubleTicketNo;
	}
	public String getOutageReport() {
		return outageReport;
	}
	public void setOutageReport(String outageReport) {
		this.outageReport = outageReport;
	}

	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	} 
	
	public String getConnectionDowndate() {
		return connectionDowndate;
	}
	public void setConnectionDowndate(String connectionDowndate) {
		this.connectionDowndate = connectionDowndate;
	}
	public String getLinkdowntime() {
		return linkdowntime;
	}
	public void setLinkdowntime(String linkdowntime) {
		this.linkdowntime = linkdowntime;
	}
	public String getConRestoreddate() {
		return conRestoreddate;
	}
	public void setConRestoreddate(String conRestoreddate) {
		this.conRestoreddate = conRestoreddate;
	}
	public String getLinkrestoredtime() {
		return linkrestoredtime;
	}
	public void setLinkrestoredtime(String linkrestoredtime) {
		this.linkrestoredtime = linkrestoredtime;
	}
	public String getCallLoggeddate() {
		return callLoggeddate;
	}
	public void setCallLoggeddate(String callLoggeddate) {
		this.callLoggeddate = callLoggeddate;
	}
	public String getCalllogtime() {
		return calllogtime;
	}
	public void setCalllogtime(String calllogtime) {
		this.calllogtime = calllogtime;
	}
	
	public String getBranchLocation() {
		return branchLocation;
	}
	
	public void setBranchLocation(String branchLocation) {
		this.branchLocation = branchLocation;
		
	}
	public String getBranchName() {
		return branchName;
	}
	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}
	public String getIsp_name() {
		return isp_name;
	}
	public void setIsp_name(String isp_name) {
		this.isp_name = isp_name;
	}
}
