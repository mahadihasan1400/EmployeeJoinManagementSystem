package com.nazdaq.ja.model;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "employement_history")
public class EmployementHistory {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	private int id;
	
	@Column(name = "designation")
	private String designation;
	
	@Column(name = "year_of_exp")
	private int yearOfExp;
	
	@Column(name = "company_name")
	private String companyName;
	
	@Column(name = "department")
	private String department;
	
	@Column(name = "address")
	private String address;
	
	@ManyToOne
	@JoinColumn(name = "candidate_id")
	private CandidateInfo candidateInfo;
	
	@ManyToOne
    @JoinColumn(name = "district_id", nullable = true)
	private District district;
	
	@ManyToOne
    @JoinColumn(name = "thana_id", nullable = true)
	private Thana thana;
	
	
	@OneToMany(mappedBy = "employementHistory", cascade = CascadeType.ALL)
	private Set<EmploymentDoc> employmentDoc;
	
	
	public EmployementHistory() {
		// TODO Auto-generated constructor stub
	}
	
	
	public Set<EmploymentDoc> getEmploymentDoc() {
		return employmentDoc;
	}

	public void setEmploymentDoc(Set<EmploymentDoc> employmentDoc) {
		this.employmentDoc = employmentDoc;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDesignation() {
		return designation;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
	}

	public int getYearOfExp() {
		return yearOfExp;
	}

	public void setYearOfExp(int yearOfExp) {
		this.yearOfExp = yearOfExp;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public CandidateInfo getCandidateInfo() {
		return candidateInfo;
	}

	public void setCandidateInfo(CandidateInfo candidateInfo) {
		this.candidateInfo = candidateInfo;
	}

	public District getDistrict() {
		return district;
	}

	public void setDistrict(District district) {
		this.district = district;
	}

	public Thana getThana() {
		return thana;
	}

	public void setThana(Thana thana) {
		this.thana = thana;
	}
	
	

}
