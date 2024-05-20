package CON2;
import java.util.Date;

public class Catridge {
	
	private int catridgeId;
	private int branchId;
	private int branchNo;
	private Date monthOfPayment;
	private String status;
	private String empid;
	private String catridgeModel;
	private String catridgeModelName;
	private float monthlyAmtPaid;
	private String branchName;
	private String printerName;
	private String branchLocation;
	
	private float cost;
	private int quantity;
	private float amount;
	private String vendorName;
	private String poNumber;
	private String invoiceno;
	private String chequeno;
	private Date purchaseDate;
	private float inoviceAmt;
	private Date invoiceDate;
	private float chequeAmt;
	private Date chequeDate;
	
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
	
	private String ModelWiseTotal;
	private String branchWiseTotal;
	private String totalAmt;
	
	public int getCatridgeId() {
		return catridgeId;
	}
	public void setCatridgeId(int catridgeId) {
		this.catridgeId = catridgeId;
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
	public Date getMonthOfPayment() {
		return monthOfPayment;
	}
	public void setMonthOfPayment(Date monthOfPayment) {
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
	
	public String getCatridgeModel() {
		return catridgeModel;
	}
	public void setCatridgeModel(String catridgeModel) {
		this.catridgeModel = catridgeModel;
	}
	public String getCatridgeModelName() {
		return catridgeModelName;
	}
	public void setCatridgeModelName(String catridgeModelName) {
		this.catridgeModelName = catridgeModelName;
	}
	public float getMonthlyAmtPaid() {
		return monthlyAmtPaid;
	}
	public void setMonthlyAmtPaid(float monthlyAmtPaid) {
		this.monthlyAmtPaid = monthlyAmtPaid;
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
	
	
	
	public String getModelWiseTotal() {
		return ModelWiseTotal;
	}
	public void setModelWiseTotal(String total1) {
		ModelWiseTotal = total1;
	}
	public String getTotalAmt() {
		return totalAmt;
	}
	public void setTotalAmt(String totalAmt) {
		this.totalAmt = totalAmt;
	}
	public String getBranchWiseTotal() {
		return branchWiseTotal;
	}
	public void setBranchWiseTotal(String branchWiseTotal) {
		this.branchWiseTotal = branchWiseTotal;
	}
	public float getCost() {
		return cost;
	}
	public void setCost(float cost) {
		this.cost = cost;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public float getAmount() {
		return amount;
	}
	public void setAmount(float amount) {
		this.amount = amount;
	}
	public String getVendorName() {
		return vendorName;
	}
	public void setVendorName(String vendorName) {
		this.vendorName = vendorName;
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
	public Date getPurchaseDate() {
		return purchaseDate;
	}
	public void setPurchaseDate(Date purchaseDate) {
		this.purchaseDate = purchaseDate;
	}
	public float getInoviceAmt() {
		return inoviceAmt;
	}
	public void setInoviceAmt(float inoviceAmt) {
		this.inoviceAmt = inoviceAmt;
	}
	public Date getInvoiceDate() {
		return invoiceDate;
	}
	public void setInvoiceDate(Date invoiceDate) {
		this.invoiceDate = invoiceDate;
	}
	public float getChequeAmt() {
		return chequeAmt;
	}
	public void setChequeAmt(float chequeAmt) {
		this.chequeAmt = chequeAmt;
	}
	public Date getChequeDate() {
		return chequeDate;
	}
	public void setChequeDate(Date chequeDate) {
		this.chequeDate = chequeDate;
	}

	public String getBranchName() {
		return branchName;
	}
	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}
	public String getPrinterName() {
		return printerName;
	}
	public void setPrinterName(String printerName) {
		this.printerName = printerName;
	}
	public String getBranchLocation() {
		return branchLocation;
	}
	public void setBranchLocation(String branchLocation) {
		this.branchLocation = branchLocation;
	}
}
