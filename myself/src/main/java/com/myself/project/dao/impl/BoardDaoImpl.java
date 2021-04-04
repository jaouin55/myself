package com.myself.project.dao.impl;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.myself.project.dao.BoardDao;
import com.myself.project.vo.BoardVo;

@Repository
public class BoardDaoImpl implements BoardDao{

	@Inject
	private SqlSession sqlSession;

	@Override
	public void write(BoardVo boardVo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("boardMapper.insert",boardVo);
		
	}
	
}
