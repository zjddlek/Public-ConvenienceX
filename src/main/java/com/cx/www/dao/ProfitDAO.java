package com.cx.www.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.cx.www.dbconnection.DBConnection;

public class ProfitDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private StringBuffer sb = new StringBuffer();

	public ProfitDAO() {
		conn = DBConnection.getConnection();
	}
}
