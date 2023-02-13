package com.marroticket.umember.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marroticket.umember.member.domain.UmemberAuth;
import com.marroticket.umember.member.domain.UmemberVO;
import com.marroticket.mapper.UmemberMapper;

@Service
public class UmemberServiceImpl implements UmemberService {
	@Autowired
	private UmemberMapper umembermapper;

	@Override
	public String findId(UmemberVO umember) throws Exception {
		return umembermapper.findId(umember);
	}

	//임시비밀번호로 업데이트
	public int passwordUpdate(UmemberVO umember) throws Exception{
		return umembermapper.updatePassword(umember);
	}
	
	//아이디 중복 체크
		@Override
		public int uIdCheck(UmemberVO umember) throws Exception {
			return umembermapper.uIdCheck(umember);
		}

	//회원가입
	public void register(UmemberVO umember) throws Exception{
		umembermapper.create(umember);
		
		//auth
		UmemberAuth auth = new UmemberAuth();
		auth.setUmemberAuth("ROLE_UMEMBER");
		umembermapper.createAuth(auth);
	}

	//마이페이지 
	//정보조회
	 @Override
	    public UmemberVO getUmemberByUId(String uId) throws Exception {
	        return umembermapper.getUmemberByUId(uId);
	    }
	 //정보수정
	@Override
	public void modify(UmemberVO vo) throws Exception {
		umembermapper.updateInfo(vo);
	}
	//회원탈퇴

	@Override
	public void remove(UmemberVO umember) throws Exception {
		//auth
		umembermapper.deleteAuth(umember.getUmemberAuthList().get(0).getUNumber());
		umembermapper.deleteMember(umember);
		
		
	}
}
