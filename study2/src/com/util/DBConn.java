package com.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConn {
	private static Connection conn = null;
	
	private DBConn() {
		
	}
	
	public static Connection getConnection() {
		String url = "jdbc:oracle:thin:@211.238.142.180:1521:xe";
		String user = "sky";
		String pwd = "java$!";
		
		if(conn == null) {
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				conn = DriverManager.getConnection(url, user, pwd);
			} catch (Exception e) {
				// log
				System.out.println(e.toString());
			}
		}
		
		return conn;
	}
	
	public static void close() {
		if(conn != null) {
			try {
				if(!conn.isClosed()) { // ���������� �ݾƶ�
					conn.close();
				}
			} catch (Exception e) {
				System.out.println(e.toString());
			}
		}
		
		conn = null;
	}
}
