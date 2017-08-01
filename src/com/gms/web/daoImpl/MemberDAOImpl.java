package com.gms.web.daoImpl;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.gms.web.constant.DB;
import com.gms.web.constant.SQL;
import com.gms.web.constant.Vendor;
import com.gms.web.dao.MemberDAO;
import com.gms.web.domain.MemberBean;
import com.gms.web.factory.DatabaseFactory;
public class MemberDAOImpl implements MemberDAO {
	public static MemberDAOImpl instance=new MemberDAOImpl();
	public static MemberDAOImpl getInstance() {
		return instance;
	}
	private MemberDAOImpl(){}
	@Override
	public String insert(MemberBean bean) {
		int rs=0;
		try {         
         //rs=DriverManager.getConnection 손오공이 카피해서 보내는문법
         PreparedStatement pstmt=DatabaseFactory.createDatabase(Vendor.ORACLE, DB.USERNAME,DB.PASSWORD).geConnection().prepareStatement(SQL.MEMBER_INSERT);
         pstmt.setString(1, bean.getId());
         pstmt.setString(2, bean.getName());
         pstmt.setString(3, bean.getPassword());
         pstmt.setString(4, bean.getSsn());
         rs=pstmt.executeUpdate();
         System.out.println("INSER SQL:"+SQL.MEMBER_INSERT);
      } catch (Exception e) {
         e.printStackTrace();
      }
      return String.valueOf(rs);
   }
   @Override
   public List<MemberBean> selectAll() {
      List<MemberBean> list=new ArrayList<>(); //이거때문에 와일문
      try {
         ResultSet rs=DatabaseFactory.createDatabase(Vendor.ORACLE, DB.USERNAME,DB.PASSWORD).geConnection().prepareStatement(SQL.MEMBER_LIST).executeQuery();
         MemberBean member=null; //아파트대지땅구입
      while(rs.next()){ //rs.next 무조건
         member=new MemberBean(); //건물올림 살사람들 들어오게
         member.setId(rs.getString(DB.MEMBER_ID)); //입주
         member.setName(rs.getString(DB.MEMBER_USER));
         member.setPassword(rs.getString(DB.MEMBER_PASS));
         member.setSsn(rs.getString(DB.MEMBER_SSN));
         member.setRegdate(rs.getString(DB.MEMBER_REGDATE));
         list.add(member); //분양완료
      }
      } catch (Exception e) {
         e.printStackTrace();
      }
      return list;
   }
   @Override
   public List<MemberBean> selectByName(String name) {
      List<MemberBean> temp=new ArrayList<>();
      try {
         PreparedStatement pstmt=DatabaseFactory.createDatabase(Vendor.ORACLE, DB.USERNAME,DB.PASSWORD).geConnection()//너무빠르다 담자마자 결국 객체가된다 호출하자마자
         .prepareStatement(SQL.MEMBER_FINDBYNAME);
         pstmt.setString(1,name);
         ResultSet rs=pstmt.executeQuery();
         MemberBean member=null; //아파트대지땅구입
      while(rs.next()){ //rs.next 무조건
         member=new MemberBean(); //건물올림 살사람들 들어오게
         member.setId(rs.getString(DB.MEMBER_ID)); //입주
         member.setName(rs.getString(DB.MEMBER_USER));
         member.setPassword(rs.getString(DB.MEMBER_PASS));
         member.setSsn(rs.getString(DB.MEMBER_SSN));
         member.setRegdate(rs.getString(DB.MEMBER_REGDATE));
         temp.add(member); //분양완료
      }
      } catch (Exception e) {
         e.printStackTrace();
      }
      return temp;
   }
   @Override
   public MemberBean selectById(String id) {
      // TODO Auto-generated method stub
      MemberBean member=null;
            try {
               PreparedStatement pstmt=DatabaseFactory.createDatabase(Vendor.ORACLE, DB.USERNAME,DB.PASSWORD).geConnection()//너무빠르다 담자마자 결국 객체가된다 호출하자마자
                     .prepareStatement(SQL.MEMBER_FINDBYID);
               pstmt.setString(1,id);
            ResultSet rs=pstmt.executeQuery();
            if(rs.next()){
               member=new MemberBean();
                  member.setId(rs.getString(DB.MEMBER_ID));
                  member.setName(rs.getString(DB.MEMBER_USER));
                  member.setPassword(rs.getString(DB.MEMBER_PASS));
                  member.setSsn(rs.getString(DB.MEMBER_SSN));
                  member.setRegdate(rs.getString(DB.MEMBER_REGDATE));
               }
            } catch (Exception e) {
               e.printStackTrace();
            }
      return member;
   }
   @Override
   public String count() {
      int count=0;
      try {
            PreparedStatement pstmt=DatabaseFactory.createDatabase(Vendor.ORACLE, DB.USERNAME,DB.PASSWORD).geConnection().prepareStatement(SQL.MEMBER_COUNT);
            ResultSet rs=pstmt.executeQuery();
            if(rs.next()){
               count=Integer.parseInt(rs.getString("count"));
            }
         } catch (Exception e) {
            e.printStackTrace();
         }
      return String.valueOf(count);
   }
   @Override
   public String update(MemberBean bean) {
       String rs= "";
         try {
            PreparedStatement pstmt = DatabaseFactory.createDatabase(Vendor.ORACLE, DB.USERNAME, DB.PASSWORD).geConnection().prepareStatement(SQL.MEMBER_UPDATE);
            pstmt.setString(1, bean.getPassword());
            pstmt.setString(2, bean.getId());
            rs = String.valueOf(pstmt.executeUpdate());
         } catch (Exception e) {
            System.out.println("MEMBERDAO UPDATE");
            e.printStackTrace();
         }
         return rs;
   }
   @Override
   public String delete(String id) {
      String rs="";
      try {
         PreparedStatement pstmt=DatabaseFactory.createDatabase(Vendor.ORACLE, DB.USERNAME,DB.PASSWORD).geConnection()
               .prepareStatement(SQL.MEMBER_DELETE);
         pstmt.setString(1,id );
         rs=String.valueOf(pstmt.executeUpdate());
         
      } catch (Exception e) {
         e.printStackTrace();
      }
      return rs;
   }
}