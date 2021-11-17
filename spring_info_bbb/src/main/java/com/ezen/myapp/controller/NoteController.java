package com.ezen.myapp.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.myapp.domain.BoardVo;
import com.ezen.myapp.domain.MemberVo;
import com.ezen.myapp.domain.NoteVo;
import com.ezen.myapp.domain.PageMaker;
import com.ezen.myapp.domain.SearchCriteria;
import com.ezen.myapp.service.MemberService;
import com.ezen.myapp.service.NoteService;

@Controller
public class NoteController {
	
	@Autowired
	NoteService ns;
	
	@Autowired
	MemberService ms;
	
	@Autowired
	PageMaker pm;
	
	@RequestMapping(value="/noteSend.do")
    public String noteSend(
			@RequestParam("send_nick") String send_nick,
			@RequestParam("recv_nick") String recv_nick,
			@RequestParam("content") String content,
			HttpSession session
			){

		send_nick = (String)session.getAttribute("membernickname");
        ns.noteSend(send_nick, recv_nick, content);

        return "redirect:/noteListSend.do";
    }
	
	@RequestMapping(value="/noteListRecv.do")
    public String noteListRecv(
    		SearchCriteria scri, NoteVo nv, Model model, HttpSession session
    		){
		String recv_nick = (String)session.getAttribute("membernickname");
		ArrayList<NoteVo> alist = 	ns.noteListRecv(recv_nick);
        model.addAttribute("alist", alist);
        
        int cnt = ns.noteTotalCount2(recv_nick);
    	System.out.println("cnt"+cnt);
    //	ArrayList<NoteVo> nlist = 	ns.noteSelectAll(scri);
   // 	System.out.println("nlist"+nlist);	
    	
    	pm.setScri(scri);
    	pm.setTotalCount(cnt);
    	
    	model.addAttribute("alist", alist);
    	model.addAttribute("pm", pm);
        
        return "noteListRecv";
    }
	
	@RequestMapping(value="/noteListSend.do")
    public String noteListSend(
    		SearchCriteria scri, NoteVo nv, Model model, HttpSession session
    		){
		String send_nick = (String)session.getAttribute("membernickname");
		ArrayList<NoteVo> alist = 	ns.noteListSend(send_nick);
        model.addAttribute("alist", alist);
        
        int cnt = ns.noteTotalCount(send_nick);
    	System.out.println("cnt"+cnt);
    //	ArrayList<NoteVo> nlist = 	ns.noteSelectAll(scri);
   // 	System.out.println("nlist"+nlist);	
    	
    	pm.setScri(scri);
    	pm.setTotalCount(cnt);
    	
    	model.addAttribute("alist", alist);
    	model.addAttribute("pm", pm);
        
        return "noteListSend";
    }
	
	@RequestMapping(value = "/noteSendPage.do")
	public String noteSendPage(
			@RequestParam("midx") int midx,
			Model model) {
		
		MemberVo mv = ms.memberSelectOne(midx);
		model.addAttribute("mv", mv);	
		
		return "noteSendPage";
	}
	
	@RequestMapping(value = "/noteSendWant.do")
	public String noteSendWant() {
			
		return "noteSendWant";
	}
	
	@RequestMapping(value="/{no}/noteDelete.do")
	public String noteDelete(
			@PathVariable("no") int no
			) {
							
		int value = ns.noteDelete(no);
		
		return "noteListRecv";
	}
	
	
	@RequestMapping(value = "/noteReplyPage.do")
	public String noteReplyPage(
			@RequestParam("no") int no,
			Model model
			) {
		
		NoteVo nv = ns.noteSelectOne(no);
		model.addAttribute("nv", nv);
		
		
		return "noteReplyPage";
	}
}
