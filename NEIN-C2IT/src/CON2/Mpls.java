package CON2;
import java.util.Date;

public class Mpls {
	
	private int mpls_id;
	private int branchId;
	private int branchNo;
	
	private float tds_amt;
	private float tds_per;
	private float amount;
	private float tax_amt;
	private float tax_amt1;
	private float tax_per;
	private float tax_per1;
	private float total_invoice_amt;
	private float total_pay_amt;
	private float inoviceAmt;
	private float chequeAmt;
	
	private String empid;
	private String userName;
	private String month;
	private String circuit_Id;
	private String linktype_id;
	private String isp_name;
	private String lanpool;
	private String wanpool;
	private String acc_relation_no;
	private String bandwidth;
	private String media;
	private String 	arc;
	private String 	otc;
	private String po_number;
	private String bill_refno;
	private String branchName;
	private String branchLocation;
	private String poNumber;
	private String invoiceno;
	private String chequeno;
	private String path;
	private String filename;
	private String invoiceDate;
	private String chequeDate;
	
	private Date po_date;
	private Date bill_date;
	private Date bill_fdate;
	private Date bill_tdate;
	private Date created_date;
	
	/*private String amtJan;
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
	private String amtDec;*/
	
	
	
	public int getMpls_id() {
		return mpls_id;
	}
	public void setMpls_id(int mpls_id) {
		this.mpls_id = mpls_id;
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
	public String getLinktype_id() {
		return linktype_id;
	}
	public void setLinktype_id(String linktype_id) {
		this.linktype_id = linktype_id;
	}
	public String getIsp_name() {
		return isp_name;
	}
	public void setIsp_name(String isp_name) {
		this.isp_name = isp_name;
	}
	public String getEmpid() {
		return empid;
	}
	public void setEmpid(String empid) {
		this.empid = empid;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getCircuit_Id() {
		return circuit_Id;
	}
	public void setCircuit_Id(String circuit_Id) {
		this.circuit_Id = circuit_Id;
	}
	public String getLanpool() {
		return lanpool;
	}
	public void setLanpool(String lanpool) {
		this.lanpool = lanpool;
	}
	public String getWanpool() {
		return 	wanpool;
	}
	public void setWanpool(String 	wanpool) {
		this.wanpool = 	wanpool;
	}
	public String getAcc_relation_no() {
		return 	acc_relation_no;
	}
	public void setAcc_relation_no(String acc_relation_no) {
		this.acc_relation_no = 	acc_relation_no;
	}
	public String getBandwidth() {
		return 	bandwidth;
	}
	public void setBandwidth(String bandwidth) {
		this.bandwidth = bandwidth;
	}
	public String getMedia() {
		return 	media;
	}
	public void setMedia(String media) {
		this.media = media;
	}
	public String getArc() {
		return 	arc;
	}
	public void setArc(String arc) {
		this.arc = arc;
	}
	public String getOtc() {
		return 	otc;
	}
	public void setOtc(String otc) {
		this.otc = 	otc;
	}
	public String getPo_number() {
		return 	po_number;
	}
	public void setPo_number(String po_number) {
		this.po_number = po_number;
	}
	public String getBill_refno() {
		return 	bill_refno;
	}
	public void setBill_refno(String bill_refno) {
		this.bill_refno = bill_refno;
	}
	
	
	/*public String getAmtJan() {
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
	}*/
	
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	  }
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	
	public float getAmount() {
		return amount;
	}
	public void setAmount(float amount) {
		this.amount = amount;
	}
	public float getTax_amt() {
		return tax_amt;
	}
	public void setTax_amt(float tax_amt) {
		this.tax_amt = tax_amt;
	}
	public float getTax_per() {
		return tax_per;
	}
	public void setTax_per(float tax_per) {
		this.tax_per = tax_per;
	}
	public float getTax_amt1() {
		return tax_amt1;
	}
	public void setTax_amt1(float tax_amt1) {
		this.tax_amt1 = tax_amt1;
	}
	public float getTax_per1() {
		return tax_per1;
	}
	public void setTax_per1(float tax_per1) {
		this.tax_per1 = tax_per1;
	}
	public float getTotal_invoice_amt() {
		return total_invoice_amt;
	}
	public void setTotal_invoice_amt(float total_invoice_amt) {
		this.total_invoice_amt = total_invoice_amt;
	}
	public float getTds_amt() {
		return tds_amt;
	}
	public void setTds_amt(float tds_amt) {
		this.tds_amt = tds_amt;
	}
	public float getTds_per() {
		return tds_per;
	}
	public void setTds_per(float tds_per) {
		this.tds_per = tds_per;
	}
	public float getTotal_pay_amt() {
		return total_pay_amt;
	}
	public void setTotal_pay_amt(float total_pay_amt) {
		this.total_pay_amt = total_pay_amt;
	}
	
	
	public String getPoNumber() {
		return poNumber;
	}
	public void setPoNumber(String poNumber) {
		this.poNumber = poNumber;
	}
	public String getInvoiceno() {
		return invoiceno;
	}
	public void setInvoiceno(String invoiceno) {
		this.invoiceno = invoiceno;
	}
	public String getChequeno() {
		return chequeno;
	}
	public void setChequeno(String chequeno) {
		this.chequeno = chequeno;
	}
	
	public Date getPo_date() {
		return po_date;
	}
	public void setPo_date(Date po_date) {
		this.po_date = po_date;
	}
	public Date getBill_date() {
		return bill_date;
	}
	public void setBill_date(Date bill_date) {
		this.bill_date = bill_date;
	}
	public Date getBill_fdate() {
		return bill_fdate;
	}
	public void setBill_fdate(Date bill_fdate) {
		this.bill_fdate = bill_fdate;
	}
	public Date getBill_tdate() {
		return bill_tdate;
	}
	public void setBill_tdate(Date bill_tdate) {
		this.bill_tdate = bill_tdate;
	}
	public float getInoviceAmt() {
		return inoviceAmt;
	}
	public void setInoviceAmt(float inoviceAmt) {
		this.inoviceAmt = inoviceAmt;
	}
	public String getInvoiceDate() {
		return invoiceDate;
	}
	public void setInvoiceDate(String invoiceDate) {
		this.invoiceDate = invoiceDate;
	}
	public Date getCreated_date() {
		return created_date;
	}
	public void setCreated_date(Date created_date) {
		this.created_date = created_date;
	}
	public float getChequeAmt() {
		return chequeAmt;
	}
	public void setChequeAmt(float chequeAmt) {
		this.chequeAmt = chequeAmt;
	}
	public String getChequeDate() {
		return chequeDate;
	}
	public void setChequeDate(String chequeDate) {
		this.chequeDate = chequeDate;
	}

	public String getBranchName() {
		return branchName;
	}
	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}
	
	public String getBranchLocation() {
		return branchLocation;
	}
	public void setBranchLocation(String branchLocation) {
		this.branchLocation = branchLocation;
	}
}
