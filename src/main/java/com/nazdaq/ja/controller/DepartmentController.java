package com.nazdaq.ja.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.nazdaq.ja.model.Department;
import com.nazdaq.ja.service.CommonService;
import com.nazdaq.ja.service.UserService;

@Controller
public class DepartmentController {
	@Autowired
	private UserService userService;

	@Autowired
	private CommonService commonService;

	@RequestMapping(value = "/deparmentList", method = RequestMethod.GET)
	public ModelAndView listDepartment(Model theModel, Principal principal) {

		if (principal == null) {
			return new ModelAndView("redirect:/login");
		}

		List<Department> theDepartments = commonService.getDepartments();

		theModel.addAttribute("departments", theDepartments);

		return new ModelAndView("departmentListForm");

	}

	@RequestMapping(value = "/addDepartment", method = RequestMethod.GET)
	public ModelAndView addDepartment(Model theModel, Principal principal) {
		
//		if (principal == null) {
//			return new ModelAndView("redirect:/login");
//		}

		Department theDepartment = new Department();
		theModel.addAttribute("department", theDepartment);
		return new ModelAndView("addDepartmentForm");
	}

	@RequestMapping(value = "/saveDepartment", method = RequestMethod.POST)
	public ModelAndView saveCustomer(@ModelAttribute("department") Department theDepartment , Principal principal) {

		if (principal == null) {
			return new ModelAndView("redirect:/login");
		}
		// save the customer using our service

		commonService.saveDepartment(theDepartment);

		return new ModelAndView("redirect:/deparmentList");
	}

	@RequestMapping(value = "/deleteDepartment", method = RequestMethod.GET)
	public ModelAndView deleteCustomer(@RequestParam("departmentId") int theId) {
		commonService.deleteDepartment(theId);
		return new ModelAndView("redirect:/deparmentList");
	}

	@RequestMapping(value = "/showFormForUpdateDepartment", method = RequestMethod.GET)
	public ModelAndView showFormForUpdate(@RequestParam("departmentId") int theId, Model theModel) {

		// get the customer from our service
		Department theDepartment = commonService.getDepartment(theId);

		// set customer as a model attribute to pre-populate the form
		theModel.addAttribute("department", theDepartment);

		// send over to our form
		return new ModelAndView("addDepartmentForm");
	}

}
