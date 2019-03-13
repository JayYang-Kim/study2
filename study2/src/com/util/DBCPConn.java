package com.util;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBCPConn {
	private static DataSource ds = null;
	
	private DBCPConn() {
		
	}
	
	public static Connection getConnection() {
		Connection conn = null;
		
		try {
			if(ds == null) {
				// Context.xml ������ ������ �о� Context ��ü ����
				Context context = new InitialContext();
				
				// �̸��� ���ε��� ��ü�� ã�� ��ȯ
				Context ctx = (Context)context.lookup("java:/comp/env");
				ds = (DataSource)ctx.lookup("jdbc/myoracle");
				
				//ds = (DataSource)context.lookup("java:/comp/env/jdbc/myoracle");
			}
			
			conn = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return conn;
	}
	
	public static void close(Connection conn) {
		if(conn == null) {
			return;
		}
		
		try {
			if(!conn.isClosed()) {
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		conn = null;
	}
}
