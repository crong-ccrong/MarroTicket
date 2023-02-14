package com.marroticket.tmember.member.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import java.security.SecureRandom;
import java.util.Date;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import com.marroticket.common.email.domain.EmailVO;
import com.marroticket.common.email.service.EmailService;
import com.marroticket.tmember.member.service.TmemberService;
import com.marroticket.tmember.registe.service.RegisteService;
import com.marroticket.umember.play.domain.PlayVO;

import lombok.extern.slf4j.Slf4j;

import com.marroticket.tmember.member.domain.TmemberVO;

//@PreAuthorize("hasRole('ROLE_TMEMBER')")
@Slf4j
@Controller
@RequestMapping("/theater")
@MapperScan(basePackages = "com.marroticket.mapper")
public class TmemberController {

   @Autowired
   RegisteService registeService;

   @Value("${upload.path}")
   private String uploadPath;

   @Value("${file.dir}") // 맥용으로 설정했으니 윈도우일땐 프로퍼티에서 설정 바꾸기
   private String uploadDir;
   
   @Autowired
   TmemberService tmemberService;
   @Autowired
   EmailService emailService;
   @Autowired
   private PasswordEncoder passwordEncoder;

   @GetMapping("")
   @PreAuthorize("hasRole('ROLE_TMEMBER')")
   public String home() {
      return "tmemberhome";
   }

   // 연극 등록 이동
   @GetMapping("/registePlay")
   @PreAuthorize("hasRole('ROLE_TMEMBER')")
   public String registeForm(@ModelAttribute("playVO") PlayVO playVO, HttpServletRequest request) throws Exception {
      return "registe.registePlay";
   }

   // 연극 등록 처리
   @PostMapping("/registePlayComplete")
   @PreAuthorize("hasRole('ROLE_TMEMBER')")
   public String registePlay(@ModelAttribute("playVO") @Validated PlayVO playVO, BindingResult result)
         throws Exception {

      MultipartFile pposter = playVO.getPposter();

      String pposterUrl = uploadFile(pposter.getOriginalFilename(), pposter.getBytes());

      playVO.setPposterUrl(pposterUrl);

      registeService.registePlay(playVO);

      if (result.hasErrors()) {
         List<ObjectError> list = result.getAllErrors();
         for (ObjectError error : list) {
            System.out.println(error);
         }
         return "registe.registePlay";
      }

      log.info(playVO.toString());
      return "registe.registeTemporaryComplete";
   }

   // 연극 임시등록 완료페이지
   @GetMapping("/registeTemporaryComplete")
   @PreAuthorize("hasRole('ROLE_TMEMBER')")
   public String registeTemporaryComplete(PlayVO playVO, Model model) throws Exception {

      return "registe.registeTemporaryComplete";
   }

   // 등록한 연극
   @GetMapping("/playRegisteInfo")
   public String playRegisteInfo() {
      return "info.tMemberPlayRegisteInfo";
   }

   // 극단 정산
   @GetMapping("/tmemberPayment")
   public String theaterPayment() {
      return "info.tMemberPayment";
   }

   // 극단 정보 관리
   @GetMapping("/tmembermypage")
   public String theaterMemberInfo() {
      return "info.tMemberMemberInfo";
   }

   // 극단 이용약관 페이지
   @GetMapping("/tmemberAgreement")
   public String tmemberAgreement() {
      System.out.println("tmemberAgreement 호출 완료");
      return "tMemberJoin.tmemberAgreement";
   }

   // 극단 회원 가입 페이지
   @GetMapping("/tmemberJoinForm")
   public String tmemberJoinForm(@ModelAttribute("tmember") TmemberVO tmember) {
      System.out.println("tmemberJoinForm 호출 완료");
      return "tMemberJoin.tmemberJoinForm";
   }

   // 아이디 중복체크
   @PostMapping("/tIdCheck")
   public ResponseEntity<String> tIdCheck(TmemberVO tmember) throws Exception {
      System.out.println("중복 아이디 체크 컨트롤러 불러옴\numember : " + tmember.toString());
      int result = tmemberService.tIdCheck(tmember);
      ResponseEntity<String> entity = null;
      System.out.println(result);
      if (result == 1) {
         entity = new ResponseEntity<>("overlap", HttpStatus.OK);
      } else {
         entity = new ResponseEntity<>("no overlap", HttpStatus.OK);
      }
      return entity;
   }

   // 극단 회원 가입
   @PostMapping("/signUp")
   public String signUp(@ModelAttribute("tmember") @Validated TmemberVO tmember, BindingResult result)
         throws Exception {
      log.info("signUp 호출");

      MultipartFile tBusinessRegisterationImage = tmember.getTBusinessRegisterationImage();

      String tBusinessRegisterationImageUrl = uploadImage(tBusinessRegisterationImage.getOriginalFilename(),
            tBusinessRegisterationImage.getBytes());

      tmember.setTBusinessRegisterationImageUrl(tBusinessRegisterationImageUrl);



      // 극단 회원 가입 실패시 리스트로 나열
      if (result.hasErrors()) {
         List<ObjectError> list = result.getAllErrors();
         for (ObjectError error : list) {
            System.out.println(error);
         }
         return "tMemberJoin.tmemberJoinForm";
      }

      // 비밀번호 암호화
      String inputPassword = tmember.getTPassword();
      tmember.setTPassword(passwordEncoder.encode(inputPassword));

      // 가입 성공시 등록 성공 페이지로 이동
      tmemberService.register(tmember);
      System.out.println("등록성공" + tmember.toString());
      return "tMemberJoin.tmemberJoinSuccess";
   }

