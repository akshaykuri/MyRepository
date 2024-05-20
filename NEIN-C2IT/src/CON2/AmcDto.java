package CON2;

public class AmcDto {

	 private String assetNo;
	 private String ponum;
	 private String amcponum;
    /* private String podate;*/
	 private String vender;
	 private String amcvender;
	 private String branch;
	 private String sbranch;
	 private String amcfrom;
     private String amcto;
     private String amcexpiry;
     private String amcamt;

	 
	 
	public String getAssetNo() {
		return assetNo;
	}
	public void setAssetNo(String assetNo) {
		this.assetNo = assetNo;
	}

	 public String getAmcamt() {
			return amcamt;
		}
		public void setAmcamt(String amcamt) {
			this.amcamt = amcamt;
		}
	    public String getAmcexpiry() {
			return amcexpiry;
		}
		public void setAmcexpiry(String amcexpiry) {
			this.amcexpiry = amcexpiry;
		}
		public String getAmcto() {
			return amcto;
		}
		public void setAmcto(String amcto) {
			this.amcto = amcto;
		}
		public String getAmcfrom() {
			return amcfrom;
		}
		public void setAmcfrom(String amcfrom) {
			this.amcfrom = amcfrom;
		}
		public String getSbranch() {
			return sbranch;
		}
		public void setSbranch(String sbranch) {
			this.sbranch = sbranch;
		}
		public String getBranch() {
			return branch;
		}
		public void setBranch(String branch) {
			this.branch = branch;
		}
		
		public void setAmcVender(String amcvender) {
			this.amcvender = amcvender;
		}
		public String getAmcVender() {
			return amcvender;
		}
		
		public String getVender() {
			return vender;
		}
		public void setVender(String vender) {
			this.vender = vender;
		}
		public String getPoNum() {
			return ponum;
		}
		public void setPoNum(String ponum) {
			this.ponum = ponum;
		}
		
		public String getAmcPoNum() {
			return amcponum;
		}
		public void setAmcPoNum(String amcponum) {
			this.amcponum = amcponum;
		}
}
