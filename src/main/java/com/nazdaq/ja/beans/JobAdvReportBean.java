package com.nazdaq.ja.beans;

public class JobAdvReportBean extends CommanBean implements Comparable<JobAdvReportBean>{

private String approvedDate;
private String jobNumber;
private Integer jobPointId;

public String getApprovedDate() {
	return approvedDate;
}

public void setApprovedDate(String approvedDate) {
	this.approvedDate = approvedDate;
}

public String getJobNumber() {
	return jobNumber;
}

public void setJobNumber(String jobNumber) {
	this.jobNumber = jobNumber;
}

public Integer getJobPointId() {
	return jobPointId;
}

public void setJobPointId(Integer jobPointId) {
	this.jobPointId = jobPointId;
}

@Override
public int compareTo(JobAdvReportBean o) {
	// TODO Auto-generated method stub
	return this.jobPointId -o.getJobPointId();
}



}
