package semi.culture.mvc.noticeboard.model.dao;

import static semi.culture.common.jdbc.JDBCTemplate.close;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import semi.culture.common.util.PageInfo;
import semi.culture.mvc.noticeboard.model.vo.Notice;
import semi.culture.mvc.qnaboard.model.vo.Qna;

public class NoticeDAO {

	// 공지사항 등록
	public int insertNotice(Connection conn, Notice notice) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "INSERT INTO TBL_Notice(NoticeNum, NTitile, NContent, NReadCount, NCreateDate) "
				+ "VALUES(SEQ_Notice.NEXTVAL, ? ,? ,default,SYSDATE) ";
		
		try {
			
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, notice.getNoticeTitile());
			pstmt.setString(2, notice.getNoticeContent());
			
			result = pstmt.executeUpdate();
			return result;
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 게시글 수정
			public int updateNotice(Connection conn, Notice notice) {
				PreparedStatement pstmt = null;
				String query = "UPDATE TBL_Notice SET NTitile=?,NContent=?,NCreateDate=SYSDATE WHERE NoticeNum=?";
				int result = 0;

				try {
					pstmt = conn.prepareStatement(query);
					pstmt.setString(1, notice.getNoticeTitile());
					pstmt.setString(2, notice.getNoticeContent());
					pstmt.setInt(3, notice.getNoticeNum());

					result = pstmt.executeUpdate();
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					close(pstmt);
				}
				return result;
			}
	
	// 문의글 리스트 가져오기
	public List<Notice> findNoticeList(Connection conn, PageInfo pageInfo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Notice> list = new ArrayList<>();
		String query = "SELECT RNUM, NoticeNum, NTitile, NContent, NReadCount, NCreateDate FROM "
				+ "(SELECT ROWNUM AS RNUM, NoticeNum, NTitile, NContent, NReadCount, NCreateDate "
				+ "FROM TBL_Notice ORDER BY NoticeNum DESC) " + "WHERE RNUM BETWEEN ? AND ?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, pageInfo.getStartList());
			pstmt.setInt(2, pageInfo.getEndList());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Notice notice = new Notice();
				notice = new Notice();
				notice.setNoticeNum(rs.getInt("NoticeNum"));
				notice.setNoticeTitile(rs.getString("NTitile"));
				notice.setNoticeContent(rs.getString("NTitile"));
				notice.setNoticeReadCount(rs.getInt("NReadCount"));
				notice.setNoticeCreateDate(rs.getDate("NCreateDate"));

				list.add(notice);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return list;
	}

	// 상세 게시글을 조회
	public Notice findNoticeByNo(Connection conn, int boardNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Notice board = null;
		String query = "SELECT NoticeNum, NTitile, NContent, NReadCount, NCreateDate FROM TBL_Notice "
				+ "WHERE NoticeNum = ? ";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardNo);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				board = new Notice();
				board.setNoticeNum(rs.getInt("NoticeNum"));
				board.setNoticeTitile(rs.getString("NTitile"));
				board.setNoticeContent(rs.getString("NContent"));
				board.setNoticeReadCount(rs.getInt("NReadCount"));
				board.setNoticeCreateDate(rs.getDate("NCreateDate"));
			}

			return board;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return board;
	}

	// 전체 게시글 개수

	public int findAllNoticeCount(Connection conn) {

		PreparedStatement pstmt = null;
		String query = "SELECT COUNT(*) FROM TBL_Notice";
		ResultSet rs = null;
		int totalCount = 0;
		try {
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				totalCount = rs.getInt(1);
			}

			return totalCount;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return totalCount;
	}

	// 공지사항 조회수
	public int updateReadCount(Connection conn, Notice notice) {
		PreparedStatement pstmt = null;
		String query = "UPDATE TBL_Notice SET NReadCount = ? WHERE NoticeNum = ?";
		int result = 0;

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, notice.getNoticeReadCount() + 1);
			pstmt.setInt(2, notice.getNoticeNum());

			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
}
