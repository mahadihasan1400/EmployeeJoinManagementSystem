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
import javax.persistence.Table;

@Entity
@Table(name = "academic_doc")
public class AcademicDoc {

	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	private int id;
	
	@Column(name = "doc_path")
	private String docPath;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "academic_id")
	private AcademicHistory academicHistory;
	
	public AcademicDoc() {
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDocPath() {
		return docPath;
	}

	public void setDocPath(String docPath) {
		this.docPath = docPath;
	}

	public AcademicHistory getAcademicHistory() {
		return academicHistory;
	}

	public void setAcademicHistory(AcademicHistory academicHistory) {
		this.academicHistory = academicHistory;
	}
	
	
	
}
