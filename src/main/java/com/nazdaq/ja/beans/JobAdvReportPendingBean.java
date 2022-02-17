package com.nazdaq.ja.beans;

public class JobAdvReportPendingBean extends CommanBean implements Comparable<JobAdvReportPendingBean>{
private String appliedDate;
private String modifiedBy;
private Integer jobPointId;
private String workFollow;

public String getAppliedDate() {
	return appliedDate;
}


public void setAppliedDate(String appliedDate) {
	this.appliedDate = appliedDate;
}


public Integer getJobPointId() {
	return jobPointId;
}


public void setJobPointId(Integer jobPointId) {
	this.jobPointId = jobPointId;
}


public String getModifiedBy() {
	return modifiedBy;
}


public void setModifiedBy(String modifiedBy) {
	this.modifiedBy = modifiedBy;
}


public String getWorkFollow() {
	return workFollow;
}


public void setWorkFollow(String workFollow) {
	this.workFollow = workFollow;
}


@Override
public int compareTo(JobAdvReportPendingBean o) {
	// TODO Auto-generated method stub
	return this.jobPointId-o.jobPointId;
}
}
