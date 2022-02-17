package com.nazdaq.ja.controller;

import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nazdaq.ja.beans.CandidateInfoBeans;
import com.nazdaq.ja.beans.SelectedCandidateBeans;
import com.nazdaq.ja.beans.SubReportBeanAcademicHistory;
import com.nazdaq.ja.beans.SubReportBeanAppliedDepartment;
import com.nazdaq.ja.beans.SubReportBeanEmployementHistory;
//import com.nazdaq.sms.beans.RequisitionBean;
//import com.nazdaq.sms.beans.SmsAdvanceBean;
//import com.nazdaq.sms.beans.StockBean;
//import com.nazdaq.sms.beans.SubReportBean;
//import com.nazdaq.sms.model.ProductPriceHistory;
//import com.nazdaq.sms.model.Requisition;
//import com.nazdaq.sms.model.RequisitionHistory;
//import com.nazdaq.sms.model.RequisitionItem;
//import com.nazdaq.sms.model.Stock;
import com.nazdaq.ja.model.AcademicHistory;
import com.nazdaq.ja.model.CandidateInfo;
import com.nazdaq.ja.model.Department;
import com.nazdaq.ja.model.EmployementHistory;
import com.nazdaq.ja.service.CommonService;
import com.nazdaq.ja.util.Constants;
import com.nazdaq.ja.util.SendEmail;
//import com.nazdaq.sms.util.EnglishNumberToWords;
//import com.nazdaq.sms.util.NumberWordConverter;
import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.util.JRLoader;

import java.io.InputStream;
import java.io.OutputStream;

@Controller
@PropertySource("classpath:common.properties")
public class ReportController implements Constants {

	@Autowired
	private CommonService commonService;

	@Autowired
	private JavaMailSender mailSender;

	@Value("${cc.email.addresss}")
	String ccEmailAddresss;

