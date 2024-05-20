package CON2;

import java.sql.Date;

public class PhotoCopier {

	  private int ph_id;
	  private int branchId;
	  private int branchNo; 
	  private String brand;
	  private String modelno;
	  private String serialno;
	  private String vendorname;
	  private String vendortype;	  
	  private String machinetype;
	  private float rentamt;
	  private float taxamt;
	  private float total_amt;
	  private String photo_type;
	  private int closing_balance;
	  private int opening_balance;
	  private int total_copies;
	  private int free_copies;
	  private int extra_copies;
	  private float per_copy_cost;
	  private float charged_amt;
	  private Date month_of_payment;
	  private Date closingdate;
	  private Date openingdate;
	  private String chequeNo;
	  private String chequeDate;
	  private String agreementedate;
	  private String agreementsdate;
	  private String agreementdate;
	  private String installeddate;
	  private String createddate;
	  private float invoice_amt;
	  private float chequeAmt;
	  private String invoice_no;
	  private String invoice_date;
	  private String filepath;
	  private String filename;
	  
	  private float rcgst_per;
	  private float rcgst_amt;
	  private float rsgst_per;
	  private float rsgst_amt;
	  
	  private float cgst_per;
	  private float cgst_amt;
	  private float sgst_per;
	  private float sgst_amt;
	  
	  private String rinvoice_no;
	  private String rinvoice_date;
	  private float rinvoice_Amt;
	  private String rfilepath;
	  private String rfilename;
	  
	  private int month;
	  
	  private String branchName;
	  private String branchLocation;
	  
