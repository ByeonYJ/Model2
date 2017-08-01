package com.gms.web.serviceImpl;
import java.util.List;
import java.util.Map;
import com.gms.web.dao.MemberDAO;
import com.gms.web.daoImpl.MemberDAOImpl;
import com.gms.web.domain.MemberBean;
import com.gms.web.service.MemberService;
public class MemberServiceImpl implements MemberService{
   public static MemberServiceImpl getInstance() {
      return new MemberServiceImpl();
   }
   private MemberServiceImpl() {
   }
   @Override
   public String addMember(MemberBean bean) {
      return MemberDAOImpl.getInstance().insert(bean).equals("1")?"가입성공":"실패";
   }
   List<MemberBean> list;// 1순위 큰놈\
   // 4번째 (인스턴스변수)
   Map<String,MemberBean> map;
   MemberBean member;
   MemberDAO dao;
   @Override
   public List<MemberBean> list() {
      return MemberDAOImpl.getInstance().selectAll();
   }
   @Override
   public List<MemberBean> findByName(String name) {
   return MemberDAOImpl.getInstance().selectByName(name);
   }
   @Override
   public MemberBean findById(String id) {
      return MemberDAOImpl.getInstance().selectById(id);
   }
   @Override
   public String count() {
      return String.valueOf(MemberDAOImpl.getInstance().count());
   }
   @Override
   public String modify(MemberBean bean) {
   /*   String msg="";
      if(dao.update(bean).equals("1")){
         msg="성공";
         }else{
            msg="실패";
         }
      System.out.println(msg);*/
   return MemberDAOImpl.getInstance().update(bean);
   }
   @Override
   public String remove(String id) {
         String msg = "";
         String rs = MemberDAOImpl.getInstance().delete(id);
         msg = (Integer.parseInt(rs)==1)?msg="삭제 성공":"삭제 실패";
         return msg;
      }
   @Override
   public String login(MemberBean bean) {//입력받아온 값을 빈을 통해서 가져옴
	   MemberBean m = findById(bean.getId());//사용자에게 받은 id값을 findById데이터베이스 안에 있는 id정보(날짜 비번 등등) 와 비교
	   return (m!=null)?(bean.getPassword().equals(m.getPassword()))?"main":"login_fail":"join";
   }                                                                  //일치하면 메인페이지, 틀리면 페일, 없는 아이디면 회원가입페이지(join)로
}