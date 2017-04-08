package com.a0000006.mem.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.a0000006.mem.service.MemberService;
import com.phl.common.CommandMap;

@Controller
public class MemberController {

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="memberService")
	private MemberService memberService;
	
	/* 회원리스트 */
	@RequestMapping(value="/a0000006/mem/selectMemList.do")
	public ModelAndView selectMemList(CommandMap commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("/a0000006/member/memberList");
         
        List<Map<String,Object>> list = memberService.selectMemList(commandMap.getMap());
        mv.addObject("list", list);
        System.out.println(333);
        System.out.println(333);
        System.out.println(333);
        System.out.println(333);
        System.out.println(333);
        System.out.println(333);
        System.out.println(333);
        System.out.println(333);
        return mv;
    }
	
	/* 회원가입 폼 */
	@RequestMapping(value="/a0000006/mem/memRegistForm.do")
	public ModelAndView memRegistForm(CommandMap commandMap) throws Exception{
	    ModelAndView mv = new ModelAndView("/a0000006/member/memRegistForm");
	    
	    return mv;
	}
	
	/* 로그인 폼 */
	@RequestMapping(value="/a0000006/mem/memLoginForm.do")
	public ModelAndView memLoginForm(CommandMap commandMap) throws Exception{
	    ModelAndView mv = new ModelAndView("/a0000006/member/memLoginForm");
	     
	    return mv;
	}

	/* 회원 등록 */
	@RequestMapping(value="/a0000006/mem/insertMemRegist.do")
	public ModelAndView insertMemRegist(CommandMap commandMap, HttpSession session, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("/a0000006/mainIndex");
		
		commandMap.put("BSNS_CODE", session.getAttribute("BSNS_CODE"));

		memberService.insertMemRegist(commandMap.getMap());
		
		return mv;
	}
	
	/* 로그인 */
	@RequestMapping(value="/a0000006/mem/loginAction.do")
	public ModelAndView loginAction(CommandMap commandMap, HttpSession session, HttpServletRequest request) throws Exception{
        ModelAndView mv = new ModelAndView("/a0000006/mainIndex");
        
        commandMap.put("BSNS_CODE", session.getAttribute("BSNS_CODE"));
        
        /* 로그인(ID,PW CHECK) */
        List<Map<String,Object>> idPwChk = memberService.idPwCheck(commandMap.getMap());
        
        String queryPw = (String) idPwChk.get(0).get("MEM_PW");
        
        String resultValue = "";
        
        if(queryPw != null && queryPw.equals(commandMap.get("mem_pw"))){
        	resultValue = "SUCCESS";
        	
        	/* 로그인 정보 */
        	List<Map<String,Object>> loginInfo = memberService.loginInfo(commandMap.getMap());
        	//mv.addObject("loginInfo", loginInfo.get(0));
        	session.setAttribute("loginInfo", loginInfo.get(0));
        	session.setAttribute("session_id", loginInfo.get(0).get("MEM_ID"));
        }else{
        	resultValue = "FAIL";
        }
        
        mv.addObject("resultValue",resultValue);  
         
        return mv;
    }
	
	/* 로그아웃 */
	@RequestMapping(value="/a0000006/mem/logoutAction.do")
	public ModelAndView logoutAction(CommandMap commandMap, HttpSession session, HttpServletRequest request) throws Exception{
        ModelAndView mv = new ModelAndView("/a0000006/mainIndex");
        
        /* 로그인정보만 세션제거 */
        session.removeAttribute("loginInfo");
        session.removeAttribute("session_id");
        
        return mv;
    }
	
	/* 마이페이지 */
	@RequestMapping(value="/a0000006/mem/memMyPage.do")
	public ModelAndView memMyPage(CommandMap commandMap, HttpSession session, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("/a0000006/member/memMyPage");
	
		commandMap.put("BSNS_CODE", session.getAttribute("BSNS_CODE"));
		commandMap.put("SESSION_ID", session.getAttribute("session_id"));
		
		List<Map<String,Object>> myPageInfo = memberService.memMyPage(commandMap.getMap());
		
		mv.addObject("myPageInfo", myPageInfo.get(0)); 
		
		return mv;
	}
	
	@RequestMapping(value="/a0000006/mem/idDupChk.do")
	public ModelAndView idDupChk(CommandMap commandMap, HttpSession session, HttpServletRequest request) throws Exception{
		
		ModelAndView mv = new ModelAndView("/a0000006/member/memRegistForm");
	
		commandMap.put("BSNS_CODE", session.getAttribute("BSNS_CODE"));
		
		int id_Chk = memberService.idDupChk(commandMap.getMap());
		String result = "";
		String resultMsg = "";
		System.out.println(4324234);
		if(id_Chk == 0){
			result = "success";
			resultMsg = "사용가능한 아이디 입니다.";
		}else{
			result = "fail";
			resultMsg = "이미 사용중인 아이디 입니다.";
		}
		
		mv.addObject("result", result);  
		mv.addObject("resultMsg", resultMsg);  
		
		return mv;
	}
}
