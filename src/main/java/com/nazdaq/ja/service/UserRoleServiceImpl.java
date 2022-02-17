package com.nazdaq.ja.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nazdaq.ja.dao.UserRoleDao;
import com.nazdaq.ja.model.UserRole;

/**
 * @author nasrin.akter
 *
 */
@Service("userRoleService")
public class UserRoleServiceImpl implements UserRoleService {

	@Autowired
	private UserRoleDao userRoleDao;

	public void addUserRole(UserRole userRole) {
		userRoleDao.addUserRole(userRole);
	}

	public List<UserRole> listUserRole() {
		return userRoleDao.listUserRole();
	}

	public UserRole getUserRole(int userRoleId) {
		return userRoleDao.getUserRole(userRoleId);
	}

	public void deleteUserRole(UserRole userRole) {
		userRoleDao.deleteUserRole(userRole);
	}

	public List<String> getUserRoleName() {
		return userRoleDao.getUserRoleName();
	}

}
