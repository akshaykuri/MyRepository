package com.nippon.utility;


public enum ResponseStatus {
	
	SUCESS(),
	FAILURE(),
	EXISTS(),
    CLLeaveAlert(),//using for not>2 leaves
	PLAlert(),//using for not >10 leaves
	LeavesAlert(),//using for where not eligible for leaves
	LeaveCancel(),
	PLMsg(),//uisng for min 2 days
	ProhibithionAlert(),
	LeaveRecordsYear(),
	MLAlert(),
	MLAlertGreater(),
	PALGreaterMsg(),
	greaterThanLeaves(),
	CoffLeaves(),
	SLAlert(),
	FlexiSaturdayError(),
	FlexiSaturdayExsist(),
	FlexiSaturdayEligiblity(),
	CombinedLeavesAlert(),
	HolidayDayLeave(),
	CLMoreThanOneForProbation(),
	MasterUpdate();


	private ResponseStatus(){
		//this.status= messgae;
	}

	
	

}
