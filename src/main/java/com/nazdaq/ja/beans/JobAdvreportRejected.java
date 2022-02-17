package com.nazdaq.ja.beans;

public class JobAdvreportRejected extends CommanBean implements Comparable<JobAdvreportRejected>{
	private String rejectedBy;
	private String rejectedReasin;
	private String rejecteddate;
	private Integer jobPointId;
	
	public String getRejectedBy() {
		return rejectedBy;
	}

	public void setRejectedBy(String rejectedBy) {
		this.rejectedBy = rejectedBy;
	}

	public String getRejectedReasin() {
		return rejectedReasin;
	}

	public void setRejectedReasin(String rejectedReasin) {
		this.rejectedReasin = rejectedReasin;
	}

	public String getRejecteddate() {
		return rejecteddate;
	}

	public void setRejecteddate(String rejecteddate) {
		this.rejecteddate = rejecteddate;
	}

	public Integer getJobPointId() {
		return jobPointId;
	}

	public void setJobPointId(Integer jobPointId) {
		this.jobPointId = jobPointId;
	}

	@Override
	public int compareTo(JobAdvreportRejected o) {
		// TODO Auto-generated method stub
		return this.jobPointId-o.jobPointId;
	}
	
}
