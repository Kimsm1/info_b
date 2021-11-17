package com.ezen.myapp.service;

import java.util.ArrayList;

import com.ezen.myapp.domain.BoardVo;
import com.ezen.myapp.domain.CommentVo;
import com.ezen.myapp.domain.NoteVo;
import com.ezen.myapp.domain.SearchCriteria;

public interface NoteService {
	
	
	public int noteSend(String send_nick, String recv_nick, String content);
	
	public ArrayList<NoteVo> noteListRecv(String recv_nick);

	public ArrayList<NoteVo> noteListSend(String send_nick);
	
	public int noteDelete(int no);
	
	public NoteVo noteSelectOne(int no);
	
	public int noteTotalCount(String send_nick);
	
	public int noteTotalCount2(String recv_nick);
	
	public ArrayList<NoteVo> noteSelectAll(SearchCriteria scri);
}
