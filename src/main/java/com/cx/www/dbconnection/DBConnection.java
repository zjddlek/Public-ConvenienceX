package com.cx.www.dbconnection;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBConnection {
	public static Connection getConnection() {
		Context initCtx;
		Connection conn = null;
		try {

			initCtx = new InitialContext();
			Context ctx = (Context) initCtx.lookup("java:comp/env");

			// ()안에 context.xml ---> ResourceLink의 name적기
			DataSource ds = (DataSource) ctx.lookup("mysql");

			conn = ds.getConnection();
			// System.out.println("DBConnection conn : " + conn);

		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return conn;
	}

}
