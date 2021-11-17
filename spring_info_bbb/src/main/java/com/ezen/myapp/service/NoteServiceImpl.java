package com.ezen.myapp.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ezen.myapp.domain.BoardVo;
import com.ezen.myapp.domain.CommentVo;
import com.ezen.myapp.domain.NoteVo;
import com.ezen.myapp.domain.SearchCriteria;
import com.ezen.myapp.persistence.BoardService_Mapper;
import com.ezen.myapp.persistence.NoteService_Mapper;

@Service("NoteServiceImpl")
public class NoteServiceImpl implements NoteService  {

	@Autowired
	SqlSession sqlSession;

	@Override
	public int noteSend(String send_nick, String recv_nick, String content) {
		HashMap<String,Object> hm = new HashMap<String,Object>();
		hm.put("send_nick", send_nick);
		hm.put("recv_nick", recv_nick);
		hm.put("content", content);
		
		NoteService_Mapper nsm = sqlSession.getMapper(NoteService_Mapper.class);
		int result = nsm.noteSend(hm);
		return result;
	}
	
	
	@Override
	public ArrayList<NoteVo> noteListRecv(String recv_nick) {
		ArrayList<NoteVo> alist = null;
		NoteService_Mapper nsm =sqlSession.getMapper(NoteService_Mapper.class);	
		alist = nsm.noteListRecv(recv_nick);
		return alist;
	}


	@Override
	public ArrayList<NoteVo> noteListSend(String send_nick) {
		ArrayList<NoteVo> alist = null;
		NoteService_Mapper nsm =sqlSession.getMapper(NoteService_Mapper.class);	
		alist = nsm.noteListSend(send_nick);
		return alist;
	}

	@Override
	public int noteDelete(int no) {
		
		NoteService_Mapper nsm=sqlSession.getMapper(NoteService_Mapper.class);
		int value = nsm.noteDelete(no);
		return value;
	}

	@Override
	public NoteVo noteSelectOne(int no) {
		
		NoteService_Mapper nsm = sqlSession.getMapper(NoteService_Mapper.class);
		NoteVo nv = nsm.noteSelectOne(no);
		return nv;
	}

	@Override
	public int noteTotalCount(String send_nick) {
	
		int cnt = 0;
		NoteService_Mapper nsm=sqlSession.getMapper(NoteService_Mapper.class);
		cnt = nsm.noteTotalCount(send_nick);
		return cnt;
	}
	
	@Override
	public int noteTotalCount2(String recv_nick) {
	
		int cnt = 0;
		NoteService_Mapper nsm=sqlSession.getMapper(NoteService_Mapper.class);
		cnt = nsm.noteTotalCount2(recv_nick);
		return cnt;
	}
	
	@Override
	public ArrayList<NoteVo> noteSelectAll(SearchCriteria scri) {
		
		ArrayList<NoteVo> alist = null;
		NoteService_Mapper nsm =sqlSession.getMapper(NoteService_Mapper.class);	
		alist = nsm.noteSelectAll(scri);
		System.out.println("searchtype:"+scri.getSearchType());
		return alist;
	}

}
