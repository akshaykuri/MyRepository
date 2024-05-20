package CON2;
import java.util.Date;

public class Payment {
	
	private int branchId;
	private int branchNo;
	private int quantity;
	
	private String empid;
	private String po_number;
	private String vendorName;
	private String item_name;	
	private String branchName;
	private String file_path;
	private String file_name;
	private String branchLocation;
	private String remarks;
	private String bill_no;
	private String cheque_no;
	private String full_name;
	
	private float per_item_amt;
	private float cgst_per;
	private float cgst_amt;
	private float sgst_per;
	private float sgst_amt;
	private float amount;
	private float total_amt;
	private float total;
	private float igst_per;
	private float igst_amt;
	private float tds_per;
	private float tds_amt;
	
	private Date po_date;
	private String payment_date;	
	private String delivery_date;	
	private String bill_date;
	
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
	public String getPayment_date() {
		return payment_date;
	}
	public void setPayment_date(String payment_date) {
		this.payment_date = payment_date;
	}
	
	public String getEmpid() {
		return empid;
	}
	public void setEmpid(String empid) {
		this.empid = empid;
	}
	
	public String getPo_number() {
		return po_number;
	}
	public void setPo_number(String po_number) {
		this.po_number = po_number;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public float getTotal_amt() {
		return total_amt;
	}
	public void setTotal_amt(float total_amt) {
		this.total_amt = total_amt;
	}
	public float getTotal() {
		return total;
	}
	public void setTotal(float total) {
		this.total = total;
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
	
	public float getPer_item_amt() {
		return per_item_amt;
	}
	public void setPer_item_amt(float per_item_amt) {
		this.per_item_amt = per_item_amt;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public float getSgst_per() {
		return sgst_per;
	}
	public void setSgst_per(float sgst_per) {
		this.sgst_per = sgst_per;
	}
	public float getCgst_per() {
		return cgst_per;
	}
	public void setCgst_per(float cgst_per) {
		this.cgst_per = cgst_per;
	}
	public String getVendorName() {
		return vendorName;
	}
	public void setVendorName(String vendorName) {
		this.vendorName = vendorName;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getBill_no() {
		return bill_no;
	}
	public void setBill_no(String bill_no) {
		this.bill_no = bill_no;
	}
	public String getCheque_no() {
		return cheque_no;
	}
	public void setCheque_no(String cheque_no) {
		this.cheque_no = cheque_no;
	}
	public Date getPo_date() {
		return po_date;
	}
	public void setPo_date(Date po_date) {
		this.po_date = po_date;
	}
	public float getCgst_amt() {
		return cgst_amt;
	}
	public void setCgst_amt(float cgst_amt) {
		this.cgst_amt = cgst_amt;
	}
	public float getSgst_amt() {
		return sgst_amt;
	}
	public void setSgst_amt(float sgst_amt) {
		this.sgst_amt = sgst_amt;
	}
	public String getDelivery_date() {
		return delivery_date;
	}
	public void setDelivery_date(String delivery_date) {
		this.delivery_date = delivery_date;
	}
	public float getAmount() {
		return amount;
	}
	public void setAmount(float amount) {
		this.amount = amount;
	}
	public String getBill_date() {
		return bill_date;
	}
	public void setBill_date(String bill_date) {
		this.bill_date = bill_date;
	}

	public String getBranchName() {
		return branchName;
	}
	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}
	public String getFull_name() {
		return full_name;
	}
	public void setFull_name(String full_name) {
		this.full_name = full_name;
	}
	public String getFile_path() {
		return file_path;
	}
	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public String getBranchLocation() {
		return branchLocation;
	}
	public void setBranchLocation(String branchLocation) {
		this.branchLocation = branchLocation;
	}
	public float getIgst_amt() {
		return igst_amt;
	}
	public void setIgst_amt(float igst_amt) {
		this.igst_amt = igst_amt;
	}
	public float getIgst_per() {
		return igst_per;
	}
	public void setIgst_per(float igst_per) {
		this.igst_per = igst_per;
	}
	public float getTds_per() {
		return tds_per;
	}
	public void setTds_per(float tds_per) {
		this.tds_per = tds_per;
	}
	public float getTds_amt() {
		return tds_amt;
	}
	public void setTds_amt(float tds_amt) {
		this.tds_amt = tds_amt;
	}
}
