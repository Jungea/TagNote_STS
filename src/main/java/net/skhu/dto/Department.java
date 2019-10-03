package net.skhu.dto;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class Department implements Serializable {

	int id;
	String departmentName;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDepartmentName() {
		return departmentName;
	}

	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}

}
