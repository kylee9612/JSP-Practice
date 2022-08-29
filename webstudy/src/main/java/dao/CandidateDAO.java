package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import db.DBManager;
import model.CandidateDTO;

public class CandidateDAO {
	private static CandidateDAO instance = new CandidateDAO();
	
	private CandidateDAO() {
		
	}
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public static CandidateDAO getInstance() {
		return instance;
	}
	
	public ArrayList<CandidateDTO> getCandidateList(){
		ArrayList<CandidateDTO> list = new ArrayList<>();
		try {
			conn = DBManager.getConnection();
			String sql = "select * from TBL_MEMBER";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				char number = rs.getString(1).charAt(0);
				String name = rs.getString(2);
				String code = rs.getString(3);
				char school = rs.getString(4).charAt(0);
				String jumin = rs.getString(5);
				jumin = jumin.substring(0,6)+"-"+jumin.substring(6);
				String city = rs.getString(6);
				
				sql = "select count(*) from TBL_VOTE where m_no = '"+number+"'";
				pstmt = conn.prepareStatement(sql);
				ResultSet temprs1 = pstmt.executeQuery();
				int vote = 0;
				if(temprs1.next()) {
					vote = temprs1.getInt(1);
				}
				
				String party = "";
				sql = "select p_tel1, p_tel2, p_tel3,p_name from TBL_PARTY where p_code = '"+code+"'";
				pstmt = conn.prepareStatement(sql);
				ResultSet temprs2 = pstmt.executeQuery();
				String mobile = "";
				if(temprs2.next()) {
					party = temprs2.getString(4);
					mobile = temprs2.getString(1)+"-"+temprs2.getString(2)+"-"+temprs2.getString(3);
				}
				
				CandidateDTO cand = new CandidateDTO(number, name, code, school, jumin, city, vote, mobile,party);
				list.add(cand);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		closeAll();
		return list;
	}
	
	private void closeAll() {
		closeConnection();
		closePstmt();
		closeRs();
	}
	
	private void closeConnection() {
		try {
			if(!conn.isClosed())
				conn.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	private void closePstmt() {
		try {
			if(!pstmt.isClosed())
				pstmt.close();
		}catch (Exception e) {
			// TODO: handle exception
		}
	}
	private void closeRs() {
		try {
			if(!rs.isClosed())
				rs.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
