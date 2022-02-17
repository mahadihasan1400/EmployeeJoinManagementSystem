package com.nazdaq.ja.controller;

import java.security.Principal;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

//import com.nazdaq.ja.model.Company;
//import com.nazdaq.ja.model.Employee;
//import com.nazdaq.ja.model.JobSettings;
import com.nazdaq.ja.model.User;
import com.nazdaq.ja.service.CommonService;
import com.nazdaq.ja.service.UserService;
import com.nazdaq.ja.util.Constants;

@Controller
public class LoginController extends SavedRequestAwareAuthenticationSuccessHandler implements Constants{
		
	@Autowired
	private UserService userService;
	
	@Autowired
	private CommonService commonService;
	
	
	@RequestMapping(value="/success", method = RequestMethod.GET)
	public String success(ModelMap model) {
	return "success"; 
	}
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value={"/","/index"}, method = RequestMethod.GET)
	public ModelAndView printWelcome1(ModelMap model, Principal principal, HttpSession session, HttpServletRequest request) throws ParseException {
		
		if(principal == null) {
			return new ModelAndView("redirect:/login");
		}
		
		/*Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Collection<? extends GrantedAuthority> auth = authentication.getAuthorities();
		String roleName = "";
		for (GrantedAuthority ga : auth) {
			roleName = ga.getAuthority();
			break;
		}*/
	
		
		String roleName = 	commonService.getAuthRoleName();
		
		String pageLocation=null;
		User user=null;
		String name = principal.getName();
		user=userService.getUser(name);			
		
		session.setAttribute("userr", name);
		session.setAttribute("uid", 1);
		session.setAttribute("userrId", session.getAttribute("userr"));
		session.setAttribute("roleName", roleName);
		
		model.addAttribute("userName", session.getAttribute("userr"));
		model.addAttribute("userId", session.getAttribute("userrId"));
		model.addAttribute("roleName", session.getAttribute("roleName"));		
			
		
		Map<String, Object> modelStr = new HashMap<String, Object>();
//		if(!request.isUserInRole("ROLE_ADMIN") || !request.isUserInRole("ROLE_JOB_ADMIN")){	
//			//Employee employee=(Employee) commonService.getAnObjectByAnyUniqueColumn("Employee", "punch_id", user.getEmpId().toString());
//		
//			model.addAttribute("loginEmployee", employee);
//			session.setAttribute("loginEmployee", employee);
//		}
		
		//JobSettings js = (JobSettings)commonService.getAnObjectByAnyUniqueColumn("JobSettings", "authRole", roleName);
		
//		if(request.isUserInRole("ROLE_ADMIN") || request.isUserInRole("ROLE_JOB_ADMIN")){					
//				pageLocation="redirect:/adminDashboard";
//				
//		} else if(js != null) {
//			pageLocation="redirect:/concernDashboard";
//		} else {
//			pageLocation="redirect:/userDashboard";
//		} 
		
		//model.put("otMonth", otMonth);
		
		return new ModelAndView("addDepartmentForm", modelStr);
	}

	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String login(Principal principal) {
		if(principal != null) {
			return "/index";
		}
 		return "login";
	}
 
	@RequestMapping(value="/loginfailed", method = RequestMethod.GET)
	public String loginerror(Model model) {
 
		model.addAttribute("error", "true");
		return "login";
 
	}
 
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logout(Model model, HttpSession session) {
		session.invalidate();
 		return "login";
 	}
	
	@RequestMapping(value = "/myProfile", method = RequestMethod.GET)
//	public ModelAndView myProfile(HttpServletRequest request, HttpSession session, Principal principal, ModelMap model) {
//		if(principal == null) {
//			return new ModelAndView("redirect:/login");
//		}
////		Employee employee = null;
////		if(request.isUserInRole("ROLE_ADMIN")) {
////			employee = new Employee();
////			employee.setName("Admin User");		
////		} else {
////			employee = (Employee) commonService.getAnObjectByAnyUniqueColumn("Employee", "lxnId", principal.getName());
////		}
//		
////		model.put("myProfile", employee);
////		return new ModelAndView("myProfile", model);
//	}
	
	/**
	 * This method returns the principal[user-name] of logged-in user.
	 */
	protected String getPrincipal(){
		String userName = null;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (principal instanceof UserDetails) {
			userName = ((UserDetails)principal).getUsername();
		} else {
			userName = principal.toString();
		}
		return userName;
	}
	
	private Integer getMonthKey(String month) {
		Map<String, Integer> months = new HashMap<String, Integer>();
		months.put("January", 1);
		months.put("February", 2);
		months.put("March", 3);
		months.put("April", 4);
		months.put("May", 5);
		months.put("June", 6);
		months.put("July", 7);
		months.put("August", 8);
		months.put("September", 9);
		months.put("October", 10);
		months.put("November", 11);
		months.put("December", 12);
		
		return months.get(month);
	}
	
	private String getMonthName(Integer key) {
		Map<Integer, String> months = new HashMap<Integer, String>();
		months.put(1, "January");
		months.put(2, "February");
		months.put(3, "March");
		months.put(4, "April");
		months.put(5, "May");
		months.put(6, "June");
		months.put(7, "July");
		months.put(8, "August");
		months.put(9, "September");
		months.put(10, "October");
		months.put(11, "November");
		months.put(12, "December");		
		return months.get(key);
	}
	
	
}
