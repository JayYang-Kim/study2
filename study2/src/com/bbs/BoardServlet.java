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
- web.xml���� �����ϴ� ���
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
	 * title : ������
	 * @param req
	 * @param resp
	 * @param path // �������� �ּ�
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void forward(HttpServletRequest req, HttpServletResponse resp, String path) throws ServletException, IOException {
		// ������
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		// cp���� ������ �ּ�
		String uri = req.getRequestURI();
		
		// ��û �ּҿ� ���� ��û ó��
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
	 * title : �� ����Ʈ
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void list(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MyUtil util = new MyUtil();
		BoardDAO dao = new BoardDAO();
		
		// �Ķ���ͷ� �ѿ��� ������ ��ȣ
		String page = req.getParameter("page");
		int current_page = 1;
		if(page != null) {
			current_page = Integer.parseInt(page);
		}
		
		// �˻�
		String searchKey = req.getParameter("searchKey");
		String searchValue = req.getParameter("searchValue");
		if(searchKey == null) {
			searchKey = "subject";
			searchValue ="";
		}
		
		// GET����� �˻� ���ڿ��� ���ڵ��ؼ� �Ķ���Ͱ� �������� �ٽ� ���ڵ��� �ʿ�
		if(req.getMethod().equalsIgnoreCase("GET")) {
			searchValue = URLDecoder.decode(searchValue, "UTF-8");
		}
		
		// ������ ����
		int dataCount;
		if(searchValue.length() == 0) {
			dataCount = dao.dataCount();
		} else {
			dataCount = dao.dataCount(searchKey, searchValue);
		}
		
		// ��ü ������ ��
		int rows = 10;
		int total_page = util.pageCount(rows, dataCount);
		if(current_page > total_page) {
			current_page = total_page;
		}
		
		// �Խù� ��������
		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		
		List<BoardDTO> list;
		if(searchValue.length() == 0) {
			list = dao.listBoard(start, end);
		} else {
			list = dao.listBoard(start, end, searchKey, searchValue);
		}
		
		// ����Ʈ �۹�ȣ �����
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
		
		// ����¡ ó��
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
	 * title : �� ������
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
	 * title : �� ����
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
	 * title : �� ����
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
		// tomcat������ ���� �޾ƿö� ���ڵ��� �� �����̴�.
		// �ٸ� WAS������ ���� �޾ƿö� ���ڵ��� �Ǿ��ִ� �����̴�.
		String searchValue = req.getParameter("searchValue");

		if (searchKey == null) {
			searchKey = "subject";
			searchValue = "";
		}

		// ���ڵ� > ���ڵ� ó��
		searchValue = URLDecoder.decode(searchValue, "UTF-8");

		String query = "page=" + pageNum;

		if (searchValue.length() != 0) {
			query += "&searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
		}

		BoardDAO dao = new BoardDAO();

		// ��ȸ �� ����
		dao.updateHitCount(num);

		BoardDTO dto = dao.readBoard(num);

		// �ٸ� ����� �ش� �Խñ��� ���� �� �ֱ� ������ null üũ
		if (dto == null) {
			resp.sendRedirect(cp + "/sbbs/list.do?" + query);
			return;
		}

		// Content�� ���Ͱ� ���� ��� <br/> �±� ó��
		dto.setContent(dto.getContent().replaceAll("\n", "<br/>"));

		// ���� ��, ���� �� ��������
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
	 * title : �� ����
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
	 * title : �� ���� �Ϸ�
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
	 * title : �� ����
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
