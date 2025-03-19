package com.musicCloud.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.musicCloud.board.model.service.BoardService;
import com.musicCloud.common.model.vo.PageInfo;
import com.musicCloud.member.model.service.MemberSerivce;
import com.musicCloud.member.model.vo.Member;

/**
 * Servlet implementation class AdminMemberListController
 */
@WebServlet("/Admin.bo")
public class AdminMemberListController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AdminMemberListController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int listCount;
        int currentPage;
        int pageLimit = 10;
        int boardLimit = 10;
        
        // 1. 현재 페이지 예외 처리
        String cpageParam = request.getParameter("cpage");
        currentPage = (cpageParam != null) ? Integer.parseInt(cpageParam) : 1;

        // 2. 전체 회원 수 가져오기 (adminMemberList()가 int 반환하는지 확인)
        listCount = new MemberSerivce().selectMemberCount();

        // 3. 페이지 계산
        int maxPage;
        int startPage = ((currentPage - 1) / pageLimit) * pageLimit + 1;
        int endPage = startPage + pageLimit - 1;

        maxPage = (int)Math.ceil((double)listCount / boardLimit);
        startPage = (currentPage -1 ) / pageLimit * pageLimit + 1;
        endPage = startPage + pageLimit - 1;
        
        if (endPage > maxPage) {
        	endPage = maxPage;
        }
        // 4. PageInfo 객체 생성
        PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);

        // 5. 회원 리스트 가져오기 (null 체크 추가)
        ArrayList<Member> list = new ArrayList<Member>();
        list = new BoardService().adminMemberList(pi);
        		
        System.out.println("회원 리스트 개수: " + (list != null ? list.size() : "null"));
        // ↑위에 회원리스트 DB에 저장된대로 6개 찍힘
        
        // 6. 데이터 JSP로 전달
        request.setAttribute("pi", pi);
        request.setAttribute("list", list);


        
        // 7. 페이지 이동 (경로 확인 필요)
        System.out.println("Forwarding to: views/board/adminBoard.jsp");
        request.getRequestDispatcher("views/board/adminBoard.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