	// methods to company show
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/reqReport", method = RequestMethod.GET)
	public void ejmsReport(ModelMap model, RedirectAttributes redirectAttributes,
			Principal principal, HttpSession session, HttpServletResponse response,HttpServletRequest request)
			throws JRException, IOException, ParseException, MessagingException {

		JRDataSource jRdataSource = null;

		CandidateInfo candidateInfo = (CandidateInfo) commonService.getAnObjectByAnyUniqueColumn("CandidateInfo", "id",request.getParameter("id"));

		List<AcademicHistory> listacademicHistory = (List<AcademicHistory>) (Object) commonService
				.getObjectListByAnyColumn("AcademicHistory", "candidate_id", String.valueOf(candidateInfo.getId()));

		List<EmployementHistory> listemploymentHistory = (List<EmployementHistory>) (Object) commonService
				.getObjectListByAnyColumn("EmployementHistory", "candidate_id", String.valueOf(candidateInfo.getId()));

		List<Department> listDepartmentHistory = candidateInfo.getDepartMent();

		List<CandidateInfoBeans> ejmsCandidateInfoBeans = new ArrayList<>();

		List<SubReportBeanAcademicHistory> listSubReportBeansAcademicHistory = new ArrayList<>();

		for (AcademicHistory academicHistoryItem : listacademicHistory) {
			SubReportBeanAcademicHistory subReportBeanAcademicHistory = new SubReportBeanAcademicHistory();

			String degreeName = academicHistoryItem.getDegreeName();
			String instituteName = academicHistoryItem.getInstituteName();

			String grade = academicHistoryItem.getGrade();

			subReportBeanAcademicHistory.setDegree_name(degreeName);
			subReportBeanAcademicHistory.setInstitute_name(instituteName);
			subReportBeanAcademicHistory.setPassing_year(academicHistoryItem.getPassingYear());
			subReportBeanAcademicHistory.setGrade(grade);

			listSubReportBeansAcademicHistory.add(subReportBeanAcademicHistory);

		}

		List<SubReportBeanEmployementHistory> listSubReportBeansEmployementHistory = new ArrayList<>();

		for (EmployementHistory employementHistoryItem : listemploymentHistory) {
			SubReportBeanEmployementHistory subReportBeanEmployementHistory = new SubReportBeanEmployementHistory();

			String companyName = employementHistoryItem.getCompanyName();
			String department = employementHistoryItem.getDepartment();
			String designation = employementHistoryItem.getDesignation();
			Integer yearOfExp = employementHistoryItem.getYearOfExp();
			String address = employementHistoryItem.getAddress();

			subReportBeanEmployementHistory.setAddress(address);
			subReportBeanEmployementHistory.setCompany_name(companyName);
			subReportBeanEmployementHistory.setDesignation(designation);
			subReportBeanEmployementHistory.setDepartment(department);
			subReportBeanEmployementHistory.setYear_of_exp(yearOfExp);

			listSubReportBeansEmployementHistory.add(subReportBeanEmployementHistory);

		}

		List<SubReportBeanAppliedDepartment> listSubReportBeansAppliedDepartment = new ArrayList<>();

		for (Department departmentItem : listDepartmentHistory) {
			SubReportBeanAppliedDepartment subReportBeanAppliedDepartment = new SubReportBeanAppliedDepartment();

			Integer id_ad = departmentItem.getId();
			String name = departmentItem.getName();

			subReportBeanAppliedDepartment.setId(id_ad);
			subReportBeanAppliedDepartment.setName(name);

			listSubReportBeansAppliedDepartment.add(subReportBeanAppliedDepartment);

		}

		CandidateInfoBeans candidateInfoBeans = new CandidateInfoBeans();

		candidateInfoBeans.setEmail(candidateInfo.getEmail());
		candidateInfoBeans.setFather_name(candidateInfo.getFatherName());
		candidateInfoBeans.setMother_name(candidateInfo.getMotherName());
		candidateInfoBeans.setName(candidateInfo.getName());
		candidateInfoBeans.setNid_no(candidateInfo.getNidNo());
		candidateInfoBeans.setPass_no(candidateInfo.getPassNo());
		candidateInfoBeans.setPermanent_add(candidateInfo.getPermanentAdd());
		candidateInfoBeans.setPhn(candidateInfo.getPhn());
		candidateInfoBeans.setPresent_add(candidateInfo.getPresentAdd());

		ejmsCandidateInfoBeans.add(candidateInfoBeans);
		
		SendEmail sendEmail=new SendEmail();
		sendEmail.sendmailToUser(mailSender, candidateInfo.getEmail(), "You have been selected", "<h1>Congratulation You have been selected</h1>", "", ccEmailAddresss, "");


		InputStream jasperStream = null;

		jasperStream = this.getClass().getResourceAsStream("/report/ejms.jasper");
		CandidateInfoBeans candidateInfoBeans2 = new CandidateInfoBeans();
		Map<String, Object> params = new HashMap<>();
		Map<String, Object> datasourcemap = new HashMap<>();
		datasourcemap.put("CandidateInfoBeans", candidateInfoBeans2);
		jRdataSource = new JRBeanCollectionDataSource(ejmsCandidateInfoBeans, false);

		params.put("SUBREPORT_DATA_ACH", listSubReportBeansAcademicHistory);
		params.put("SUBREPORT_DATA_EMH", listSubReportBeansEmployementHistory);
		params.put("SUBREPORT_DATA_AD", listSubReportBeansAppliedDepartment);

		// prepare report first for one

		JasperReport jasperReport = (JasperReport) JRLoader.loadObject(jasperStream);
		JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, params, jRdataSource);