	public int getPh_id() {
		return ph_id;
	}
	public void setPh_id(int ph_id) {
		this.ph_id = ph_id;
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

	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getModelno() {
		return modelno;
	}
	public void setModelno(String modelno) {
		this.modelno = modelno;
	}
	public String getSerialno() {
		return serialno;
	}
	public void setSerialno(String serialno) {
		this.serialno = serialno;
	}
	public String getPhoto_type() {
		return photo_type;
	}
	public void setPhoto_type(String photo_type) {
		this.photo_type = photo_type;
	}

	public String getVendorname() {
		return vendorname;
	}
	public void setVendorname(String vendorname) {
		this.vendorname = vendorname;
	}
	public String getVendortype() {
		return vendortype;
	}
	public void setVendortype(String vendortype) {
		this.vendortype = vendortype;
	}
	public String getMachinetype() {
		return machinetype;
	}
	public void setMachinetype(String machinetype) {
		this.machinetype = machinetype;
	}
	public float getRentamt() {
		return rentamt;
	}
	public void setRentamt(float rentamt) {
		this.rentamt = rentamt;
	}
	public float getChequeAmt() {
		return chequeAmt;
	}
	public void setChequeAmt(float chequeAmt) {
		this.chequeAmt = chequeAmt;
	}
	public float getTaxamt() {
		return taxamt;
	}
	public void setTaxamt(float taxamt) {
		this.taxamt = taxamt;
	}
	public float getTotal_amt() {
		return total_amt;
	}
	public void setTotal_amt(float total_amt) {
		this.total_amt = total_amt;
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
	
	public int getExtra_copies() {
		return extra_copies;
	}
	public void setExtra_copies(int extra_copies) {
		this.extra_copies = extra_copies;
	}
	
    public int getTotal_copies() {
		return total_copies;
	}
	public void setTotal_copies(int total_copies) {
		this.total_copies = total_copies;
	}
	public int getFree_copies() {
		return free_copies;
	}
	public void setFree_copies(int free_copies) {
		this.free_copies = free_copies;
	} 
	public int getClosing_balance() {
		return closing_balance;
	}
	public void setClosing_balance(int closing_balance) {
		this.closing_balance = closing_balance;
	}
	public int getOpening_balance() {
		return opening_balance;
	}
	public void setOpening_balance(int opening_balance) {
		this.opening_balance = opening_balance;
	}
	
	public float getPer_copy_cost() {
		return per_copy_cost;
	}
	public void setPer_copy_cost(float per_copy_cost) {
		this.per_copy_cost = per_copy_cost;
	}
	public float getCharged_amt() {
		return charged_amt;
	}
	public void setCharged_amt(float charged_amt) {
		this.charged_amt = charged_amt;
	}
	
	public Date getClosingdate() {
		return closingdate;
	}
	public void setClosingdate(Date closingdate) {
		this.closingdate = closingdate;
	}
	public Date getOpeningdate() {
		return openingdate;
	}
	public void setOpeningdate(Date openingdate) {
		this.openingdate = openingdate;
	}
	public Date getMonth_of_payment() {
		return month_of_payment;
	}
	public void setMonth_of_payment(Date month_of_payment) {
		this.month_of_payment = month_of_payment;
	}
	
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public String getChequeDate() {
		return chequeDate;
	}
	public void setChequeDate(String chequeDate) {
		this.chequeDate = chequeDate;
	}
    public String getChequeNo() {
		return chequeNo;
	}
	public void setChequeNo(String chequeNo) {
		this.chequeNo = chequeNo;
	}
	public String getAgreementsdate() {
		return agreementsdate;
	}
	public void setAgreementsdate(String agreementsdate) {
		this.agreementsdate = agreementsdate;
	}
	public String getAgreementdate() {
		return agreementdate;
	}
	public void setAgreementdate(String agreementdate) {
		this.agreementdate = agreementdate;
	}
	public String getInstalleddate() {
		return installeddate;
	}
	public void setInstalleddate(String installeddate) {
		this.installeddate = installeddate;
	}
	public String getAgreementedate() {
		return agreementedate;
	}
	public void setAgreementedate(String agreementedate) {
		this.agreementedate = agreementedate;
	}
	public String getCreateddate() {
		return createddate;
	}
	public void setCreateddate(String createddate) {
		this.createddate = createddate;
	}
	
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getInvoice_date() {
		return invoice_date;
	}
	public void setInvoice_date(String invoice_date) {
		this.invoice_date = invoice_date;
	}
	public float getInvoice_amt() {
		return invoice_amt;
	}
	public void setInvoice_amt(float invoice_amt) {
		this.invoice_amt = invoice_amt;
	}
	public String getInvoice_no() {
		return invoice_no;
	}
	public void setInvoice_no(String invoice_no) {
		this.invoice_no = invoice_no;
	}
   
	public float getRcgst_per() {
		return rcgst_per;
	}
	public void setRcgst_per(float rcgst_per) {
		this.rcgst_per = rcgst_per;
	}
	public float getRcgst_amt() {
		return rcgst_amt;
	}
	public void setRcgst_amt(float rcgst_amt) {
		this.rcgst_amt = rcgst_amt;
	}
	public float getRsgst_per() {
		return rsgst_per;
	}
	public void setRsgst_per(float rsgst_per) {
		this.rsgst_per = rsgst_per;
	}
	public float getRsgst_amt() {
		return rsgst_amt;
	}
	public void setRsgst_amt(float rsgst_amt) {
		this.rsgst_amt = rsgst_amt;
	}
	public float getCgst_per() {
		return cgst_per;
	}
	public void setCgst_per(float cgst_per) {
		this.cgst_per = cgst_per;
	}
	public float getCgst_amt() {
		return cgst_amt;
	}
	public void setCgst_amt(float gst_amt) {
		this.cgst_amt = gst_amt;
	}
	public float getSgst_per() {
		return sgst_per;
	}
	public void setSgst_per(float sgst_per) {
		this.sgst_per = sgst_per;
	}
	public float getSgst_amt() {
		return sgst_amt;
	}
	public void setSgst_amt(float sgst_amt) {
		this.sgst_amt = sgst_amt;
	}
	public String getRfilepath() {
		return rfilepath;
	}
	public void setRfilepath(String rfilepath) {
		this.rfilepath = rfilepath;
	}
	public String getRfilename() {
		return rfilename;
	}
	public void setRfilename(String rfilename) {
		this.rfilename = rfilename;
	}
	
	public String getRinvoice_date() {
		return rinvoice_date;
	}
	public void setRinvoice_date(String rinvoice_date) {
		this.rinvoice_date = rinvoice_date;
	}
	public String getRinvoice_no() {
		return rinvoice_no;
	}
	public void setRinvoice_no(String rinvoice_no) {
		this.rinvoice_no = rinvoice_no;
	}
	public float getRinvoice_Amt() {
		return rinvoice_Amt;
	}
	public void setRinvoice_Amt(float rinvoice_Amt) {
		this.rinvoice_Amt = rinvoice_Amt;
	}
}
