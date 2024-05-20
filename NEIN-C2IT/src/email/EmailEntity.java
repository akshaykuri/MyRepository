package email;

import java.io.File;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.nippon.utility.StringUtil;

public class EmailEntity {
	
	private String port;
	private String host;
	private String userName;
	private String password;
	private String toAddress;
	private String subject;
	private String message;
	private String email;
	private String content;
	private Date startDate;
	private Date endDate;
	private int leaveTypeId;
	private String toAddress1;
	
	private String ccAddress;
	
	private String ltaTableMsg;
	private String fromAddress;
	
	
	
	private List<File> attachedFiles = new ArrayList<File>();
	
	private List<String> attachedFilesUpload = new ArrayList<String>();
	
	public List<File> getAttachedFiles() {
		return attachedFiles;
	}
	
	public void setAttachedFiles(List<File> files) {
		this.attachedFiles = files;
		
	}
	
	
	
	public String getPort() {
		return port;
	}
	public void setPort(String port) {
		this.port = port;
	}
	public String getHost() {
		return host;
	}
	public void setHost(String host) {
		this.host = host;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getToAddress() {
		return toAddress;
	}
	public void setToAddress(String toAddress) {
		this.toAddress = toAddress;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}

	
	public boolean validate(){
		if(!StringUtil.isNotEmpty(host)) return true;
		
	    
		else if(!StringUtil.isNotEmpty(port)) return true;
		
		else if(!StringUtil.isNotEmpty(toAddress)) return true;
		
		
		return false;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public int getLeaveTypeId() {
		return leaveTypeId;
	}
	public void setLeaveTypeId(int leaveTypeId) {
		this.leaveTypeId = leaveTypeId;
	}

	public String getToAddress1() {
		return toAddress1;
	}

	public void setToAddress1(String toAddress1) {
		this.toAddress1 = toAddress1;
	}

	public String getCcAddress() {
		return ccAddress;
	}

	public void setCcAddress(String ccAddress) {
		this.ccAddress = ccAddress;
	}

	public List<String> getAttachedFilesUpload() {
		return attachedFilesUpload;
	}

	public void setAttachedFilesUpload(List<String> attachedFilesUpload) {
		this.attachedFilesUpload = attachedFilesUpload;
	}

	public String getLtaTableMsg() {
		return ltaTableMsg;
	}

	public void setLtaTableMsg(String ltaTableMsg) {
		this.ltaTableMsg = ltaTableMsg;
	}

	public String getFromAddress() {
		return fromAddress;
	}

	public void setFromAddress(String fromAddress) {
		this.fromAddress = fromAddress;
	}
	
	
	
	

}
