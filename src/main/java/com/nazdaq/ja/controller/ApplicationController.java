package com.nazdaq.ja.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.support.DefaultMultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.mysql.jdbc.Field;
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
import com.nazdaq.ja.util.NumberWordConverter;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
public class ApplicationController {

	@Autowired
	private UserService userService;

	@Autowired
	private CommonService commonService;

	private static final Logger logger = LoggerFactory.getLogger(ApplicationController.class);

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/applicationForm", method = RequestMethod.GET)
	public ModelAndView applicationForm(Model theModel, Principal principal) {

		if (principal == null) {
			return new ModelAndView("redirect:/login");
		}

		List<Department> departmentList = (List<Department>) (Object) commonService.getAllObjectList("Department");

		List<District> districtList = (List<District>) (Object) commonService.getAllObjectList("District");
		List<Thana> thanaList = (List<Thana>) (Object) commonService.getAllObjectList("Thana");

		theModel.addAttribute("departmentList", departmentList);
		theModel.addAttribute("districtList", districtList);
		theModel.addAttribute("thanaList", thanaList);
		return new ModelAndView("applicationForm");
	}

	@RequestMapping(value = "/savePersonalInfo", method = RequestMethod.POST)
	public ModelAndView savePersonalInfo(Principal principal, HttpServletRequest request,
			@RequestParam("personImage") MultipartFile imagefile,
			@RequestParam("files_for_SSC") MultipartFile[] filesForSSC,
			@RequestParam("files_for_HSC") MultipartFile[] filesForHSC,
			@RequestParam("files_for_BSC") MultipartFile[] filesForBSC,
			@RequestParam("files_for_MS") MultipartFile[] filesForMS) {

		if (principal == null) {
			return new ModelAndView("redirect:/login");

		}

		// Saving General Info

		String filePath = null;
		CandidateInfo candidateInfo = new CandidateInfo();

		String personName = request.getParameter("personName");
		String personEmail = request.getParameter("personEmail");
		String personPhn = request.getParameter("personPhn");
		String personPresentAdd = request.getParameter("personPresentAdd");
		String personPermanentAdd = request.getParameter("personPermanentAdd");
		String personFatherName = request.getParameter("personFatherName");
		String personMotherName = request.getParameter("personMotherName");
		long personNidNo = Integer.parseInt(request.getParameter("personNidNo"));
		long personPassNo = Integer.parseInt(request.getParameter("personPassNo"));

		candidateInfo.setName(personName);
		candidateInfo.setEmail(personEmail);
		candidateInfo.setPhn(personPhn);
		candidateInfo.setPresentAdd(personPresentAdd);
		candidateInfo.setPermanentAdd(personPermanentAdd);
		candidateInfo.setFatherName(personFatherName);
		candidateInfo.setMotherName(personMotherName);
		candidateInfo.setNidNo(personNidNo);
		candidateInfo.setPassNo(personPassNo);

		if (!imagefile.isEmpty()) {
			try {
				byte[] bytes = imagefile.getBytes();

				// Creating the directory to store file
				String rootPath = System.getProperty("catalina.home");
				File dir = new File("/upload/ejms");
				if (!dir.exists())
					dir.mkdirs();

				String fileNameType = imagefile.getOriginalFilename();
				String[] parts = fileNameType.split("\\.");
				String fileName = parts[0];
				String fileType = parts[1];

				Random random = new Random(System.nanoTime() % 100000);

				int randomInt = random.nextInt(1000000000);

				String finalFileName = fileName + "-" + randomInt + "." + "jpg";

				// Create the file on server
				File serverFile = new File(dir.getAbsolutePath() + File.separator + finalFileName);

				filePath = finalFileName;

				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();

				logger.info("Server File Location=" + serverFile.getAbsolutePath());
				System.out.println("You successfully uploaded file=");

			} catch (Exception e) {
				System.out.println("You failed to upload " + " => " + e.getMessage());

			}
		} else {
			System.out.println("You failed to upload " + " because the file was empty.");
		}

		candidateInfo.setPersonImagePath(filePath);

		// Same Application For Multiple Department

		String[] multi_dept = request.getParameterValues("deptName");

		ArrayList<Department> deptList = new ArrayList<>();

		for (int k = 0; k < multi_dept.length; k++) {

			Department department = (Department) commonService.getAnObjectByAnyUniqueColumn("Department", "id",
					multi_dept[k]);
			deptList.add(department);

		}

		candidateInfo.setDepartMent(deptList);

		Integer genaraleInfoId = commonService.saveWithReturnId(candidateInfo);
		candidateInfo.setId(genaraleInfoId);
		candidateInfo = null;
		candidateInfo = (CandidateInfo) commonService.getAnObjectByAnyUniqueColumn("CandidateInfo", "id",
				genaraleInfoId.toString());

		String msCheckboxValue = request.getParameter("check_box_ms");

		if (msCheckboxValue != null) {

			// Saving Academic Info SSC

			String filePathSSC = null;

			AcademicHistory academicHistorySSC = new AcademicHistory();

			String degree_name_ssc = request.getParameter("degree_name_ssc");
			String institute_name_ssc = request.getParameter("institute_name_ssc");
			String ssc_grade = request.getParameter("ssc_grade");
			int ssc_passing_year = Integer.parseInt(request.getParameter("ssc_passing_year"));

			int district_ssc = Integer.parseInt(request.getParameter("district_ssc"));
			int thana_ssc = Integer.parseInt(request.getParameter("thana_ssc"));

			District districtSSC = (District) commonService.getAnObjectByAnyUniqueColumn("District", "id",
					request.getParameter("district_ssc"));
			Thana thanaSSC = (Thana) commonService.getAnObjectByAnyUniqueColumn("Thana", "id",
					request.getParameter("thana_ssc"));

			academicHistorySSC.setDegreeName(degree_name_ssc);
			academicHistorySSC.setInstituteName(institute_name_ssc);
			academicHistorySSC.setGrade(ssc_grade);
			academicHistorySSC.setPassingYear(ssc_passing_year);
			academicHistorySSC.setDistrict(districtSSC);
			academicHistorySSC.setThana(thanaSSC);
			academicHistorySSC.setCandidateInfo(candidateInfo);

			Integer academicHistorySSCid = commonService.saveWithReturnId(academicHistorySSC);

			AcademicHistory academicHistorySSCDB = (AcademicHistory) commonService
					.getAnObjectByAnyUniqueColumn("AcademicHistory", "id", academicHistorySSCid.toString());



			for (int i = 0; i < filesForSSC.length; i++) {
								
				AcademicDoc academicDocSSC = new AcademicDoc();

				MultipartFile fileSSC = filesForSSC[i];

				try {
					
					
					
					
					byte[] bytes = fileSSC.getBytes();

					// Creating the directory to store file
					/*
					String rootPath = System.getProperty("catalina.home");
					File dir = new File("/upload/ejms");
					if (!dir.exists())
						dir.mkdirs();
						*/

					// Create the file on server

					String fileNameType = fileSSC.getOriginalFilename();
					String[] parts = fileNameType.split("\\.");
					String fileName = parts[0];
					String fileType = parts[1];
					
					
					NumberWordConverter.saveImage(fileName, fileSSC , genaraleInfoId);
					
					
					

					String finalFileName = fileName + "-" + genaraleInfoId + "." + fileType;
					//File serverFile = new File(dir.getAbsolutePath() + File.separator + finalFileName);
					filePathSSC = finalFileName;
					//BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
					//stream.write(bytes);
					//stream.close();
					System.out.println("You successfully uploaded file=");
					
					
					
					
					

					// Save SSC File Path to Database

					academicDocSSC.setDocPath(filePathSSC);
					academicDocSSC.setAcademicHistory(academicHistorySSCDB);

					commonService.saveOrUpdateModelObjectToDB(academicDocSSC);

				} catch (Exception e) {
					System.out.println("You failed to upload " + " => " + e.getMessage());
				}
			}

			// Saving Academic Info HSC

			String filePathHSC = null;

			AcademicHistory academicHistoryHSC = new AcademicHistory();

			String degree_name_hsc = request.getParameter("degree_name_hsc");
			String institute_name_hsc = request.getParameter("institute_name_hsc");
			String hsc_grade = request.getParameter("hsc_grade");
			int hsc_passing_year = Integer.parseInt(request.getParameter("hsc_passing_year"));

			int district_hsc = Integer.parseInt(request.getParameter("district_hsc"));
			int thana_hsc = Integer.parseInt(request.getParameter("thana_hsc"));

			District districtHSC = (District) commonService.getAnObjectByAnyUniqueColumn("District", "id",
					request.getParameter("district_hsc"));
			Thana thanaHSC = (Thana) commonService.getAnObjectByAnyUniqueColumn("Thana", "id",
					request.getParameter("thana_hsc"));

			academicHistoryHSC.setDegreeName(degree_name_hsc);
			academicHistoryHSC.setInstituteName(institute_name_hsc);
			academicHistoryHSC.setGrade(hsc_grade);
			academicHistoryHSC.setPassingYear(hsc_passing_year);
			academicHistoryHSC.setDistrict(districtHSC);
			academicHistoryHSC.setThana(thanaHSC);
			academicHistoryHSC.setCandidateInfo(candidateInfo);

			Integer academicHistoryHSCid = commonService.saveWithReturnId(academicHistoryHSC);

			// commonService.saveOrUpdateModelObjectToDB(academicHistoryHSC);
			AcademicHistory academicHistoryHscDb = (AcademicHistory) commonService
					.getAnObjectByAnyUniqueColumn("AcademicHistory", "id", academicHistoryHSCid.toString());

			for (int i = 0; i < filesForHSC.length; i++) {
				AcademicDoc academicDocHSC = new AcademicDoc();

				MultipartFile fileHSC = filesForHSC[i];

				try {
					byte[] bytes = fileHSC.getBytes();

					// Creating the directory to store file
					/*
					String rootPath = System.getProperty("catalina.home");
					File dir = new File("/upload/ejms");
					if (!dir.exists())
						dir.mkdirs();
                    */
					// Create the file on server

					String fileNameType = fileHSC.getOriginalFilename();
					String[] parts = fileNameType.split("\\.");
					String fileName = parts[0];
					String fileType = parts[1];
					
					NumberWordConverter.saveImage(fileName, fileHSC , genaraleInfoId);

					String finalFileName = fileName + "-" + genaraleInfoId + "." + fileType;
					//File serverFile = new File(dir.getAbsolutePath() + File.separator + finalFileName);
					filePathHSC = finalFileName;
					//BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
					//stream.write(bytes);
					//stream.close();
					System.out.println("You successfully uploaded file=");

					// Save HSC File Path to Database

					academicDocHSC.setDocPath(filePathHSC);
					academicDocHSC.setAcademicHistory(academicHistoryHscDb);

					commonService.saveOrUpdateModelObjectToDB(academicDocHSC);

				} catch (Exception e) {
					System.out.println("You failed to upload " + " => " + e.getMessage());
				}
			}

			// Saving Academic Info BSC

			String filePathBSC = null;

			AcademicHistory academicHistoryBSC = new AcademicHistory();

			String degree_name_bsc = request.getParameter("degree_name_bsc");
			String institute_name_bsc = request.getParameter("institute_name_bsc");
			String bsc_grade = request.getParameter("bsc_grade");
			int bsc_passing_year = Integer.parseInt(request.getParameter("bsc_passing_year"));

			int district_bsc = Integer.parseInt(request.getParameter("district_bsc"));
			int thana_bsc = Integer.parseInt(request.getParameter("thana_bsc"));

			District districtBSC = (District) commonService.getAnObjectByAnyUniqueColumn("District", "id",
					request.getParameter("district_bsc"));
			Thana thanaBSC = (Thana) commonService.getAnObjectByAnyUniqueColumn("Thana", "id",
					request.getParameter("thana_bsc"));

			academicHistoryBSC.setDegreeName(degree_name_bsc);
			academicHistoryBSC.setInstituteName(institute_name_bsc);
			academicHistoryBSC.setGrade(bsc_grade);
			academicHistoryBSC.setPassingYear(bsc_passing_year);
			academicHistoryBSC.setDistrict(districtBSC);
			academicHistoryBSC.setThana(thanaBSC);
			academicHistoryBSC.setCandidateInfo(candidateInfo);

			Integer academicHistoryBSCid = commonService.saveWithReturnId(academicHistoryBSC);

			// commonService.saveOrUpdateModelObjectToDB(academicHistoryHSC);
			AcademicHistory academicHistoryBscDb = (AcademicHistory) commonService
					.getAnObjectByAnyUniqueColumn("AcademicHistory", "id", academicHistoryBSCid.toString());

			for (int i = 0; i < filesForBSC.length; i++) {
				AcademicDoc academicDocBSC = new AcademicDoc();

				MultipartFile fileBSC = filesForBSC[i];

				try {
					byte[] bytes = fileBSC.getBytes();

					// Creating the directory to store file
					/*
					String rootPath = System.getProperty("catalina.home");
					File dir = new File("/upload/ejms");
					if (!dir.exists())
						dir.mkdirs();
                    */
					// Create the file on server

					String fileNameType = fileBSC.getOriginalFilename();
					String[] parts = fileNameType.split("\\.");
					String fileName = parts[0];
					String fileType = parts[1];
					
					NumberWordConverter.saveImage(fileName, fileBSC , genaraleInfoId);
					

					String finalFileName = fileName + "-" + genaraleInfoId + "." + fileType;
					//File serverFile = new File(dir.getAbsolutePath() + File.separator + finalFileName);
					filePathBSC = finalFileName;
					//BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
					//stream.write(bytes);
					//stream.close();
					System.out.println("You successfully uploaded file=");

					// Save BSC File Path to Database

					academicDocBSC.setDocPath(filePathBSC);
					academicDocBSC.setAcademicHistory(academicHistoryBscDb);

					commonService.saveOrUpdateModelObjectToDB(academicDocBSC);

				} catch (Exception e) {
					System.out.println("You failed to upload " + " => " + e.getMessage());
				}
			}

			// Saving Academic Info MS

			String filePathMS = null;
			AcademicHistory academicHistoryMS = new AcademicHistory();
			String degree_name_ms = request.getParameter("degree_name_ms");
			String institute_name_ms = request.getParameter("institute_name_ms");
			String ms_grade = request.getParameter("ms_grade");
			int ms_passing_year = Integer.parseInt(request.getParameter("ms_passing_year"));

			int district_ms = Integer.parseInt(request.getParameter("district_ms"));
			int thana_ms = Integer.parseInt(request.getParameter("thana_ms"));

			District districtMS = (District) commonService.getAnObjectByAnyUniqueColumn("District", "id",
					request.getParameter("district_ms"));
			Thana thanaMS = (Thana) commonService.getAnObjectByAnyUniqueColumn("Thana", "id",
					request.getParameter("thana_ms"));

			academicHistoryMS.setDegreeName(degree_name_ms);
			academicHistoryMS.setInstituteName(institute_name_ms);
			academicHistoryMS.setGrade(ms_grade);
			academicHistoryMS.setPassingYear(ms_passing_year);
			academicHistoryMS.setDistrict(districtMS);
			academicHistoryMS.setThana(thanaMS);
			academicHistoryMS.setCandidateInfo(candidateInfo);

			Integer academicHistoryMSid = commonService.saveWithReturnId(academicHistoryMS);

			// commonService.saveOrUpdateModelObjectToDB(academicHistoryHSC);
			AcademicHistory academicHistoryMsDb = (AcademicHistory) commonService
					.getAnObjectByAnyUniqueColumn("AcademicHistory", "id", academicHistoryMSid.toString());

			for (int i = 0; i < filesForMS.length; i++) {
				AcademicDoc academicDocMS = new AcademicDoc();

				MultipartFile fileMS = filesForMS[i];

				try {
					byte[] bytes = fileMS.getBytes();

					// Creating the directory to store file
					/*
					String rootPath = System.getProperty("catalina.home");
					File dir = new File("/upload/ejms");
					if (!dir.exists())
						dir.mkdirs();
                    */
					// Create the file on server

					String fileNameType = fileMS.getOriginalFilename();
					String[] parts = fileNameType.split("\\.");
					String fileName = parts[0];
					String fileType = parts[1];
					
					NumberWordConverter.saveImage(fileName, fileMS , genaraleInfoId);

					String finalFileName = fileName + "-" + genaraleInfoId + "." + fileType;
					//File serverFile = new File(dir.getAbsolutePath() + File.separator + finalFileName);
					filePathMS = finalFileName;
					//BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
					//stream.write(bytes);
					//stream.close();
					System.out.println("You successfully uploaded file=");

					// Save MSC File Path to Database

					academicDocMS.setDocPath(filePathMS);
					academicDocMS.setAcademicHistory(academicHistoryMsDb);

					commonService.saveOrUpdateModelObjectToDB(academicDocMS);

				} catch (Exception e) {
					System.out.println("You failed to upload " + " => " + e.getMessage());
				}
			}

		} else {

			// Saving Academic Info SSC

			String filePathSSC = null;

			AcademicHistory academicHistorySSC = new AcademicHistory();

			String degree_name_ssc = request.getParameter("degree_name_ssc");
			String institute_name_ssc = request.getParameter("institute_name_ssc");
			String ssc_grade = request.getParameter("ssc_grade");
			int ssc_passing_year = Integer.parseInt(request.getParameter("ssc_passing_year"));

			int district_ssc = Integer.parseInt(request.getParameter("district_ssc"));
			int thana_ssc = Integer.parseInt(request.getParameter("thana_ssc"));

			District districtSSC = (District) commonService.getAnObjectByAnyUniqueColumn("District", "id",
					request.getParameter("district_ssc"));
			Thana thanaSSC = (Thana) commonService.getAnObjectByAnyUniqueColumn("Thana", "id",
					request.getParameter("thana_ssc"));

			academicHistorySSC.setDegreeName(degree_name_ssc);
			academicHistorySSC.setInstituteName(institute_name_ssc);
			academicHistorySSC.setGrade(ssc_grade);
			academicHistorySSC.setPassingYear(ssc_passing_year);
			academicHistorySSC.setDistrict(districtSSC);
			academicHistorySSC.setThana(thanaSSC);
			academicHistorySSC.setCandidateInfo(candidateInfo);

			Integer academicHistorySSCid = commonService.saveWithReturnId(academicHistorySSC);

			AcademicHistory academicHistorySSCDB = (AcademicHistory) commonService
					.getAnObjectByAnyUniqueColumn("AcademicHistory", "id", academicHistorySSCid.toString());

			// commonService.saveOrUpdateModelObjectToDB(academicHistorySSC);

			/*
			 * AcademicHistory academicHistoryObSSC = (AcademicHistory) commonService
			 * .getAnObjectByAnyUniqueColumn("AcademicHistory", "id",
			 * academicHistorySSC.getId().toString());
			 */

			for (int i = 0; i < filesForSSC.length; i++) {
				AcademicDoc academicDocSSC = new AcademicDoc();

				MultipartFile fileSSC = filesForSSC[i];

				try {
					byte[] bytes = fileSSC.getBytes();

					// Creating the directory to store file
					
					/*
					String rootPath = System.getProperty("catalina.home");
					File dir = new File("/upload/ejms");
					if (!dir.exists())
						dir.mkdirs();
                     */
					// Create the file on server

					String fileNameType = fileSSC.getOriginalFilename();
					String[] parts = fileNameType.split("\\.");
					String fileName = parts[0];
					String fileType = parts[1];
					
					NumberWordConverter.saveImage(fileName, fileSSC , genaraleInfoId);

					String finalFileName = fileName + "-" + genaraleInfoId + "." + fileType;
					//File serverFile = new File(dir.getAbsolutePath() + File.separator + finalFileName);
					filePathSSC = finalFileName;
					//BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
					//stream.write(bytes);
					//stream.close();
					System.out.println("You successfully uploaded file=");

					// Save SSC File Path to Database

					academicDocSSC.setDocPath(filePathSSC);
					academicDocSSC.setAcademicHistory(academicHistorySSCDB);

					commonService.saveOrUpdateModelObjectToDB(academicDocSSC);

				} catch (Exception e) {
					System.out.println("You failed to upload " + " => " + e.getMessage());
				}
			}

			// Saving Academic Info HSC

			String filePathHSC = null;

			AcademicHistory academicHistoryHSC = new AcademicHistory();

			String degree_name_hsc = request.getParameter("degree_name_hsc");
			String institute_name_hsc = request.getParameter("institute_name_hsc");
			String hsc_grade = request.getParameter("hsc_grade");
			int hsc_passing_year = Integer.parseInt(request.getParameter("hsc_passing_year"));

			int district_hsc = Integer.parseInt(request.getParameter("district_hsc"));
			int thana_hsc = Integer.parseInt(request.getParameter("thana_hsc"));

			District districtHSC = (District) commonService.getAnObjectByAnyUniqueColumn("District", "id",
					request.getParameter("district_hsc"));
			Thana thanaHSC = (Thana) commonService.getAnObjectByAnyUniqueColumn("Thana", "id",
					request.getParameter("thana_hsc"));

			academicHistoryHSC.setDegreeName(degree_name_hsc);
			academicHistoryHSC.setInstituteName(institute_name_hsc);
			academicHistoryHSC.setGrade(hsc_grade);
			academicHistoryHSC.setPassingYear(hsc_passing_year);
			academicHistoryHSC.setDistrict(districtHSC);
			academicHistoryHSC.setThana(thanaHSC);
			academicHistoryHSC.setCandidateInfo(candidateInfo);

			Integer academicHistoryHSCid = commonService.saveWithReturnId(academicHistoryHSC);

			// commonService.saveOrUpdateModelObjectToDB(academicHistoryHSC);
			AcademicHistory academicHistoryHscDb = (AcademicHistory) commonService
					.getAnObjectByAnyUniqueColumn("AcademicHistory", "id", academicHistoryHSCid.toString());

			for (int i = 0; i < filesForHSC.length; i++) {
				AcademicDoc academicDocHSC = new AcademicDoc();

				MultipartFile fileHSC = filesForHSC[i];

				try {
					byte[] bytes = fileHSC.getBytes();

					// Creating the directory to store file
					/*
					String rootPath = System.getProperty("catalina.home");
					File dir = new File("/upload/ejms");
					if (!dir.exists())
						dir.mkdirs();
*/
					// Create the file on server

					String fileNameType = fileHSC.getOriginalFilename();
					String[] parts = fileNameType.split("\\.");
					String fileName = parts[0];
					String fileType = parts[1];
					
					NumberWordConverter.saveImage(fileName, fileHSC , genaraleInfoId);

					String finalFileName = fileName + "-" + genaraleInfoId + "." + fileType;
					//File serverFile = new File(dir.getAbsolutePath() + File.separator + finalFileName);
					filePathHSC = finalFileName;
					//BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
					//stream.write(bytes);
					//stream.close();
					System.out.println("You successfully uploaded file=");

					// Save HSC File Path to Database

					academicDocHSC.setDocPath(filePathHSC);
					academicDocHSC.setAcademicHistory(academicHistoryHscDb);

					commonService.saveOrUpdateModelObjectToDB(academicDocHSC);

				} catch (Exception e) {
					System.out.println("You failed to upload " + " => " + e.getMessage());
				}
			}

			// Saving Academic Info BSC

			String filePathBSC = null;

			AcademicHistory academicHistoryBSC = new AcademicHistory();

			String degree_name_bsc = request.getParameter("degree_name_bsc");
			String institute_name_bsc = request.getParameter("institute_name_bsc");
			String bsc_grade = request.getParameter("bsc_grade");
			int bsc_passing_year = Integer.parseInt(request.getParameter("bsc_passing_year"));

			int district_bsc = Integer.parseInt(request.getParameter("district_bsc"));
			int thana_bsc = Integer.parseInt(request.getParameter("thana_bsc"));

			District districtBSC = (District) commonService.getAnObjectByAnyUniqueColumn("District", "id",
					request.getParameter("district_bsc"));
			Thana thanaBSC = (Thana) commonService.getAnObjectByAnyUniqueColumn("Thana", "id",
					request.getParameter("thana_bsc"));

			academicHistoryBSC.setDegreeName(degree_name_bsc);
			academicHistoryBSC.setInstituteName(institute_name_bsc);
			academicHistoryBSC.setGrade(bsc_grade);
			academicHistoryBSC.setPassingYear(bsc_passing_year);
			academicHistoryBSC.setDistrict(districtBSC);
			academicHistoryBSC.setThana(thanaBSC);
			academicHistoryBSC.setCandidateInfo(candidateInfo);

			Integer academicHistoryBSCid = commonService.saveWithReturnId(academicHistoryBSC);

			// commonService.saveOrUpdateModelObjectToDB(academicHistoryHSC);
			AcademicHistory academicHistoryBscDb = (AcademicHistory) commonService
					.getAnObjectByAnyUniqueColumn("AcademicHistory", "id", academicHistoryBSCid.toString());

			for (int i = 0; i < filesForBSC.length; i++) {
				AcademicDoc academicDocBSC = new AcademicDoc();

				MultipartFile fileBSC = filesForBSC[i];

				try {
					byte[] bytes = fileBSC.getBytes();

					// Creating the directory to store file
					/*
					String rootPath = System.getProperty("catalina.home");
					File dir = new File("/upload/ejms");
					if (!dir.exists())
						dir.mkdirs();
*/
					// Create the file on server

					String fileNameType = fileBSC.getOriginalFilename();
					String[] parts = fileNameType.split("\\.");
					String fileName = parts[0];
					String fileType = parts[1];
					
					NumberWordConverter.saveImage(fileName, fileBSC , genaraleInfoId);

					String finalFileName = fileName + "-" + genaraleInfoId + "." + fileType;
					//File serverFile = new File(dir.getAbsolutePath() + File.separator + finalFileName);
					filePathBSC = finalFileName;
					//BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
					//stream.write(bytes);
					//stream.close();
					System.out.println("You successfully uploaded file=");

					// Save BSC File Path to Database

					academicDocBSC.setDocPath(filePathBSC);
					academicDocBSC.setAcademicHistory(academicHistoryBscDb);

					commonService.saveOrUpdateModelObjectToDB(academicDocBSC);

				} catch (Exception e) {
					System.out.println("You failed to upload " + " => " + e.getMessage());
				}
			}

		}

		String other_degrees = request.getParameter("other_degrees");

		if (other_degrees != null) {
			OtherDegrees otherDegrees = new OtherDegrees();

			otherDegrees.setDegreeInfos(other_degrees);
			otherDegrees.setCandidateInfo(candidateInfo);
			commonService.saveOrUpdateModelObjectToDB(otherDegrees);

		}

		int jobCount = Integer.parseInt(request.getParameter("job_count"));

		for (int i = 1; i <= jobCount; i++) {

			EmployementHistory employementHistory = new EmployementHistory();

			String company_name = request.getParameter("company_name_" + i);
			String department_name = request.getParameter("department_name_" + i);
			String designation = request.getParameter("designation_" + i);

			int year_of_exp = Integer.parseInt(request.getParameter("year_of_exp_" + i));
			String company_address = request.getParameter("company_address_" + i);
			String district_company = request.getParameter("district_company_" + i);
			String thana_company = request.getParameter("thana_company_" + i);

			District districtCompany = (District) commonService.getAnObjectByAnyUniqueColumn("District", "id",
					district_company);
			Thana thanaCompany = (Thana) commonService.getAnObjectByAnyUniqueColumn("Thana", "id", thana_company);

			employementHistory.setCompanyName(company_name);
			employementHistory.setDepartment(department_name);
			employementHistory.setDesignation(designation);
			employementHistory.setYearOfExp(year_of_exp);
			employementHistory.setAddress(company_address);
			employementHistory.setDistrict(districtCompany);
			employementHistory.setThana(thanaCompany);
			employementHistory.setCandidateInfo(candidateInfo);

			Integer employementHistoryid = commonService.saveWithReturnId(employementHistory);

			EmployementHistory employementHistoryDB = (EmployementHistory) commonService
					.getAnObjectByAnyUniqueColumn("EmployementHistory", "id", employementHistoryid.toString());

			List<MultipartFile> files = ((DefaultMultipartHttpServletRequest) request)
					.getFiles("files_for_company_" + i);
			List<String> fileNames = new ArrayList<String>();

			if (null != files && files.size() > 0) {
				for (MultipartFile multipartFile : files) {

					EmploymentDoc employmentDoc = new EmploymentDoc();

					try {
						String filePathCompany = null;
						byte[] bytes = multipartFile.getBytes();

						// Creating the directory to store file
						/*
						String rootPath = System.getProperty("catalina.home");
						File dir = new File("/upload/ejms");
						if (!dir.exists())
							dir.mkdirs();
*/
						// Create the file on server

						String fileNameType = multipartFile.getOriginalFilename();
						String[] parts = fileNameType.split("\\.");
						String fileName = parts[0];
						String fileType = parts[1];
						
						NumberWordConverter.saveImage(fileName, multipartFile , genaraleInfoId);

						String finalFileName = fileName + "-" + genaraleInfoId + "." + fileType;
						//File serverFile = new File(dir.getAbsolutePath() + File.separator + finalFileName);
						filePathCompany = finalFileName;
						//BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
						//stream.write(bytes);
						//stream.close();
						System.out.println("You successfully uploaded file=");

						// Save COMPANY File Path to Database

						employmentDoc.setDocPath(filePathCompany);

						employmentDoc.setEmployementHistory(employementHistoryDB);

						commonService.saveOrUpdateModelObjectToDB(employmentDoc);

					} catch (Exception e) {
						System.out.println("You failed to upload " + " => " + e.getMessage());
					}

				}
			}

		}

		return new ModelAndView("redirect:/deparmentList");
	}

}
