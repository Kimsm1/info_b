package com.ezen.myapp.persistence;

import java.util.ArrayList;
import java.util.HashMap;

import com.ezen.myapp.domain.BoardVo;
import com.ezen.myapp.domain.NoteVo;
import com.ezen.myapp.domain.SearchCriteria;


public interface NoteService_Mapper {
	
	//占쏙옙占싱뱄옙티占쏙옙占쏙옙 占쏙옙占쏙옙占� 占쌨소드를 占쏙옙占쏙옙占싼댐옙
	
	public int noteSend(HashMap<String,Object> hm);
	
	public ArrayList<NoteVo> noteListRecv(String recv_nick);
	
	public ArrayList<NoteVo> noteListSend(String send_nick);

	public int noteDelete(int no);

	public NoteVo noteSelectOne(int no);
	
	public int noteTotalCount(String send_nick);
	
	public int noteTotalCount2(String recv_nick);

	public ArrayList<NoteVo> noteSelectAll(SearchCriteria scri);
	



}