   // 극단 회원가입 성공 페이지
   @GetMapping("/tmemberJoinSuccess")
   public String tmemberJoinSuccess() {
      System.out.println("tmemberJoinSuccess호출 완료");
      return "tMemberJoin.tmemberJoinSuccess";
   }

   // footer
   @GetMapping("/privacy")
   public String privacy() {
      return "tmember.footer.privacy";
   }

   @GetMapping("/companyinfo")
   public String companyinfo() {
      return "tmember.footer.companyinfo";
   }

   @GetMapping("/termsofuse")
   public String termsofuse() {
      return "tmember.footer.termsofuse";
   }

   @GetMapping("/tmembertermsofuse")
   public String termsofuse(Model model) {
      model.addAttribute("tmember", "tmember");
      return "tmember.footer.tmembertermsofuse";
   }

   @GetMapping("/umembertermsofuse")
   public String umembertermsofuse(Model model) {
      model.addAttribute("tmember", "tmember");
      return "tmember.footer.umembertermsofuse";
   }

   // 극단회원 아이디 찾기
   @PostMapping("/findId")
   public ResponseEntity<String> findId(@RequestBody TmemberVO tmember) throws Exception {
      // 값이 정상적으로 입력됐을 때, db 조회
      String tId = tmemberService.findId(tmember);

      // 응답
      if (tId != null && tId.length() > 0) {
         sendEmail(("아이디" + tId), tmember.gettOwnerEmail()); // 아이디 이메일 발송
         return new ResponseEntity<String>(tId, HttpStatus.OK);
      } else {
         return new ResponseEntity<String>("fail", HttpStatus.OK);
      }
   }

   // 비밀번호 찾기 - 임시비밀번호 업데이트
   @PostMapping("/findPassword")
   public ResponseEntity<String> findPassword(@RequestBody TmemberVO tmember) throws Exception {
      ResponseEntity<String> entity;

      // 임시비밀번호 생성(15자리)
      String temporaryPassword = getRamdomPassword(15);
      tmember.setTPassword(temporaryPassword);

      // 비밀번호 암호화
      tmember.setTPassword(passwordEncoder.encode(temporaryPassword));

      // 임시비밀번호로 업데이트 : 업데이트는 where조건(id, email이 db데이터 조회 시, 부합)에 따라 성공/실패
      int success = tmemberService.passwordUpdate(tmember);

      if (success != 0) { // 업데이트 성공
         sendEmail(temporaryPassword, tmember.gettOwnerEmail()); // 임시비밀번호 발송
         entity = new ResponseEntity<String>("send", HttpStatus.OK);
         // 임시비밀번호 이메일 발송
      } else { // 업데이트 실패
         entity = new ResponseEntity<String>("fail", HttpStatus.OK);
      }
      return entity;
   }

   // 아이디 또는 임시비밀번호 이메일 발송
   public void sendEmail(String idOrTemporaryPassword, String tOwnerEmail) throws Exception {
      String title = null;
      EmailVO email = new EmailVO(); // 이메일 객체

      if (idOrTemporaryPassword.substring(0, 3).equals("아이디")) {// 문자열 끝자리가 '아이디'일때
         title = "마로티켓입니다. 아이디를 확인해주세요"; // 이메일 제목
         idOrTemporaryPassword = idOrTemporaryPassword.substring(3);
         email.setId(idOrTemporaryPassword);
      } else {
         title = "마로티켓입니다. 임시비밀번호를 확인해주세요"; // 이메일 제목
         email.setPassword(idOrTemporaryPassword);
      }

      email.setAddress(tOwnerEmail);
      email.setTitle(title);

      // 이메일 발송
      emailService.sendTmemberEmail(email);
      // console 확인
      System.out.println("idOrTemporaryPassword 이메일 발송 완료");
   }

   // 랜덤한 임시비밀번호 생성
   public String getRamdomPassword(int size) {
      char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
            'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a',
            'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
            'w', 'x', 'y', 'z', '!', '@', '#', '$', '%', '^', '&' };

      StringBuffer sb = new StringBuffer();
      SecureRandom sr = new SecureRandom();
      sr.setSeed(new Date().getTime());

      int idx = 0;
      int len = charSet.length;
      for (int i = 0; i < size; i++) {
         // idx = (int) (len * Math.random());
         idx = sr.nextInt(len); // 강력한 난수를 발생시키기 위해 SecureRandom을 사용한다.
         sb.append(charSet[idx]);
      }

      return sb.toString();
   }

   // 포스터 이미지 업로드
   private String uploadFile(String originalName, byte[] fileData) throws Exception {
      UUID uid = UUID.randomUUID();
      String createdFileName = uid.toString() + "_" + originalName;
      File target = new File(uploadPath, createdFileName);
      FileCopyUtils.copy(fileData, target);
      return createdFileName;
   }
   
   // 사업자등록증 사본 이미지 업로드
   private String uploadImage(String originalName, byte[] fileData) throws Exception {
      UUID uid = UUID.randomUUID();
      String createdFileName = uid.toString() + "_" + originalName;
      File target = new File(uploadDir, createdFileName);
      FileCopyUtils.copy(fileData, target);
      return createdFileName;
   }

}