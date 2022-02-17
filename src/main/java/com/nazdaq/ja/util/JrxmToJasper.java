package com.nazdaq.ja.util;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;


public class JrxmToJasper {
	public static void main(String[] args) throws JRException {
		// TODO Auto-generated method stub
		
        JasperCompileManager.compileReportToFile(
        		"F:\\git-project\\ju-ejms\\src\\main\\resources\\report\\selected_candidate.jrxml", 
        		"F:\\git-project\\ju-ejms\\src\\main\\resources\\report\\selected_candidate.jasper");
     }
	
}
