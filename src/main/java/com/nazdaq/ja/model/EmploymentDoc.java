package com.nazdaq.ja.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "employment_doc")
public class EmploymentDoc {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	private int id;
	
	@Column(name = "doc_path")
	private String docPath;
	
	@ManyToOne
	@JoinColumn(name = "employee_id")
	private EmployementHistory employementHistory;
	
	public EmploymentDoc() {

	
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

	public EmployementHistory getEmployementHistory() {
		return employementHistory;
	}

	public void setEmployementHistory(EmployementHistory employementHistory) {
		this.employementHistory = employementHistory;
	}


	
	
	
}
