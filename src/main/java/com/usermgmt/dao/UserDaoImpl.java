package com.usermgmt.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.usermgmt.form.RegistrationForm;
import com.usermgmt.model.User;

@Repository
public class UserDaoImpl {

	public final String URL = "jdbc:mysql://localhost:3306/usermgmt";

	public List<User> getAllUsers() {
		PreparedStatement stmt = null;
		Connection connection = null;
		List<User> userList = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String query = "select * from user where status = 'ACTIVE' order by id desc";
			connection = DriverManager.getConnection(URL, "root", "root");
			stmt = connection.prepareStatement(query);
			ResultSet result = stmt.executeQuery();
			userList = new ArrayList<User>();
			while (result.next()) {
				User user = new User();
				user.setId(result.getInt("id"));
				user.setFirstName(result.getString("first_name"));
				user.setLastName(result.getString("last_name"));
				user.setEmail(result.getString("email"));
				user.setMiddleName(result.getString("middle_name"));
				user.setPassword(result.getString("password"));
				user.setRole(result.getString("role"));
				userList.add(user);
			}

		} catch (Exception e) {
			System.out.println("exception");
		} finally {
			try {
				stmt.close();
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
		return userList;
	}

	public void saveUser(RegistrationForm form, User loggedInUser) {
		Connection connection = null;
		PreparedStatement stmt = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(URL, "root", "root");
			String query = "insert into user (first_name, last_name, middle_name, email, password, security_ans1, security_ans2, role, status) VALUES (?,?,?,?,?,?,?,?,?)";
			stmt = connection.prepareStatement(query);
			stmt.setString(1, form.getFname());
			stmt.setString(2, form.getLname());
			stmt.setString(3, form.getMname());
			stmt.setString(4, form.getEmail());
			stmt.setString(5, form.getPass1());
			stmt.setString(6, form.getAns1());
			stmt.setString(7, form.getAns2());
			if (loggedInUser != null && null != loggedInUser.getRole()
					&& loggedInUser.getRole().equalsIgnoreCase("ADMIN")) {
				stmt.setString(8, form.getRole());
			} else {
				stmt.setString(8, "CLIENT");
			}
			stmt.setString(9, "ACTIVE");
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				stmt.close();
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public User findByEmailAndPassword(String email, String password) {
		User user = new User();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection myConn = DriverManager.getConnection(URL, "root", "root");
			PreparedStatement stmt = myConn.prepareStatement("select * from user where email = ? and password = ? and status = 'ACTIVE'");
			stmt.setString(1, email);
			stmt.setString(2, password);

			ResultSet result = stmt.executeQuery();
			while (result.next()) {
				user.setId(result.getInt("id"));
				user.setFirstName(result.getString("first_name"));
				user.setLastName(result.getString("last_name"));
				user.setEmail(result.getString("email"));
				user.setMiddleName(result.getString("middle_name"));
				user.setPassword(result.getString("password"));
				user.setRole(result.getString("role"));
				user.setAns1(result.getString("security_ans1"));
				user.setAns2(result.getString("security_ans2"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}

	public User findByEmail(String email) {
		User user = new User();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection myConn = DriverManager.getConnection(URL, "root", "root");
			PreparedStatement stmt = myConn.prepareStatement("select * from user where email = ? AND status = 'ACTIVE' ");
			stmt.setString(1, email);

			ResultSet result = stmt.executeQuery();
			while (result.next()) {
				user.setId(result.getInt("id"));
				user.setFirstName(result.getString("first_name"));
				user.setLastName(result.getString("last_name"));
				user.setEmail(result.getString("email"));
				user.setMiddleName(result.getString("middle_name"));
				user.setPassword(result.getString("password"));
				user.setRole(result.getString("role"));
				user.setAns1(result.getString("security_ans1"));
				user.setAns2(result.getString("security_ans2"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}

	public void updatePassword(String newPassword, String email) throws SQLException {
		PreparedStatement stmt = null;
		Connection myConn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			myConn = DriverManager.getConnection(URL, "root", "root");
			stmt = myConn.prepareStatement("update user set password = ? where email = ? ");
			stmt.setString(1, newPassword);
			stmt.setString(2, email);
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			stmt.close();
			myConn.close();
		}
	}

	public void deleteUser(Integer deleteUserId) throws SQLException {
		PreparedStatement stmt = null;
		Connection myConn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			myConn = DriverManager.getConnection(URL, "root", "root");
			stmt = myConn.prepareStatement("update user set status = 'DELETED' where id= ? ");
			stmt.setInt(1, deleteUserId);
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			stmt.close();
			myConn.close();
		}
	}

	public void updateUser(String firstName, String lastName, String middleName, String email, String ans1, String ans2,
			Integer id) throws SQLException {
		PreparedStatement stmt = null;
		Connection myConn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			myConn = DriverManager.getConnection(URL, "root", "root");
			stmt = myConn.prepareStatement(
					"update user set first_name = ?, last_name = ?, middle_name = ?, email = ?, security_ans1 = ?, security_ans2 = ? where id = ?");
			stmt.setString(1, firstName);
			stmt.setString(2, lastName);
			stmt.setString(3, middleName);
			stmt.setString(4, email);
			stmt.setString(5, ans1);
			stmt.setString(6, ans2);
			stmt.setInt(7, id);
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			stmt.close();
			myConn.close();
		}

	}
	
	public User findById(Integer id) {
		User user = new User();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection myConn = DriverManager.getConnection(URL, "root", "root");
			PreparedStatement stmt = myConn.prepareStatement("select * from user where id = ? ");
			stmt.setInt(1, id);

			ResultSet result = stmt.executeQuery();
			while (result.next()) {
				user.setId(result.getInt("id"));
				user.setFirstName(result.getString("first_name"));
				user.setLastName(result.getString("last_name"));
				user.setEmail(result.getString("email"));
				user.setMiddleName(result.getString("middle_name"));
				user.setPassword(result.getString("password"));
				user.setRole(result.getString("role"));
				user.setAns1(result.getString("security_ans1"));
				user.setAns2(result.getString("security_ans2"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}

	public void updateUserInfo(String firstName, String lastName, String middleName, String email, Integer id) throws SQLException {
		PreparedStatement stmt = null;
		Connection myConn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			myConn = DriverManager.getConnection(URL, "root", "root");
			stmt = myConn.prepareStatement(
					"update user set first_name = ?, last_name = ?, middle_name = ?, email = ? where id = ?");
			stmt.setString(1, firstName);
			stmt.setString(2, lastName);
			stmt.setString(3, middleName);
			stmt.setString(4, email);
			stmt.setInt(5, id);
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			stmt.close();
			myConn.close();
		}
	}
}
