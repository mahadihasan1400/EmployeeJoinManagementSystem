package com.nazdaq.ja.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collector;
import java.util.stream.Collectors;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.itextpdf.text.pdf.PdfStructTreeController.returnType;
import com.nazdaq.ja.model.District;
import com.nazdaq.ja.model.Thana;
import com.nazdaq.ja.service.CommonService;
import com.nazdaq.ja.service.UserService;

@Controller
public class ThanaController {

	@Autowired
	private UserService userService;

	@Autowired
	private CommonService commonService;

	@RequestMapping(value = "/thanaList", method = RequestMethod.GET)
	public ModelAndView listDepartment(Model theModel, Principal principal) {

		if (principal == null) {
			return new ModelAndView("redirect:/login");
		}

		List<Thana> theThanas = (List<Thana>) (Object) commonService.getAllObjectList("Thana");

		// List<Thana> theThanaList
		// =commonService.getAllObjectList("Thana").stream().map(x->(Thana)x).collect(Collectors.toList());

		theModel.addAttribute("thanas", theThanas);

		return new ModelAndView("thanaList");

	}

	@RequestMapping(value = "/addThana", method = RequestMethod.GET)
	public ModelAndView addDistrict(Model theModel, Principal principal) {

		// if (principal == null) {
		// return new ModelAndView("redirect:/login");
		// }

		List<District> theDistricts = commonService.getDistricts();

		Map<Integer, String> districts = new HashMap<Integer, String>();

		for (District district : theDistricts) {
			districts.put(district.getId(), district.getName());
		}

		theModel.addAttribute("districtList", districts);
		Thana theThana = new Thana();
		theModel.addAttribute("thana", theThana);
		return new ModelAndView("addThanaForm");
	}

	@RequestMapping(value = "/saveThana", method = RequestMethod.POST)
	public ModelAndView saveThana(@ModelAttribute("thana") Thana theThana, Principal principal) {

		if (principal == null) {
			return new ModelAndView("redirect:/login");
		}

		District district = (District) commonService.getAnObjectByAnyUniqueColumn("District", "id",
				theThana.getDistrictId().toString());
		theThana.setDistrict(district);
		commonService.saveOrUpdateModelObjectToDB(theThana);
		return new ModelAndView("redirect:/thanaList");
	}

	@RequestMapping(value = "/deleteThana", method = RequestMethod.GET)
	public ModelAndView deleteThana(@RequestParam("thanaId") int theId) {
		commonService.deleteAnObjectById("Thana", theId);
		return new ModelAndView("redirect:/thanaList");
	}

	@RequestMapping(value = "/showFormForUpdateThanas", method = RequestMethod.GET)
	public ModelAndView showFormForUpdate(@RequestParam("thanaId") Integer theId, Model theModel) {

		// get the customer from our service
		Thana theThana = (Thana) commonService.getAnObjectByAnyUniqueColumn("Thana", "id", theId.toString());
		List<District> theDistricts = (List<District>) (Object) commonService.getAllObjectList("District");

		Map<Integer, String> districts = new HashMap<Integer, String>();

		for (District district : theDistricts) {
			districts.put(district.getId(), district.getName());
		}

		// set customer as a model attribute to pre-populate the form
		theModel.addAttribute("thana", theThana);
		theModel.addAttribute("districtList", districts);

		// send over to our form
		return new ModelAndView("addThanaForm");
	}

	@RequestMapping(value = "/thana/search", method = RequestMethod.POST)
	public ModelAndView searchThana(Principal principal, HttpServletRequest request) {
		Gson gsonBuilder = new GsonBuilder().create();
		List<Thana> thanaList = commonService
				.getObjectListByHqlQuery("from Thana where name like'%" + request.getParameter("query") + "%'").stream()
				.map(x -> (Thana) x).collect(Collectors.toList());

		 String jsonFromThanaList = gsonBuilder.toJson(thanaList);

	/*	JSONArray json_array = new JSONArray();

		for (Thana list : thanaList) {

			json_array.put(list);

		}*/
		
		

		if (principal == null) {
			return new ModelAndView("redirect:/login");
		}
		return null;
	}

}
