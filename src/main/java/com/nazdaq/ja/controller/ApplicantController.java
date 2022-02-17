package com.nazdaq.ja.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dropbox.core.v1.DbxEntry.File;
import com.nazdaq.ja.model.AcademicDoc;
import com.nazdaq.ja.model.AcademicHistory;
import com.nazdaq.ja.model.CandidateInfo;
import com.nazdaq.ja.model.Department;
import com.nazdaq.ja.model.District;
import com.nazdaq.ja.model.EmployementHistory;
import com.nazdaq.ja.model.EmploymentDoc;
import com.nazdaq.ja.model.OtherDegrees;
import com.nazdaq.ja.model.Thana;
import com.nazdaq.ja.service.CommonService;
import com.nazdaq.ja.service.UserService;

@Controller
public class ApplicantController {

	@Autowired
	private UserService userService;

	@Autowired
	private CommonService commonService;

	private static final Logger logger = LoggerFactory.getLogger(ApplicationController.class);

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/applicantList", method = RequestMethod.GET)
	public ModelAndView applicantList(Model theModel, Principal principal) {

		if (principal == null) {
			return new ModelAndView("redirect:/login");
		}

		List<CandidateInfo> candidateInfos = (List<CandidateInfo>) (Object) commonService
				.getAllObjectList("CandidateInfo");

		theModel.addAttribute("candidateInfos", candidateInfos);

		return new ModelAndView("applicantList");
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/viewCandidateInfo", method = RequestMethod.GET)
	public ModelAndView viewCandidateInfo(Model theModel, HttpServletRequest request, Principal principal) {

		if (principal == null) {
			return new ModelAndView("redirect:/login");
		}

		CandidateInfo singleCandidateInfo = (CandidateInfo) commonService.getAnObjectByAnyUniqueColumn("CandidateInfo",
				"id", request.getParameter("id"));

		List<Department> listDepartmentHistory = singleCandidateInfo.getDepartMent();

		List<AcademicHistory> listacademicHistory = (List<AcademicHistory>) (Object) commonService
				.getObjectListByAnyColumn("AcademicHistory", "candidate_id", request.getParameter("id"));

		OtherDegrees otherDegrees = (OtherDegrees) commonService.getAnObjectByAnyUniqueColumn("OtherDegrees", "id",
				request.getParameter("id"));

		List<EmployementHistory> listemploymentHistory = (List<EmployementHistory>) (Object) commonService
				.getObjectListByAnyColumn("EmployementHistory", "candidate_id", request.getParameter("id"));

		theModel.addAttribute("singleCandidateInfo", singleCandidateInfo);
		theModel.addAttribute("listacademicHistory", listacademicHistory);
		theModel.addAttribute("otherDegrees", otherDegrees);
		theModel.addAttribute("listemploymentHistory", listemploymentHistory);
		theModel.addAttribute("listDepartmentHistory", listDepartmentHistory);

		return new ModelAndView("viewCandidateInfo");
	}

	@RequestMapping("/photo/{image}")
	@ResponseBody
	public byte[] photo(@PathVariable("image") String image) throws IOException {

		java.io.File arquivo = new java.io.File("/upload/ejms/" + image + ".jpg");

		if (!arquivo.exists()) {
			arquivo = new java.io.File("/upload/ejms/photo.png");
		}

		byte[] resultado = new byte[(int) arquivo.length()];
		FileInputStream input = new FileInputStream(arquivo);
		input.read(resultado);
		input.close();
		return resultado;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/viewAcademicInfoDetails", method = RequestMethod.GET)
	public ModelAndView viewAcademicInfoDetails(Model theModel, HttpServletRequest request, Principal principal) {

		if (principal == null) {
			return new ModelAndView("redirect:/login");
		}

		List<AcademicDoc> listAcademicDoc = (List<AcademicDoc>) (Object) commonService
				.getObjectListByAnyColumn("AcademicDoc", "academic_id", request.getParameter("id"));

		theModel.addAttribute("listAcademicDoc", listAcademicDoc);

		return new ModelAndView("viewAcademicInfo");
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/viewEmploymentInfoDetails", method = RequestMethod.GET)
	public ModelAndView viewEmploymentInfoDetails(Model theModel, HttpServletRequest request, Principal principal) {

		if (principal == null) {
			return new ModelAndView("redirect:/login");
		}

		List<EmploymentDoc> listEmploymentDoc = (List<EmploymentDoc>) (Object) commonService
				.getObjectListByAnyColumn("EmploymentDoc", "employee_id", request.getParameter("id"));

		theModel.addAttribute("listEmploymentDoc", listEmploymentDoc);

		return new ModelAndView("viewEmploymentInfo");
	}

}
