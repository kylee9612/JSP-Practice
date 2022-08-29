package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import db.DBManager;
import model.VoteDTO;

public class VoteDAO {
	private static VoteDAO instance = new VoteDAO();
	
	private VoteDAO() {
		
	}
	
	public ArrayList<VoteDTO> getVoteList(){
		ArrayList<VoteDTO> list = new ArrayList<>();
		String sql = "select * from TBL_VOTE";
		try {
			Connection conn = DBManager.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				String jumin = rs.getString(1);
				String name = rs.getString(2);
				char no = rs.getString(3).charAt(0);
				String time = rs.getString(4);
				String area = rs.getString(5);
				char confirm = rs.getString(6).charAt(0);
				VoteDTO vote = new VoteDTO(jumin, name, no, time, area, confirm);
				list.add(vote);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public void addNewVote(String jumin, String name, char no, String time, String area, char confirm) {
		VoteDTO vote = new VoteDTO(jumin,name,no,time,area,confirm);
		String sql = String.format("insert into TBL_VOTE values('%s','%s','%c','%s','%s','%c')",jumin,name,no,time,area,confirm);
		try {
			Connection conn = DBManager.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.execute();
		}catch(Exception e) {
			
		}
	}
	
	public static VoteDAO getInstance() {
		return instance;
	}
}
