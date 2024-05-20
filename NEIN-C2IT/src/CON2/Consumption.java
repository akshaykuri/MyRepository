package CON2;
import java.util.Date;

public class Consumption {
	
	private int id;
	private int branchId;
	private int branchNo;
	private String monthOfPayment;
	private String status;
	private String empid;
	private String monthlyAmtPaid;
	private String branchName;
	private String branchLocation;
	
	private float current_month_amount;
	private String totalAmt;
	private String userName;
	private String number;
	private String relationship_no;
	private String isptype;
	private String contype;
	private String type;
	
	private String billfromdate;
	private String billtodate;
	private String invoiceno;
	private String invoiceamt;
	private String invoicedate;
	private String chequenumber;
	private String chequeamt;
	private String chequedate;
	private String current_month_amt;
	private String filepath;
	
	private String amtJan;
	private String amtFeb;
	private String amtMar;
	private String amtApr;
	private String amtMay;
	private String amtJune;
	private String amtJuly;
	private String amtAug;
	private String amtSep;
	private String amtOct;
	private String amtNov;
	private String amtDec;
	
	
	
	public String getBillfromdate() {
		return billfromdate;
	}
	public void setBillfromdate(String billfromdate) {
		this.billfromdate = billfromdate;
	}
	public String getBilltodate() {
		return billtodate;
	}
	public void setBilltodate(String billtodate) {
		this.billtodate = billtodate;
	}
	public String getInvoiceno() {
		return invoiceno;
	}
	public void setInvoiceno(String invoiceno) {
		this.invoiceno = invoiceno;
	}
	public String getInvoiceamt() {
		return invoiceamt;
	}
	public void setInvoiceamt(String invoiceamt) {
		this.invoiceamt = invoiceamt;
	}
	public String getInvoicedate() {
		return invoicedate;
	}
	public void setInvoicedate(String invoicedate) {
		this.invoicedate = invoicedate;
	}
	
	public String getChequenumber() {
		return chequenumber;
	}
	public void setChequenumber(String chequenumber) {
		this.chequenumber = chequenumber;
	}
	public String getChequeamt() {
		return chequeamt;
	}
	public void setChequeamt(String chequeamt) {
		this.chequeamt = chequeamt;
	}
	public String getChequedate() {
		return chequedate;
	}
	public void setChequedate(String chequedate) {
		this.chequedate = chequedate;
	}
	public String getCurrent_month_amt() {
		return current_month_amt;
	}
	public void setCurrent_month_amt(String current_month_amt) {
		this.current_month_amt = current_month_amt;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	public String getTotalAmt() {
		return totalAmt;
	}
	public void setTotalAmt(String totalAmt) {
		this.totalAmt = totalAmt;
	}
	
	public float getCurrent_month_amount() {
		return current_month_amount;
	}
	public void setCurrent_month_amount(float current_month_amount) {
		this.current_month_amount = current_month_amount;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getRelationship_no() {
		return relationship_no;
	}
	public void setRelationship_no(String relationship_no) {
		this.relationship_no = relationship_no;
	}
	public String getIsptype() {
		return isptype;
	}
	public void setIsptype(String isptype) {
		this.isptype = isptype;
	}
	public String getContype() {
		return contype;
	}
	public void setContype(String contype) {
		this.contype = contype;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public String getMonthOfPayment() {
		return monthOfPayment;
	}
	public void setMonthOfPayment(String monthOfPayment) {
		this.monthOfPayment = monthOfPayment;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getEmpid() {
		return empid;
	}
	public void setEmpid(String empid) {
		this.empid = empid;
	}
	public String getMonthlyAmtPaid() {
		return monthlyAmtPaid;
	}
	public void setMonthlyAmtPaid(String string) {
		this.monthlyAmtPaid = string;
	}
	
	public String getAmtJan() {
		return amtJan;
	}
	public void setAmtJan(String amtJan) {
		this.amtJan = amtJan;
	}
	public String getAmtFeb() {
		return amtFeb;
	}
	public void setAmtFeb(String amtFeb) {
		this.amtFeb = amtFeb;
	}
	public String getAmtMar() {
		return amtMar;
	}
	public void setAmtMar(String amtMar) {
		this.amtMar = amtMar;
	}
	public String getAmtApr() {
		return amtApr;
	}
	public void setAmtApr(String amtApr) {
		this.amtApr = amtApr;
	}
	public String getAmtMay() {
		return amtMay;
	}
	public void setAmtMay(String amtMay) {
		this.amtMay = amtMay;
	}
	public String getAmtJune() {
		return amtJune;
	}
	public void setAmtJune(String amtJune) {
		this.amtJune = amtJune;
	}
	public String getAmtJuly() {
		return amtJuly;
	}
	public void setAmtJuly(String amtJuly) {
		this.amtJuly = amtJuly;
	}
	public String getAmtAug() {
		return amtAug;
	}
	public void setAmtAug(String amtAug) {
		this.amtAug = amtAug;
	}
	public String getAmtSep() {
		return amtSep;
	}
	public void setAmtSep(String amtSep) {
		this.amtSep = amtSep;
	}
	public String getAmtOct() {
		return amtOct;
	}
	public void setAmtOct(String amtOct) {
		this.amtOct = amtOct;
	}
	public String getAmtNov() {
		return amtNov;
	}
	public void setAmtNov(String amtNov) {
		this.amtNov = amtNov;
	}
	public String getAmtDec() {
		return amtDec;
	}
	public void setAmtDec(String amtDec) {
		this.amtDec = amtDec;
	}
	
	public String getBranchName() {
		return branchName;
	}
	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getBranchLocation() {
		return branchLocation;
	}
	public void setBranchLocation(String branchLocation) {
		this.branchLocation = branchLocation;
	}
}
