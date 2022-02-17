package com.nazdaq.ja.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "department")
public class Department {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	private int id;

	@Column(name = "name")
	private String name;
	
	
	
	
	
	@ManyToMany(fetch=FetchType.EAGER,
			cascade= {CascadeType.PERSIST, CascadeType.MERGE,
			 CascadeType.DETACH, CascadeType.REFRESH})
	@JoinTable(
			name="candidate_dept",
			joinColumns=@JoinColumn(name="dept_id"),
			inverseJoinColumns=@JoinColumn(name="candidate_id")
			)	
	private List<CandidateInfo> candidateInfo;
	

	
	
	


	public Department() {
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public List<CandidateInfo> getCandidateInfo() {
		return candidateInfo;
	}


	public void setCandidateInfo(List<CandidateInfo> candidateInfo) {
		this.candidateInfo = candidateInfo;
	}

}
