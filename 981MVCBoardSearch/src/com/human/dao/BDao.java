package com.human.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.human.dto.BDto;
import com.human.util.DBConn;

public class BDao {
	public ArrayList<BDto> select() {
		ArrayList<BDto> dtos = new ArrayList<>();

		Connection con = DBConn.getConnection();
		String sql = "select * from mvc_board order by bGroup desc, bStep asc";
		Statement st = null;
		ResultSet rs = null;

		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				dtos.add(new BDto(rs.getInt("bId"), rs.getString("bName"), rs.getString("bTitle"),
						rs.getString("bContent"), rs.getInt("bHit"), rs.getInt("bGroup"), rs.getInt("bStep"),
						rs.getInt("bIndent"), rs.getTimestamp("bDate")));
			}
			DBConn.close(st, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dtos;
	}

	public int insert(String bName, String bTitle, String bContent) {
		int returnValue = 0;
		Connection con = DBConn.getConnection();
		Statement st = null;

		try {
			st = con.createStatement();
			String sql = "INSERT INTO MVC_BOARD(bId, bName, bTitle, bContent, bGroup, bIndent, bDate,bStep"
					+ "VALUES('PARK1',13,124.2,SYSDATE)";
			sql = String.format("INSERT INTO MVC_BOARD(bId, bName, bTitle, bContent, bGroup, bIndent ,bStep,bDate) "
					+ "VALUES(mvc_board_seq.nextval,'" + bName + "','" + bTitle + "','" + bContent + "',"
					+ "mvc_board_seq.currval,0,0,sysdate)");

			System.out.println(sql);
			returnValue = st.executeUpdate(sql);
			DBConn.close(st);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return returnValue;
	}

	public BDto select(String bId) {
		updateHit(bId);// ��ȸ�� ���� �޼ҵ�
		BDto dto = null;
		Connection con = DBConn.getConnection();
		String sql = String.format("select * from mvc_board " + "where bId=%s "// '%s'�ƴ�
				+ "order by bGroup desc, bStep asc", bId);
		Statement st = null;
		ResultSet rs = null;

		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				dto = new BDto(rs.getInt("bId"), rs.getString("bName"), rs.getString("bTitle"),
						rs.getString("bContent"), rs.getInt("bHit"), rs.getInt("bGroup"), rs.getInt("bStep"),
						rs.getInt("bIndent"), rs.getTimestamp("bDate"));
			}
			DBConn.close(st, rs);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dto;
	}

