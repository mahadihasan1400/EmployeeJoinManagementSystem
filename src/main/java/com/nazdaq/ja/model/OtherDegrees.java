package com.nazdaq.ja.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "other_degress")
public class OtherDegrees {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	private int id;
	
	@Column(name = "degree_infos")
	private String degreeInfos;
	
	
	
    @OneToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "candidate_id", nullable = false)
    private CandidateInfo candidateInfo;



	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public String getDegreeInfos() {
		return degreeInfos;
	}



	public void setDegreeInfos(String degreeInfos) {
		this.degreeInfos = degreeInfos;
	}



	public CandidateInfo getCandidateInfo() {
		return candidateInfo;
	}



	public void setCandidateInfo(CandidateInfo candidateInfo) {
		this.candidateInfo = candidateInfo;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
