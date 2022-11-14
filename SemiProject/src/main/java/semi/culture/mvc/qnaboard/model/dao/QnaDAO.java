package semi.culture.mvc.qnaboard.model.dao;

import static semi.culture.common.jdbc.JDBCTemplate.close;

import static semi.culture.common.jdbc.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import semi.culture.common.util.PageInfo;
import semi.culture.mvc.qnaboard.model.vo.Qna;
import semi.culture.mvc.qnaboard.model.vo.QnaReply;


public class QnaDAO {
	
	
	
	
	
	// 게시물의 갯수를 가져오는 쿼리문
		public int getBoardCount(Connection conn) {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String query = "SELECT COUNT(*) FROM TBL_Question WHERE STATUS='Y'";
			int result = 0;
			try {
				pstmt = conn.prepareStatement(query);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					result = rs.getInt(1);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
				close(rs);
			}
			return result;
		}

		// 게시물의 리스트를 가져오는 메소드
		public List<Qna> findAll(Connection conn, PageInfo pageInfo) {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<Qna> list = new ArrayList<Qna>();
			String query = "SELECT RNUM, NO, TITLE, user_id, CREATE_DATE,  READCOUNT, STATUS  " + "FROM ( "
					+ "    SELECT ROWNUM AS RNUM, NO, TITLE, user_id, CREATE_DATE, READCOUNT, STATUS "
					+ "    FROM ( "
					+ "        SELECT  B.NO, B.TITLE, M.user_id, B.CREATE_DATE, B.READCOUNT, B.STATUS "
					+ "        FROM TBL_Question B JOIN TBL_User M ON(B.WRITER_ID = M.user_id) "
					+ "        WHERE 1 = 1 AND B.STATUS = 'Y' ORDER BY B.NO DESC " + "    ) " + ") " + "WHERE RNUM BETWEEN ? and ?";

		
			try {
				
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, pageInfo.getStartList());
				pstmt.setInt(2, pageInfo.getEndList());
				rs = pstmt.executeQuery();
				while (rs.next()) {
					Qna qna = new Qna();
					qna.setRowNum(rs.getInt("RNUM"));
					qna.setNo(rs.getInt("NO"));
					qna.setTitle(rs.getString("TITLE"));
					qna.setWriter_id(rs.getString("user_id"));
					qna.setCreate_date(rs.getDate("CREATE_DATE"));
					qna.setReadCount(rs.getInt("READCOUNT"));
					qna.setStatus(rs.getString("STATUS"));
					list.add(qna);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
				close(rs);
			}
			return list;
		}

		// 게시물의 갯수를 가져오는 쿼리문
		// searchMap : key=탐색할 컨텐츠, value=키워드
		// - 탐색 가능 컨텐츠 : title, content, writer
		public int getBoardCount(Connection conn, Map<String, String> searchMap) {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String query = "SELECT  COUNT(*) " + "	FROM TBL_Question B " + " JOIN TBL_User M ON(B.WRITER_ID = M.user_id) "
					+ "	WHERE 1=1 " + "	AND B.STATUS = 'Y' ";

			if (searchMap.containsKey("title")) {
				query += "AND B.TITLE LIKE ? ";
			}
			if (searchMap.containsKey("content")) {
				query += "AND B.CONTENT LIKE ? ";
			}
			if (searchMap.containsKey("writer")) {
				query += "AND M.user_id LIKE ? ";
			}

			int result = 0;
			try {
				pstmt = conn.prepareStatement(query);
				int count = 1;

				if (searchMap.containsKey("title")) {
					pstmt.setString(count++, "%" + searchMap.get("title") + "%");
				}
				if (searchMap.containsKey("content")) {
					pstmt.setString(count++, "%" + searchMap.get("content") + "%");
				}
				if (searchMap.containsKey("writer")) {
					pstmt.setString(count++, "%" + searchMap.get("writer") + "%");
				}
				rs = pstmt.executeQuery();
				if (rs.next()) {
					result = rs.getInt(1);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
				close(rs);
			}
			return result;
		}

	
		// 글쓰기 기능
		public int insertBoard(Connection conn, Qna qna) {
			PreparedStatement pstmt = null;
			String query = "INSERT INTO TBL_Question VALUES(SEQ_Que.NEXTVAL,?,?,?,?,DEFAULT,DEFAULT,DEFAULT,DEFAULT)";
			int result = 0;

			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, qna.getWriter_id());
				pstmt.setString(2, qna.getTitle());
				pstmt.setString(3, qna.getContent());
				pstmt.setString(4, "");
				
				result = pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			return result;
		}

