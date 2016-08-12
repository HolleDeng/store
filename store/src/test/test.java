package test;

import java.sql.Connection;

import dbc.DataBaseConnection;

public class test {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		Connection conn = null;
		DataBaseConnection dbc = null;
		String msg;
		try {
			 dbc = new DataBaseConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		   conn = dbc.getConnection();
		   System.out.println("conn "+conn);
	}

}
