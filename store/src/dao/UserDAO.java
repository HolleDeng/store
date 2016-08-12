package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

import user.User;
import dbc.DataBaseConnection;

public class UserDAO {

	private Connection conn = null;
	private DataBaseConnection dbc = null;
	private String msg;

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public UserDAO() {
		try {
			this.dbc = new DataBaseConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		this.conn = dbc.getConnection();
	}

	/**
	 * 添加注册用户的信息
	 * @param user
	 * @return
	 */
	public boolean doManagerInsert(User user) {
		boolean flag = false;
		PreparedStatement pstmt = null;
		String sql = "insert into user values(?,?,?,?,?,?,?,?)";
		user.setRole("开店用户");
		if (this.findById(user.getUserid()) == null) {
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, user.getUserid());
				pstmt.setString(2, user.getUsername());
				pstmt.setString(3, user.getPassword());
				pstmt.setString(4, user.getRePassword());
				pstmt.setString(5, user.getRole());
				pstmt.setString(6, user.getLastdate());
				pstmt.setInt(7, user.getLoginNum());
				pstmt.setString(8, user.getSecurity());
				if (pstmt.executeUpdate() > 0) {
					flag = true;
					this.setMsg("恭喜！开店用户" + user.getUsername() + "注册成功！");
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					pstmt.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
		} else {
			this.setMsg("开店用户注册失败！原因是：该ID已经存在！请重新输入！");
		}

		return flag;
	}

	/**
	 * 添加注册普通消费用户
	 * @param user
	 * @return
	 */
	public boolean doNormalInsert(User user) {
		boolean flag = false;
		PreparedStatement pstmt = null;
		String sql = "insert into user values(?,?,?,?,?,?,?,?)";
		user.setRole("普通消费用户");
		if (this.findById(user.getUserid()) == null) {
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, user.getUserid());
				pstmt.setString(2, user.getUsername());
				pstmt.setString(3, user.getPassword());
				pstmt.setString(4, user.getRePassword());
				pstmt.setString(5, user.getRole());
				pstmt.setString(6, user.getLastdate());
				pstmt.setInt(7, user.getLoginNum());
				pstmt.setString(8, user.getSecurity());
				if (pstmt.executeUpdate() > 0) {
					flag = true;
					this.setMsg("恭喜！普通消费用户" + user.getUsername() + "注册成功！");
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					pstmt.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
		} else {

			this.setMsg("普通消费用户注册失败！原因是：该ID已经存在！请重新输入！");
		}

		return flag;
	}

	/**
	 * 通过用户的id查找用户
	 * @param userid
	 * @return
	 */
	public User findById(String userid) {
		User user = null;
		PreparedStatement pstmt = null;
		String sql = "select * from user where userid=?";
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				user = new User();
				user.setUserid(rs.getString("userid"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setRole(rs.getString("role"));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				rs.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		return user;
	}

	/**
	 * 查找的登录的用户是否合法
	 * @param user
	 * @return
	 */
	public boolean findLogin(User user) {
		boolean flag = false;
		PreparedStatement pstmt = null;
		String sql = "select * from user where userid=? and password=? and role=?";
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUserid());
			pstmt.setString(2, user.getPassword());
			pstmt.setString(3, user.getRole());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				flag = true;
				this.setMsg(rs.getString("role") + rs.getString("username")
						+ "登录成功！");
			} else {
				this.setMsg("登录失败！您输入的信息有误！请重新输入！");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return flag;
	}

	/**
	 * 退出保持用户的退出时间
	 * @param userid
	 * @return
	 */
	public boolean saveLastdate(String userid) {
		Date current = new Date();
		java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
				"yyyy-MM-dd HH:mm:ss");
		String time = sdf.format(current);
		boolean flag = false;
		PreparedStatement pstmt = null;
		String sql = "update user set lastdate=? where userid=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(2, userid);
			pstmt.setString(1, time);
			if (pstmt.executeUpdate() > 0) {
				flag = true;
				this.setMsg("最后一次登陆日期保存成功！");
			} else {
				this.setMsg("最后一次登陆日期保存失败！");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		return flag;
	}

	/**
	 * 通过用户的id进行查找器上次登录的时间
	 * @param userid
	 * @return
	 */
	public String findLastdate(String userid) {
		User user = null;
		PreparedStatement pstmt = null;
		String sql = "select * from user where userid=?";
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				user = new User();
				user.setLastdate(rs.getString("lastdate"));
			} else {
				return null;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				rs.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		return user.getLastdate();
	
	}
	
	/**
	 *查找用户的登录数量 
	 * @param userid
	 * @return
	 */
	public int findLoginNum(String userid) {
		int loginNum = 0;
		PreparedStatement pstmt = null;
		String sql = "select loginNum from user where userid=?";
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				loginNum = rs.getInt(1) + 1;
			} 
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				rs.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		return loginNum;
	}
	
	public boolean saveLoginNum(String userid) {
		boolean flag = false;
		int loginNum = this.findLoginNum(userid);
		PreparedStatement pstmt = null;
		String sql = "update user set loginNum=? where userid=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(2, userid);
			pstmt.setInt(1, loginNum);
			if (pstmt.executeUpdate() > 0) {
				flag = true;
				this.setMsg("登录次数保存成功！");
			} else {
				this.setMsg("登陆次数保存失败！");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		return flag;
	}
	
	/**
	 * 保存用户的密保信息
	 * @param userid
	 * @param security
	 * @return
	 */
	public boolean saveSecurity(String userid, String security) {
		boolean flag = false;
		PreparedStatement pstmt = null;
		String sql = "update user set security=? where userid=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(2, userid);
			pstmt.setString(1, security);
			if (pstmt.executeUpdate() > 0) {
				flag = true;
				this.setMsg("密保保存成功！");
			} else {
				this.setMsg("密保保存失败！");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		return flag;
	}
	
	/**
	 *验证电话是否合法
	 * @param sectionNo
	 * @param telNo
	 * @return
	 */
	public boolean findTel(String sectionNo, String telNo){
		
		boolean result1 = sectionNo.matches("[0-9]+");
		boolean result2 = telNo.matches("[0-9]+");
		
		if ((result1 == true) && (result2 == true)) {
			return true;
		} else {
			this.setMsg("区号或者号码不是纯数字！请重新输入！");
			return false;
		}
	}
	
	/**
	 * 通过用户的id进行查找密保信息
	 * @param userid
	 * @return
	 */
	public String findSecurity(String userid) {
		PreparedStatement pstmt = null;
		String sql = "select security from user where userid=?";
		String security = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				security = rs.getString(1);
			}else{
				return null;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				rs.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		return security;
	}
	
	/**
	 * 修改用户的密码
	 * @param userid
	 * @param password
	 * @param rePassword
	 * @return
	 */
	public boolean doPassword(String userid, String password, String rePassword) {
		boolean flag = false;
		PreparedStatement pstmt = null;
		String sql = "update user set password=?,rePassword=? where userid=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(3, userid);
			pstmt.setString(1, password);
			pstmt.setString(2, rePassword);
			if (pstmt.executeUpdate() > 0) {
				flag = true;
				this.setMsg("密码修改成功！");
			} else {
				this.setMsg("密码修改失败！");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		return flag;
	}
}
