package com.myweb.www.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.myweb.www.domain.CommentVO;
import com.myweb.www.domain.PagingVO;
import com.myweb.www.handler.PagingHandler;

public interface CommentDAO {

	int insert(CommentVO cvo);

	List<CommentVO> selectList(@Param("bno")long bno, @Param("pgvo")PagingVO pgvo);

	int countTotal(long bno);

	int updateCvo(CommentVO cvo);

	int delete(long cno);
}
