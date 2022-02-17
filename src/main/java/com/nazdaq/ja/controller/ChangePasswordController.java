package com.nazdaq.ja.controller;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.Principal;
import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.nazdaq.ja.model.User;
import com.nazdaq.ja.service.UserService;

@Controller
public class ChangePasswordController {
	@Autowired
	UserService userService;
	
	
	@RequestMapping(value={"/changePassword"}, method = RequestMethod.GET)
	public ModelAndView changePassword(User userForm, Principal principal){
		
		User user=null;
		String name = principal.getName();
		user=userService.getUser(name);
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("loginUser", user);
		return new ModelAndView("changePassword", model);
	}
	
	@RequestMapping(value={"/updatePassword"}, method = RequestMethod.POST)
	public ModelAndView updatePassword(User userForm, Principal principal) throws NoSuchAlgorithmException{
		User user=null;
		String name = principal.getName();
		user=userService.getUser(name);
		if(!userForm.getPassword().equals("")){
			//PasswordEncoderMD5 pemd = new PasswordEncoderMD5();
			//String password = pemd.getEncryptedPassword(userForm.getPassword());
			//user.setPassword(password);			
			//user.setLoginCounter("0");
			user.setPassword(userForm.getPassword());
			userService.addUser(user);			
			return new ModelAndView("redirect:/logout");
		} else {
			return new ModelAndView("redirect:/index");
		}
		
	}	
	
}
