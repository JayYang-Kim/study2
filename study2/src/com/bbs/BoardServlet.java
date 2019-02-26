package com.bbs;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.MyUtil;

/*
- web.xml에서 정의하는 경우
  <servlet>
	      <servlet-name>boardServlet</servlet-name>
	      <servlet-class>com.bbs.BoardServlet</servlet-class>
  </servlet>
  <servlet-mapping>
	      <servlet-name>boardServlet</servlet-name>
	      <url-pattern>/bbs/*</url-pattern>
  </servlet-mapping>
*/

@WebServlet("/sbbs/*")
public class BoardServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);
	}
	
	/**
	 * title : 포워딩
	 * @param req
	 * @param resp
	 * @param path // 포워딩할 주소
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void forward(HttpServletRequest req, HttpServletResponse resp, String path) throws ServletException, IOException {
		// 포워딩
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		// cp부터 끝까지 주소
		String uri = req.getRequestURI();
		
		// 요청 주소에 따른 요청 처리
		if(uri.indexOf("list.do") != -1) {
			list(req, resp);
		} else if(uri.indexOf("created.do") != -1) {
			createdForm(req, resp);
		} else if(uri.indexOf("created_ok.do") != -1) {
			createdSubmit(req, resp);
		} else if(uri.indexOf("article.do") != -1) {
			article(req, resp);
		} else if(uri.indexOf("update.do") != -1) {
			updateForm(req, resp);
		} else if(uri.indexOf("update_ok.do") != -1) {
			updateSubmit(req, resp);
		} else if(uri.indexOf("delete.do") != -1) {
			delete(req, resp);
		}
	}
	
	/**
	 * title : 글 리스트
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void list(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MyUtil util = new MyUtil();
		BoardDAO dao = new BoardDAO();
		
		// 파라미터로 넘오온 페이지 번호
		String page = req.getParameter("page");
		int current_page = 1;
		if(page != null) {
			current_page = Integer.parseInt(page);
		}
		
		// 검색
		String searchKey = req.getParameter("searchKey");
		String searchValue = req.getParameter("searchValue");
		if(searchKey == null) {
			searchKey = "subject";
			searchValue ="";
		}
		
		// GET방식은 검색 문자열을 인코딩해서 파라미터가 보냄으로 다시 디코딩이 필요
		if(req.getMethod().equalsIgnoreCase("GET")) {
			searchValue = URLDecoder.decode(searchValue, "UTF-8");
		}
		
		// 데이터 개수
		int dataCount;
		if(searchValue.length() == 0) {
			dataCount = dao.dataCount();
		} else {
			dataCount = dao.dataCount(searchKey, searchValue);
		}
		
		// 전체 페이지 수
		int rows = 10;
		int total_page = util.pageCount(rows, dataCount);
		if(current_page > total_page) {
			current_page = total_page;
		}
		
		// 게시물 가져오기
		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		
		List<BoardDTO> list;
		if(searchValue.length() == 0) {
			list = dao.listBoard(start, end);
		} else {
			list = dao.listBoard(start, end, searchKey, searchValue);
		}
		
		// 리스트 글번호 만들기
		int listNum, n = 0;
		Iterator<BoardDTO> it = list.iterator();
		while(it.hasNext()) {
			BoardDTO dto = it.next();
			listNum = dataCount - (start + n -1);
			dto.setListNum(listNum);
			n++;
		}
		
		String query = "";
		if(searchValue.length() != 0) {
			query = "searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
		}
		
		// 페이징 처리
		String cp = req.getContextPath();
		String listUrl = cp + "/sbbs/list.do";
		String articleUrl = cp + "/sbbs/article.do?page=" + current_page;
		if(query.length() != 0) {
			listUrl += "?" + query;
			articleUrl += "&" + query;
		}
		
		String paging = util.paging(current_page, total_page, listUrl);
		
		req.setAttribute("list", list);
		req.setAttribute("dataCount", dataCount);
		req.setAttribute("page", current_page);
		req.setAttribute("total_page", total_page);
		req.setAttribute("articleUrl", articleUrl);
		req.setAttribute("paging", paging);
		
		forward(req, resp, "/WEB-INF/views/bbs/list.jsp");
	}
	
	/**
	 * title : 글 쓰기폼
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void createdForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("mode", "created");
		forward(req, resp, "/WEB-INF/views/bbs/created.jsp");
	}
	
	/**
	 * title : 글 저장
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void createdSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cp = req.getContextPath();
		
		BoardDAO dao = new BoardDAO();
		BoardDTO dto = new BoardDTO();
		
		dto.setSubject(req.getParameter("subject"));
		dto.setName(req.getParameter("name"));
		dto.setContent(req.getParameter("content"));
		dto.setPwd(req.getParameter("pwd"));
		dto.setIpAddr(req.getRemoteAddr());
		
		dao.insertBorad(dto);
		
		resp.sendRedirect(cp + "/sbbs/list.do");
	}
	
	/**
	 * title : 글 보기
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void article(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cp = req.getContextPath();
		int num = Integer.parseInt(req.getParameter("num"));
		String pageNum = req.getParameter("page");

		String searchKey = req.getParameter("searchKey");
		// tomcat에서는 값을 받아올때 디코딩이 된 상태이다.
		// 다른 WAS에서는 값을 받아올때 인코딩만 되어있는 상태이다.
		String searchValue = req.getParameter("searchValue");

		if (searchKey == null) {
			searchKey = "subject";
			searchValue = "";
		}

		// 인코딩 > 디코딩 처리
		searchValue = URLDecoder.decode(searchValue, "UTF-8");

		String query = "page=" + pageNum;

		if (searchValue.length() != 0) {
			query += "&searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
		}

		BoardDAO dao = new BoardDAO();

		// 조회 수 증가
		dao.updateHitCount(num);

		BoardDTO dto = dao.readBoard(num);

		// 다른 사람이 해당 게시글을 지울 수 있기 때문에 null 체크
		if (dto == null) {
			resp.sendRedirect(cp + "/sbbs/list.do?" + query);
			return;
		}

		// Content에 엔터가 있을 경우 <br/> 태그 처리
		dto.setContent(dto.getContent().replaceAll("\n", "<br/>"));

		// 이전 글, 다음 글 가져오기
		BoardDTO preReadDto = dao.preReadBoard(num, searchKey, searchValue);
		BoardDTO nextReadDto = dao.nextReadBoard(num, searchKey, searchValue);
		
		req.setAttribute("dto", dto);
		req.setAttribute("preReadDto", preReadDto);
		req.setAttribute("nextReadDto", nextReadDto);
		req.setAttribute("query", query);
		req.setAttribute("page", pageNum);
		
		forward(req, resp, "/WEB-INF/views/bbs/article.jsp");
	}
	
	/**
	 * title : 글 수정
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void updateForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cp = req.getContextPath();
		
		int num = Integer.parseInt(req.getParameter("num"));
		String page = req.getParameter("page");
		
		BoardDAO dao = new BoardDAO();
		
		BoardDTO dto = dao.readBoard(num);
		
		if(dto == null) {
			resp.sendRedirect(cp + "/sbbs/list.do?page=" + page);
			return;
		}
		
		req.setAttribute("mode", "update");
		
		req.setAttribute("dto", dto);
		req.setAttribute("page", page);
		
		forward(req, resp, "/WEB-INF/views/bbs/created.jsp");
	}
	
	/**
	 * title : 글 수정 완료
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void updateSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cp = req.getContextPath();
		
		BoardDAO dao = new BoardDAO();
		BoardDTO dto = new BoardDTO();
		
		dto.setNum(Integer.parseInt(req.getParameter("num")));
		dto.setSubject(req.getParameter("subject"));
		dto.setName(req.getParameter("name"));
		dto.setContent(req.getParameter("content"));
		dto.setPwd(req.getParameter("pwd"));
		
		dao.updateBoard(dto);
		
		String page = req.getParameter("page");
		
		resp.sendRedirect(cp + "/sbbs/list.do?page=" + page);
	}
	
	/**
	 * title : 글 삭제
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cp = req.getContextPath();
		
		int num = Integer.parseInt(req.getParameter("num"));
		String pageNum = req.getParameter("page");
		
		BoardDAO dao = new BoardDAO();
		
		dao.deleteBoard(num);
		
		resp.sendRedirect(cp + "/sbbs/list.do?page=" + pageNum);
	}
}
