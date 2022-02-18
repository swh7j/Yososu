package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DB {
	// 1. 鍮뚮뱶=> �씪�씠釉뚮윭由� 異붽�
	// 2. �봽濡쒖젥�듃 �궡 web-inf=> lib=> �씪�씠釉뚮윭由� 異붽�
	
	// 1. �옄二� �궗�슜�븯�뒗 �씤�꽣�럹�씠�뒪
	protected Connection con;
	protected ResultSet rs;
	protected PreparedStatement ps;
	
	// 2. �깮�꽦�옄
	public DB() {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3307/project?serverTimezone=UTC","root","1234");
			System.out.println("[�뿰�룞�꽦怨�]");
		} catch (Exception e) {
			System.out.println("[�뿰�룞�떎�뙣]"+e);
		}
		
	} 
	
	
}