		response.setContentType("application/x-pdf");
		response.setHeader("Content-disposition", "inline; filename=req_" + candidateInfo.getId() + "_"
				+ candidateInfo.getName().trim().replaceAll("\\.", "_").replace(" ", "_") + "" + ".pdf");
		final OutputStream outStream = response.getOutputStream();
		JasperExportManager.exportReportToPdfStream(jasperPrint, outStream);
		
		
	}
	
	
	
	
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/printSelectedCandidate", method = RequestMethod.POST)
	public void printSelectedCandidate(ModelMap model, RedirectAttributes redirectAttributes,
			Principal principal, HttpSession session, HttpServletResponse response,HttpServletRequest request)
			throws JRException, IOException, ParseException, MessagingException {
		
		
		
		
		String value = request.getParameter("checkedValue");
		String [] tempArray = value.split(",");
		
		
		String hqlQuery = "From CandidateInfo where " ;
				
		
		
		
		for(int i = 0; i < tempArray.length; i++) {
			String idGenerator = "id = " + tempArray[i];
			hqlQuery += idGenerator;
			
			if(tempArray.length != 1 && i != (tempArray.length - 1)) {
				hqlQuery += " OR ";
			}
			
		}
		
		JRDataSource jRdataSource = null;
				
		List<CandidateInfo> caList = commonService.getObjectListByHqlQuery(hqlQuery).stream()
				.map(e -> (CandidateInfo) e).collect(Collectors.toList());
		
		List<SelectedCandidateBeans> listReportBeansSelectedCandidate = new ArrayList<>();
		
		
		
		
		
		
		
		for (CandidateInfo canddiateInfoItem : caList) {
			SelectedCandidateBeans selectedCandidateBeans = new SelectedCandidateBeans();

			selectedCandidateBeans.setName(canddiateInfoItem.getName());
			selectedCandidateBeans.setEmail(canddiateInfoItem.getEmail());
			selectedCandidateBeans.setPhn(canddiateInfoItem.getPhn());
			selectedCandidateBeans.setNid_no(canddiateInfoItem.getNidNo());
			selectedCandidateBeans.setPass_no(canddiateInfoItem.getPassNo());

			listReportBeansSelectedCandidate.add(selectedCandidateBeans);

		}
		
		
		
		InputStream jasperStream = null;

		jasperStream = this.getClass().getResourceAsStream("/report/selected_candidate.jasper");
		SelectedCandidateBeans selectedCandidateBeans2 = new SelectedCandidateBeans();
		Map<String, Object> params = new HashMap<>();
		Map<String, Object> datasourcemap = new HashMap<>();
		datasourcemap.put("SelectedCandidateBeans", selectedCandidateBeans2);
		jRdataSource = new JRBeanCollectionDataSource(listReportBeansSelectedCandidate, false);
		
		
		
		// prepare report first for one

				JasperReport jasperReport = (JasperReport) JRLoader.loadObject(jasperStream);
				JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, params, jRdataSource);

				response.setContentType("application/x-pdf");
				response.setHeader("Content-disposition", "inline; filename=selected_candidate.pdf");
				final OutputStream outStream = response.getOutputStream();
				JasperExportManager.exportReportToPdfStream(jasperPrint, outStream);
				
		
		
		

		/*JRDataSource jRdataSource = null;

		CandidateInfo candidateInfo = (CandidateInfo) commonService.getAnObjectByAnyUniqueColumn("CandidateInfo", "id",request.getParameter("id"));

		List<AcademicHistory> listacademicHistory = (List<AcademicHistory>) (Object) commonService
				.getObjectListByAnyColumn("AcademicHistory", "candidate_id", String.valueOf(candidateInfo.getId()));

		List<EmployementHistory> listemploymentHistory = (List<EmployementHistory>) (Object) commonService
				.getObjectListByAnyColumn("EmployementHistory", "candidate_id", String.valueOf(candidateInfo.getId()));

		List<Department> listDepartmentHistory = candidateInfo.getDepartMent();

		List<CandidateInfoBeans> ejmsCandidateInfoBeans = new ArrayList<>();

		List<SubReportBeanAcademicHistory> listSubReportBeansAcademicHistory = new ArrayList<>();

		for (AcademicHistory academicHistoryItem : listacademicHistory) {
			SubReportBeanAcademicHistory subReportBeanAcademicHistory = new SubReportBeanAcademicHistory();

			String degreeName = academicHistoryItem.getDegreeName();
			String instituteName = academicHistoryItem.getInstituteName();

			String grade = academicHistoryItem.getGrade();

			subReportBeanAcademicHistory.setDegree_name(degreeName);
			subReportBeanAcademicHistory.setInstitute_name(instituteName);
			subReportBeanAcademicHistory.setPassing_year(academicHistoryItem.getPassingYear());
			subReportBeanAcademicHistory.setGrade(grade);

			listSubReportBeansAcademicHistory.add(subReportBeanAcademicHistory);

		}

		List<SubReportBeanEmployementHistory> listSubReportBeansEmployementHistory = new ArrayList<>();

		for (EmployementHistory employementHistoryItem : listemploymentHistory) {
			SubReportBeanEmployementHistory subReportBeanEmployementHistory = new SubReportBeanEmployementHistory();

			String companyName = employementHistoryItem.getCompanyName();
			String department = employementHistoryItem.getDepartment();
			String designation = employementHistoryItem.getDesignation();
			Integer yearOfExp = employementHistoryItem.getYearOfExp();
			String address = employementHistoryItem.getAddress();

			subReportBeanEmployementHistory.setAddress(address);
			subReportBeanEmployementHistory.setCompany_name(companyName);
			subReportBeanEmployementHistory.setDesignation(designation);
			subReportBeanEmployementHistory.setDepartment(department);
			subReportBeanEmployementHistory.setYear_of_exp(yearOfExp);

			listSubReportBeansEmployementHistory.add(subReportBeanEmployementHistory);

		}

		List<SubReportBeanAppliedDepartment> listSubReportBeansAppliedDepartment = new ArrayList<>();

		for (Department departmentItem : listDepartmentHistory) {
			SubReportBeanAppliedDepartment subReportBeanAppliedDepartment = new SubReportBeanAppliedDepartment();

			Integer id_ad = departmentItem.getId();
			String name = departmentItem.getName();

			subReportBeanAppliedDepartment.setId(id_ad);
			subReportBeanAppliedDepartment.setName(name);

			listSubReportBeansAppliedDepartment.add(subReportBeanAppliedDepartment);

		}

		CandidateInfoBeans candidateInfoBeans = new CandidateInfoBeans();

		candidateInfoBeans.setEmail(candidateInfo.getEmail());
		candidateInfoBeans.setFather_name(candidateInfo.getFatherName());
		candidateInfoBeans.setMother_name(candidateInfo.getMotherName());
		candidateInfoBeans.setName(candidateInfo.getName());
		candidateInfoBeans.setNid_no(candidateInfo.getNidNo());
		candidateInfoBeans.setPass_no(candidateInfo.getPassNo());
		candidateInfoBeans.setPermanent_add(candidateInfo.getPermanentAdd());
		candidateInfoBeans.setPhn(candidateInfo.getPhn());
		candidateInfoBeans.setPresent_add(candidateInfo.getPresentAdd());

		ejmsCandidateInfoBeans.add(candidateInfoBeans);
		
		SendEmail sendEmail=new SendEmail();
		sendEmail.sendmailToUser(mailSender, candidateInfo.getEmail(), "You have been selected", "<h1>Congratulation You have been selected</h1>", "", ccEmailAddresss, "");


		InputStream jasperStream = null;

		jasperStream = this.getClass().getResourceAsStream("/report/ejms.jasper");
		CandidateInfoBeans candidateInfoBeans2 = new CandidateInfoBeans();
		Map<String, Object> params = new HashMap<>();
		Map<String, Object> datasourcemap = new HashMap<>();
		datasourcemap.put("CandidateInfoBeans", candidateInfoBeans2);
		jRdataSource = new JRBeanCollectionDataSource(ejmsCandidateInfoBeans, false);

		params.put("SUBREPORT_DATA_ACH", listSubReportBeansAcademicHistory);
		params.put("SUBREPORT_DATA_EMH", listSubReportBeansEmployementHistory);
		params.put("SUBREPORT_DATA_AD", listSubReportBeansAppliedDepartment);

		// prepare report first for one

		JasperReport jasperReport = (JasperReport) JRLoader.loadObject(jasperStream);
		JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, params, jRdataSource);

		response.setContentType("application/x-pdf");
		response.setHeader("Content-disposition", "inline; filename=req_" + candidateInfo.getId() + "_"
				+ candidateInfo.getName().trim().replaceAll("\\.", "_").replace(" ", "_") + "" + ".pdf");
		final OutputStream outStream = response.getOutputStream();
		JasperExportManager.exportReportToPdfStream(jasperPrint, outStream);*/
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
/*	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/printSelectedCandidate", method = RequestMethod.POST)
	public ModelAndView printSelectedCandidate(Model theModel, Principal principal,HttpServletRequest request) {

		if (principal == null) {
			return new ModelAndView("redirect:/login");
		}

		List<CandidateInfo> candidateInfos = (List<CandidateInfo>) (Object) commonService
				.getAllObjectList("CandidateInfo");

		theModel.addAttribute("candidateInfos", candidateInfos);

		return new ModelAndView("applicantList");
		
		String value = request.getParameter("checkedValue");
		String [] tempArray = value.split(",");
		
		
		String hqlQuery = "From CandidateInfo where " ;
				
		
		
		
		for(int i = 0; i < tempArray.length; i++) {
			String idGenerator = "id = " + tempArray[i];
			hqlQuery += idGenerator;
			
			if(tempArray.length != 1 && i != (tempArray.length - 1)) {
				hqlQuery += " OR ";
			}
			
		}
		
		
		List<CandidateInfo> caList = commonService.getObjectListByHqlQuery(hqlQuery).stream()
				.map(e -> (CandidateInfo) e).collect(Collectors.toList());
		
		return null;
		
	}*/

}
