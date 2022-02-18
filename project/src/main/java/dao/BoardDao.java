package dao;

import java.util.ArrayList;

import dto.Board;

public class BoardDao extends DB {

	public BoardDao() {
		super();
	}

	public static BoardDao boarddao = new BoardDao();

	public static BoardDao getBoardDao() {
		return boarddao;
	}
	
	


	public boolean boardwrite(Board board) {

		String sql = "insert into board( b_title , b_contents , b_pw , b_writer) values(?,?,?,?)";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, board.getB_title());
			ps.setString(2, board.getB_contents());
			ps.setString(3, board.getB_pw());
			ps.setString(4, board.getB_writer());
			ps.executeUpdate();
			return true;
		} catch (Exception e) {
			System.out.println(e);
		}
		return false;

	}

	// 寃뚯떆臾쇰쾲�샇�쓽 �빐�떦 寃뚯떆臾� 媛��졇�삤湲�
	public Board getboard(int b_num) {
		String sql = "select * from board where b_num=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, b_num);
			rs = ps.executeQuery();
			if (rs.next()) {
				Board board = new Board(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getString(6), rs.getInt(7));
				return board;
			}
		} catch (Exception e) {
		}
		return null;

	}


	// 寃뚯떆臾� �궘�젣 硫붿냼�뱶
	public boolean boarddelete(int b_num) {
		String sql = "delete from board where b_num =?";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, b_num);
			ps.executeUpdate();
			return true;
		} catch (Exception e) {
		}
		return false;
	}

	// 寃뚯떆臾� �닔�젙 硫붿냼�뱶
	public boolean boardupdate(Board board) {
		String sql = "update board set b_title=? , b_contents=? where b_num = ?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, board.getB_title());
			ps.setString(2, board.getB_contents());
			ps.setInt(3, board.getB_num());
			ps.executeUpdate();
			return true;
		} catch (Exception e) {
		}
		return false;
	}

	// 紐⑤뱺 寃뚯떆臾� 異쒕젰
	public ArrayList<Board> boardlist() {

		ArrayList<Board> boards = new ArrayList<Board>();
		String sql = "select * from board order by b_num DESC ";

		try {
			ps = con.prepareStatement(sql);

			rs = ps.executeQuery();
			while (rs.next()) {

				Board board = new Board(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getString(6), rs.getInt(7));
				boards.add(board);
			}
			return boards;
		} catch (Exception e) {
		}
		return null;
	}

	// 寃뚯떆臾� 珥� 媛쒖닔 諛섑솚 硫붿냼�뱶
	public int boardcount() {
		String sql = "select count(*) from board";

		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
		}
		return 0;
	}

}
