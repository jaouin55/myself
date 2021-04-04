package com.myself.project.service.impl;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.myself.project.dao.BoardDao;
import com.myself.project.service.BoardService;
import com.myself.project.vo.BoardVo;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Inject
	private BoardDao boardDao;

	@Override
	public void write(BoardVo boardVo) throws Exception {
		// TODO Auto-generated method stub
		boardDao.write(boardVo);
		
	}
}
