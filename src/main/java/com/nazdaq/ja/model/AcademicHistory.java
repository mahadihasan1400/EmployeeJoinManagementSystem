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
@Table(name = "academic_history")
public class AcademicHistory {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	private int id;

	@Column(name = "degree_name")
	private String degreeName;

	@Column(name = "institute_name")
	private String instituteName;

	@Column(name = "grade")
	private String grade;

	@Column(name = "passing_year")
	private int passingYear;

	@ManyToOne
	@JoinColumn(name = "candidate_id", nullable = true)
	private CandidateInfo candidateInfo;

	@ManyToOne
    @JoinColumn(name = "district_id", nullable = true)
	private District district;
	
	@ManyToOne
    @JoinColumn(name = "thana_id", nullable = true)
	private Thana thana;
	
	
	
	
	
	
	
	
	
	
//	@OneToMany(mappedBy = "academicHistory", cascade = CascadeType.ALL)
//	private Set<AcademicDoc> academicDoc;
//	
//	public AcademicHistory() {
//		// TODO Auto-generated constructor stub
//	}
//	
//
//	public Set<AcademicDoc> getAcademicDoc() {
//		return academicDoc;
//	}
//
//	public void setAcademicDoc(Set<AcademicDoc> academicDoc) {
//		this.academicDoc = academicDoc;
//	}

	
	
	public Thana getThana() {
		return thana;
	}

	public void setThana(Thana thana) {
		this.thana = thana;
	}

	

	public Integer getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDegreeName() {
		return degreeName;
	}

	public void setDegreeName(String degreeName) {
		this.degreeName = degreeName;
	}

	public String getInstituteName() {
		return instituteName;
	}

	public void setInstituteName(String instituteName) {
		this.instituteName = instituteName;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public int getPassingYear() {
		return passingYear;
	}

	public void setPassingYear(int passingYear) {
		this.passingYear = passingYear;
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


	
	

}
