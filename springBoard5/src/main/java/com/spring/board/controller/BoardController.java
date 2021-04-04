package com.spring.board.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.board.HomeController;
import com.spring.board.service.boardService;
import com.spring.board.vo.BoardVo;
import com.spring.board.vo.ComCodeVo;
import com.spring.board.vo.PageVo;
import com.spring.board.vo.UserVo;
import com.spring.common.CommonUtil;

@Controller
public class BoardController {

	@Autowired
	boardService boardService;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	// 게시판 boardList
	@RequestMapping(value = "/board/boardList.do", method = RequestMethod.GET)
	public String boardList(Locale locale, Model model, PageVo pageVo, HttpServletRequest request, BoardVo boardVo,
			ComCodeVo comCodeVo) throws Exception {

		String[] codeId;

		codeId = request.getParameterValues("codeId");

		List<BoardVo> boardList = new ArrayList<BoardVo>();
		List<ComCodeVo> comCodeList = new ArrayList<ComCodeVo>();

		int page = 1;
		int totalCnt = 0;

		if (pageVo.getPageNo() == 0) {
			pageVo.setPageNo(page);
			;
		}
		pageVo.setCodeId(codeId);

		comCodeList = boardService.codeNameList();
		boardList = boardService.SelectBoardList(pageVo);
		totalCnt = boardService.selectBoardCnt();

		model.addAttribute("codeName", comCodeList);
		model.addAttribute("boardList", boardList);
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("pageNo", page);

		return "board/boardList";
	}

	// 게시판 boardView
	@RequestMapping(value = "/board/{boardType}/{boardNum}/boardView.do", method = RequestMethod.GET)
	public String boardView(Locale locale, Model model, @PathVariable("boardType") String boardType,
			@PathVariable("boardNum") int boardNum) throws Exception {

		BoardVo boardVo = new BoardVo();

		boardVo = boardService.selectBoard(boardType, boardNum);

		model.addAttribute("boardType", boardType);
		model.addAttribute("boardNum", boardNum);
		model.addAttribute("board", boardVo);

		return "board/boardView";
	}

	// 게시판 boardWrite
	@RequestMapping(value = "/board/boardWrite.do", method = RequestMethod.GET)
	public String boardWrite(Locale locale, Model model, PageVo pageVo, HttpServletRequest request) throws Exception {

		List<ComCodeVo> comCodeList = new ArrayList<ComCodeVo>();
		comCodeList = boardService.codeNameList();
		model.addAttribute("codeName", comCodeList);

		return "board/boardWrite";
	}

	// 게시판 boardWriteAction
	@RequestMapping(value = "/board/boardWriteAction.do", method = RequestMethod.POST)
	@ResponseBody
	public String boardWriteAction(Locale locale, BoardVo boardVo) throws Exception {

		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();

		int resultCnt = boardService.boardInsert(boardVo);

		result.put("success", (resultCnt > 0) ? "Y" : "N");
		String callbackMsg = commonUtil.getJsonCallBackString(" ", result);

		System.out.println("callbackMsg::" + callbackMsg);

		return callbackMsg;
	}

	// 게시판 UpdateView
	@RequestMapping(value = "/board/{boardType}/{boardNum}/updateView.do", method = RequestMethod.GET)
	public String updateView(Locale locale, Model model, @PathVariable("boardType") String boardType,
			@PathVariable("boardNum") int boardNum) throws Exception {

		BoardVo boardVo = new BoardVo();

		boardVo = boardService.selectBoard(boardType, boardNum);

		model.addAttribute("boardType", boardType);
		model.addAttribute("boardNum", boardNum);
		model.addAttribute("board", boardVo);

		return "board/updateView";
	}

	// 게시판 UpdateAction
	@RequestMapping(value = "/board/boardUpdateAction.do", method = RequestMethod.POST)
	@ResponseBody
	public String boardUpdateAction(Locale locale, BoardVo boardVo) throws Exception {

		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();

		int resultCnt = boardService.boardUpdate(boardVo);

		result.put("success", (resultCnt > 0) ? "Y" : "N");
		String callbackMsg = commonUtil.getJsonCallBackString(" ", result);

		System.out.println("callbackMsg::" + callbackMsg);

		return callbackMsg;
	}

	// 게시판 DeleteAction
	@RequestMapping(value = "/board/boardDeleteAction.do", method = RequestMethod.GET)
	@ResponseBody
	public String boardDeleteAction(Locale locale, BoardVo boardVo) throws Exception {

		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();

		int resultCnt = boardService.boardDelete(boardVo);

		result.put("success", (resultCnt > 0) ? "Y" : "N");
		String callbackMsg = commonUtil.getJsonCallBackString(" ", result);

		System.out.println("callbackMsg::" + callbackMsg);

		return callbackMsg;
	}

	// 로그인view
	@RequestMapping(value = "/board/userLogin.do", method = RequestMethod.GET)
	public String userLogin(Locale locale, Model model) throws Exception {

		return "board/userLogin";
	}

	// 회원가입view
	@RequestMapping(value = "/board/userJoin.do", method = RequestMethod.GET)
	public String userJoin(Locale locale, Model model) throws Exception {

		return "board/userJoin";
	}
	
	//회원가입 Action
	@RequestMapping(value = "/board/userJoinAction.do", method = RequestMethod.GET)
	public String userJoinAction(Locale locale, BoardVo boardVo,UserVo userVo) throws Exception {

			HashMap<String, String> result = new HashMap<String, String>();
			CommonUtil commonUtil = new CommonUtil();

			int resultCnt = boardService.insertMember(userVo);

			result.put("success", (resultCnt > 0) ? "Y" : "N");
			String callbackMsg = commonUtil.getJsonCallBackString(" ", result);

			System.out.println("callbackMsg::" + callbackMsg);

			return callbackMsg;
		}
}