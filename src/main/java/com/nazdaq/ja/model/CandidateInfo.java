package com.nazdaq.ja.model;

import java.util.List;
import java.util.Set;

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
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "candidate_info")
public class CandidateInfo {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	private int id;

	@Column(name = "name")
	private String name;

	@Column(name = "email")
	private String email;

	@Column(name = "phn")
	private String phn;

	@Column(name = "present_add")
	private String presentAdd;

	@Column(name = "permanent_add")
	private String permanentAdd;

	@Column(name = "father_name")
	private String fatherName;

	@Column(name = "mother_name")
	private String motherName;

	@Column(name = "nid_no")
	private long nidNo;

	@Column(name = "pass_no")
	private long passNo;

	@Column(name = "person_image_path")
	private String personImagePath;

	@OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy = "candidateInfo")
	private OtherDegrees otherDegrees;

	public OtherDegrees getOtherDegrees() {
		return otherDegrees;
	}

	public void setOtherDegrees(OtherDegrees otherDegrees) {
		this.otherDegrees = otherDegrees;
	}

	public String getPersonImagePath() {
		return personImagePath;
	}

	public void setPersonImagePath(String personImagePath) {
		this.personImagePath = personImagePath;
	}

	@OneToMany(mappedBy = "candidateInfo", cascade = CascadeType.ALL)
	private Set<AcademicHistory> academicHistory;

	@OneToMany(mappedBy = "candidateInfo", cascade = CascadeType.ALL)
	private Set<EmployementHistory> employementHistory;

	
	
	
	@ManyToMany(fetch = FetchType.EAGER, cascade = { CascadeType.PERSIST, CascadeType.MERGE, CascadeType.DETACH,
			CascadeType.REFRESH })
	@JoinTable(name = "candidate_dept", joinColumns = @JoinColumn(name = "candidate_id"), inverseJoinColumns = @JoinColumn(name = "dept_id"))

	private List<Department> departMent;
	
	
	
	

	public List<Department> getDepartMent() {
		return departMent;
	}

	public void setDepartMent(List<Department> departMent) {
		this.departMent = departMent;
	}

	public CandidateInfo() {

	}

	public Set<EmployementHistory> getEmployementHistory() {
		return employementHistory;
	}

	public void setEmployementHistory(Set<EmployementHistory> employementHistory) {
		this.employementHistory = employementHistory;
	}

	public Set<AcademicHistory> getAcademicHistory() {
		return academicHistory;
	}

	public void setAcademicHistory(Set<AcademicHistory> academicHistory) {
		this.academicHistory = academicHistory;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhn() {
		return phn;
	}

	public void setPhn(String phn) {
		this.phn = phn;
	}

	public String getPresentAdd() {
		return presentAdd;
	}

	public void setPresentAdd(String presentAdd) {
		this.presentAdd = presentAdd;
	}

	public String getPermanentAdd() {
		return permanentAdd;
	}

	public void setPermanentAdd(String permanentAdd) {
		this.permanentAdd = permanentAdd;
	}

	public String getFatherName() {
		return fatherName;
	}

	public void setFatherName(String fatherName) {
		this.fatherName = fatherName;
	}

	public String getMotherName() {
		return motherName;
	}

	public void setMotherName(String motherName) {
		this.motherName = motherName;
	}

	public long getNidNo() {
		return nidNo;
	}

	public void setNidNo(long nidNo) {
		this.nidNo = nidNo;
	}

	public long getPassNo() {
		return passNo;
	}

	public void setPassNo(long passNo) {
		this.passNo = passNo;
	}

}