	private void updateHit(String bId) {
		Connection con = DBConn.getConnection();
		Statement st = null;

		try {
			st = con.createStatement();
			String sql = null;
			sql = String.format("update MVC_BOARD " + "set bHit=bHit+1 " + "where bId=%s", bId);

			System.out.println(sql);
			st.executeUpdate(sql);
			DBConn.close(st);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public int delete(String bId) {
		int returnValue = 0;
		Connection con = DBConn.getConnection();
		Statement st = null;

		try {
			st = con.createStatement();
			String sql = "INSERT INTO MVC_BOARD(bId, bName, bTitle, bContent, bGroup, bIndent, bDate,bStep"
					+ "VALUES('PARK1',13,124.2,SYSDATE)";
			sql = String.format("delete MVC_BOARD where bId=%s", bId);

			System.out.println(sql);
			returnValue = st.executeUpdate(sql);
			DBConn.close(st);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return returnValue;

	}

	public void update(String bId, String bTitle, String bContent) {
		Connection con = DBConn.getConnection();
		Statement st = null;

		try {
			st = con.createStatement();
			String sql = null;
			sql = String.format("update MVC_BOARD " + "set bTitle='%s', bContent='%s' " + "where bId=%s", bTitle,
					bContent, bId);

			System.out.println(sql);
			st.executeUpdate(sql);
			DBConn.close(st);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void reply(String bId, String bGroup, String bIndent, String bStep, String bName, String bTitle,
			String bContent) {
		// ���� Group�� �ڱ⺸�� ū Step�� �ϳ��� ����
		replyShape(bGroup, bStep);
		Connection con = DBConn.getConnection();
		Statement st = null;

		try {
			st = con.createStatement();
			String sql = null;
			sql = String.format("INSERT INTO MVC_BOARD(bId, bName, bTitle, bContent, bGroup,bStep, bIndent ,bDate) "
					+ "VALUES(mvc_board_seq.nextval,'" + bName + "','" + bTitle + "','" + bContent + "',"
					+ "%s,%d,%d,sysdate)", bGroup, Integer.parseInt(bStep) + 1, Integer.parseInt(bIndent) + 1);
			// %d���� bGroup
			System.out.println(sql);
			st.executeUpdate(sql);
			DBConn.close(st);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	private void replyShape(String bGroup, String bStep) {
		// bGroup�߿��� bStep���� ū �����͵�(����������)�� �ϳ��� ������Ų��
		Connection con = DBConn.getConnection();
		PreparedStatement ps = null;

		try {

			String sql = null;
			sql = "update MVC_BOARD " + "set bStep=(bStep+1) " + "where bGroup=? and bStep>?";

			System.out.println(sql);
			ps = con.prepareStatement(sql);
			ps.setInt(1, Integer.parseInt(bGroup));
			ps.setInt(2, Integer.parseInt(bStep));
			ps.executeUpdate();
			DBConn.close(ps);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public ArrayList<BDto> select(String page, String pageDataCount) {
		ArrayList<BDto> dtos = new ArrayList<>();
		Connection con = DBConn.getConnection();

		String sql = String.format(
				
				"select * from(" 
				+ "select rownum m, sub.* "
				+ "from (select * from mvc_board "
				+ "order by bgroup desc, bStep asc) sub "
				+ "where rownum <= %s*%s) " + "where m>=(%s-1)*%s+1",
				page, pageDataCount, page, pageDataCount);

//				"select * "
//				+ "from (select rownum m,bId,bName,bTitle,bContent,bHit,bGroup,bStep,bIndent,bDate "
//				+ "from mvc_board "
//				+ "where rownum <= %s*%s "
//				+ "order by bGroup desc, bStep asc) "
//				+ "where m>=(%s-1)*%s+1",page,pageDataCount,page,pageDataCount);
		
		Statement st = null;
		ResultSet rs = null;

		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				dtos.add(new BDto(rs.getInt("bId"), rs.getString("bName"), rs.getString("bTitle"),
						rs.getString("bContent"), rs.getInt("bHit"), rs.getInt("bGroup"), rs.getInt("bStep"),
						rs.getInt("bIndent"), rs.getTimestamp("bDate")));
			}
			DBConn.close(st, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dtos;
	}

	public int dataCount() {
		int returnValue = 0;
		Connection con = DBConn.getConnection();
		String sql = String.format("select count(bId) bCount from mvc_board");
		Statement st = null;
		ResultSet rs = null;

		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				returnValue = rs.getInt("bCount");
			}
			DBConn.close(st, rs);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return returnValue;
	}

	public ArrayList<BDto> searchSelect(String page, String pageDataCount, String searchCol, String searchVal) {
		ArrayList<BDto> dtos = new ArrayList<>();
		Connection con = DBConn.getConnection();

//		String sql=String.format("select * "
//				+ "from (select rownum m,bId,bName,bTitle,bContent,bHit,bGroup,bStep,bIndent,bDate "
//				+ "from mvc_board "
//				+ "where rownum <= %s*%s and %s like '%%%s%%'"
//				+ "order by bGroup desc, bStep asc) "
//				+ "where m>=(%s-1)*%s+1",page,pageDataCount,searchCol,searchVal,page,pageDataCount);

		String sql = String.format("select * from (select rownum m, sub.*" 
				+ "from (select * from mvc_board "
				+ "order by bgroup desc, bStep asc) sub "
				+ "where rownum <=%s*%s and %s like '%%%s%%' "
				+ "order by bGroup desc, bStep asc) " 
				+ "where m>=(%s-1)*%s+1",page, pageDataCount, searchCol, searchVal, page, pageDataCount);

		Statement st = null;
		ResultSet rs = null;

		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				dtos.add(new BDto(rs.getInt("bId"), rs.getString("bName"), rs.getString("bTitle"),
						rs.getString("bContent"), rs.getInt("bHit"), rs.getInt("bGroup"), rs.getInt("bStep"),
						rs.getInt("bIndent"), rs.getTimestamp("bDate")));
			}
			DBConn.close(st, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dtos;
	}

	public int dataCount(String searchCol, String searchVal) {
		int returnValue = 0;
		Connection con = DBConn.getConnection();
		String sql = String.format("select count(bId) bCount from mvc_board " + "where %s like '%%%s%%'", searchCol,
				searchVal);
		Statement st = null;
		ResultSet rs = null;

		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				returnValue = rs.getInt("bCount");
			}
			DBConn.close(st, rs);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return returnValue;
	}
//	public int update(BDto dto) {
//		int returnValue=0;
//		Connection con=DBConn.getConnection();
//		Statement st=null;
//		
//		try {
//			st=con.createStatement();
//			String sql="INSERT INTO HUMAN "
//			+"VALUES('PARK1',13,124.2,SYSDATE)";
//			sql=String.format(
//					"update human set age=%d, tall=%f where name='%s'"
//					,dto.getAge(), dto.getTall(), dto.getName());
//			System.out.println(sql);
//			returnValue=st.executeUpdate(sql);
//			DBConn.close(st);
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		return returnValue;
//		
//	}
//	
//	public int delete(String name) {
//		int returnValue=0;
//		Connection con=DBConn.getConnection();
//		Statement st=null;
//		
//		try {
//			st=con.createStatement();
//			String sql="INSERT INTO HUMAN "
//			+"VALUES('PARK1',13,124.2,SYSDATE)";
//			sql=String.format(
//					"delete human where name='%s'"
//					,name);
//			System.out.println(sql);
//			returnValue=st.executeUpdate(sql);
//			DBConn.close(st);
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		return returnValue;
//	}
//	

}
