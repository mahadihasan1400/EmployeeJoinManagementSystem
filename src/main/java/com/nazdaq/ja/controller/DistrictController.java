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
import com.nazdaq.ja.model.District;
import com.nazdaq.ja.service.CommonService;
import com.nazdaq.ja.service.UserService;

@Controller
public class DistrictController {

	@Autowired
	private UserService userService;

	@Autowired
	private CommonService commonService;

	@RequestMapping(value = "/districtList", method = RequestMethod.GET)
	public ModelAndView listDepartment(Model theModel, Principal principal) {

		if (principal == null) {
			return new ModelAndView("redirect:/login");
		}

		List<District> theDistricts = commonService.getDistricts();

		theModel.addAttribute("districts", theDistricts);

		return new ModelAndView("districtList");

	}
	
	
	
	
	
	
	
	@RequestMapping(value = "/addDistrict", method = RequestMethod.GET)
	public ModelAndView addDistrict(Model theModel, Principal principal) {
		
//		if (principal == null) {
//			return new ModelAndView("redirect:/login");
//		}

		District theDistrict = new District();
		theModel.addAttribute("district", theDistrict);
		return new ModelAndView("addDistrictForm");
	}
	
	@RequestMapping(value = "/saveDistrict", method = RequestMethod.POST)
	public ModelAndView saveDistrict(@ModelAttribute("district") District theDistrict , Principal principal) {

		if (principal == null) {
			return new ModelAndView("redirect:/login");
		}
		// save the customer using our service

		commonService.saveDistrict(theDistrict);

		return new ModelAndView("redirect:/districtList");
	}
	
	
	
	
	
	
	
	
	
	@RequestMapping(value = "/showFormForUpdateDistricts", method = RequestMethod.GET)
	public ModelAndView showFormForUpdate(@RequestParam("districtId") int theId, Model theModel) {

		// get the customer from our service
		District theDistrict = commonService.getDistrict(theId);

		// set customer as a model attribute to pre-populate the form
		theModel.addAttribute("district", theDistrict);

		// send over to our form
		return new ModelAndView("addDistrictForm");
	}
	
	@RequestMapping(value = "/deleteDistrict", method = RequestMethod.GET)
	public ModelAndView deleteDistrict(@RequestParam("districtId") int theId) {
		commonService.deleteDistrict(theId);
		return new ModelAndView("redirect:/districtList");
	}
	
	
	

}
