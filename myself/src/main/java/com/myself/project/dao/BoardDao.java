package com.myself.project.dao;

import com.myself.project.vo.BoardVo;

public interface BoardDao {

	//게시글 작성
	public void write(BoardVo boardVo) throws Exception;
}