		// 상세 게시글을 조회 
		public Qna findBoardByNo(Connection conn, int qnaNo) {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			Qna qna = null;
			String query = "SELECT  B.NO, B.TITLE, M.user_id, B.READCOUNT,  B.CONTENT, B.CREATE_DATE, B.MODIFY_DATE "
					+ "FROM TBL_Question B "
					+ "JOIN TBL_User M ON(B.WRITER_ID = M.user_id) "
					+ "WHERE B.STATUS = 'Y' AND B.NO = ?";
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, qnaNo);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					qna = new Qna();
					qna.setNo(rs.getInt("NO"));
					qna.setTitle(rs.getString("TITLE"));
					qna.setWriter_id(rs.getString("user_id"));
					qna.setReadCount(rs.getInt("READCOUNT"));
					qna.setContent(rs.getString("CONTENT"));
					qna.setCreate_date(rs.getDate("CREATE_DATE"));
					qna.setModify_date(rs.getDate("MODIFY_DATE"));
					qna.setReplies(getRepliesByNo(conn, qnaNo));
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
				close(rs);
			}
			return qna;
		}

		// 게시글 조회수 올려주는 쿼리
		public int updateReadCount(Connection conn, Qna qna) {
			PreparedStatement pstmt = null;
			String query = "UPDATE TBL_Question SET READCOUNT = ? WHERE NO = ?";
			int result = 0;

			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, qna.getReadCount() + 1);
				pstmt.setInt(2, qna.getNo());

				result = pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			return result;
		}

		// 게시글 삭제(실제로는 안보여주기 기능) 를 위한 쿼리
		public int updateStatus(Connection conn, int qnaNo, String status) {
			PreparedStatement pstmt = null;
			String query = "UPDATE TBL_Question SET STATUS = ? WHERE NO = ?";
			int result = 0;

			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, status);
				pstmt.setInt(2, qnaNo);

				result = pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			return result;

		}

		// 게시글 수정
		public int updateBoard(Connection conn, Qna qna) {
			PreparedStatement pstmt = null;
			String query = "UPDATE TBL_Question SET TITLE=?,CONTENT=?,MODIFY_DATE=SYSDATE WHERE NO=?";
			int result = 0;

			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, qna.getTitle());
				pstmt.setString(2, qna.getContent());
				pstmt.setInt(3, qna.getNo());

				result = pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			return result;
		}

		// 리플을 가져오는 메소드
		public List<QnaReply> getRepliesByNo(Connection conn, int qnaNo) {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<QnaReply> list = new ArrayList<QnaReply>();
			String query = "SELECT R.NO, R.BOARD_NO, R.CONTENT, M.user_id, R.CREATE_DATE, R.MODIFY_DATE "
					+ "FROM TBL_QComment R "
					+ "JOIN TBL_User M ON(R.WRITER_ID = M.user_id) "
					+ "WHERE R.STATUS='Y' AND BOARD_NO= ? "
					+ "ORDER BY R.NO DESC";

			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, qnaNo);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					QnaReply reply = new QnaReply();
					reply.setNo(rs.getInt("NO"));
					reply.setBoard_no(rs.getInt("BOARD_NO"));
					reply.setContent(rs.getString("CONTENT"));
					reply.setWriter_id(rs.getString("user_id"));
					reply.setCreate_date(rs.getDate("CREATE_DATE"));
					reply.setModify_date(rs.getDate("MODIFY_DATE"));
					list.add(reply);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
				close(rs);
			}
			return list;

		}

		// 리플 쓰기 기능
		public int insertReply(Connection conn, QnaReply reply) {
			PreparedStatement pstmt = null;
			String query = "INSERT INTO TBL_QComment VALUES(SEQ_QCOMMENT_NO.NEXTVAL, ?, ?, ?, DEFAULT, DEFAULT, DEFAULT)";
			int result = 0;

			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, reply.getBoard_no());
				pstmt.setString(2, reply.getWriter_id());
				pstmt.setString(3, reply.getContent());

				result = pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			return result;
		}

		// 리플 삭제 기능
		public int deleteReply(Connection conn, int replyNo) {
			int result = 0;
			PreparedStatement pstmt = null;
			String query = "DELETE TBL_QComment WHERE NO = ?";
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, replyNo);
				
				result = pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			return result;
		}



public static void main(String[] args) {
	Connection conn = getConnection();
	QnaDAO dao = new QnaDAO();

	// 게시물 갯수
	int count = dao.getBoardCount(conn);
	System.out.println("게시물 갯수 : " + count);
	System.out.println("--------------------------------------------");

//	// 일반 게시판 리스트
	PageInfo info = new PageInfo(1, 10, count, 10);
	List<Qna> list = dao.findAll(conn, info);
	for (Qna b : list) {
		System.out.println(b.toString());
	}
	System.out.println("--------------------------------------------\n");
//
//	
////	// 게시물 갯수- 탐색
//	Map<String, String> searchMap = new HashMap<String, String>();
//	searchMap.put("title", "판매");
//	searchMap.put("content", "아이폰");
//	searchMap.put("writer", "admin");
//	count = dao.getBoardCount(conn, searchMap);
//	System.out.println("게시물 갯수 : " + count);
//	System.out.println("--------------------------------------------");
//
//	// 일반 게시판 리스트 - 탐색
//	info = new PageInfo(1, 10, count, 10);
//	list = dao.findAll(conn, info, searchMap);
//	for (Qna b : list) {
//		System.out.println(b.toString());
//	}
//	System.out.println("--------------------------------------------\n");
//	
//	// 일반 게시판 글쓰기
//	Qna board = new Qna();
//	board.setWriter_no(1);
//	board.setTitle("자바에서 작성한 글 입니다.");
//	board.setContent("자바에서 올린 글 내용입니다.");
//	board.setOriginal_filename("");
//	board.setRenamed_filename("");
//	int result = dao.insertBoard(conn, board); 
//	System.out.println("글올리기 결과 : " + result);
//	System.out.println("이거나옴?");
//	System.out.println("--------------------------------------------\n");
//	
//	
//	// 게시물 갯수
//	count = dao.getBoardCount(conn);
//	System.out.println("게시물 갯수 : " + count);
//	System.out.println("--------------------------------------------");
//	
//	// 일반 게시판 리스트
//	info = new PageInfo(1, 10, count, 10);
//	list = dao.findAll(conn, info);
//	for (Qna b : list) {
//		System.out.println(b.toString());
//	}
//	System.out.println("--------------------------------------------\n");
}
}