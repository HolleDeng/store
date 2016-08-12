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
	 * ���ע���û�����Ϣ
	 * @param user
	 * @return
	 */
	public boolean doManagerInsert(User user) {
		boolean flag = false;
		PreparedStatement pstmt = null;
		String sql = "insert into user values(?,?,?,?,?,?,?,?)";
		user.setRole("�����û�");
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
					this.setMsg("��ϲ�������û�" + user.getUsername() + "ע��ɹ���");
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
			this.setMsg("�����û�ע��ʧ�ܣ�ԭ���ǣ���ID�Ѿ����ڣ����������룡");
		}

		return flag;
	}

	/**
	 * ���ע����ͨ�����û�
	 * @param user
	 * @return
	 */
	public boolean doNormalInsert(User user) {
		boolean flag = false;
		PreparedStatement pstmt = null;
		String sql = "insert into user values(?,?,?,?,?,?,?,?)";
		user.setRole("��ͨ�����û�");
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
					this.setMsg("��ϲ����ͨ�����û�" + user.getUsername() + "ע��ɹ���");
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

			this.setMsg("��ͨ�����û�ע��ʧ�ܣ�ԭ���ǣ���ID�Ѿ����ڣ����������룡");
		}

		return flag;
	}

	/**
	 * ͨ���û���id�����û�
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
	 * ���ҵĵ�¼���û��Ƿ�Ϸ�
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
						+ "��¼�ɹ���");
			} else {
				this.setMsg("��¼ʧ�ܣ����������Ϣ�������������룡");
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
	 * �˳������û����˳�ʱ��
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
				this.setMsg("���һ�ε�½���ڱ���ɹ���");
			} else {
				this.setMsg("���һ�ε�½���ڱ���ʧ�ܣ�");
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
	 * ͨ���û���id���в������ϴε�¼��ʱ��
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
	 *�����û��ĵ�¼���� 
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
				this.setMsg("��¼��������ɹ���");
			} else {
				this.setMsg("��½��������ʧ�ܣ�");
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
	 * �����û����ܱ���Ϣ
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
				this.setMsg("�ܱ�����ɹ���");
			} else {
				this.setMsg("�ܱ�����ʧ�ܣ�");
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
	 *��֤�绰�Ƿ�Ϸ�
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
			this.setMsg("���Ż��ߺ��벻�Ǵ����֣����������룡");
			return false;
		}
	}
	
	/**
	 * ͨ���û���id���в����ܱ���Ϣ
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
	 * �޸��û�������
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
				this.setMsg("�����޸ĳɹ���");
			} else {
				this.setMsg("�����޸�ʧ�ܣ�");
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
