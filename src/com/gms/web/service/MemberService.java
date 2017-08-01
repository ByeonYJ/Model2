package com.gms.web.service;

import java.util.List;

import com.gms.web.domain.MemberBean;

public interface MemberService {
   public String addMember(MemberBean bean);
   public List<MemberBean> list();
   public List<MemberBean> findByName(String name);
   public MemberBean findById(String id);
   public String count();
   public String modify(MemberBean bean);
   public String remove(String id);
   public String login(MemberBean bean);//password를 감추기 위해서 login을 bean으로 받는다
}