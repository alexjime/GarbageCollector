package matching;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Controller;
import common.RequestMapping;
import customer.CustomerApplyVO;


@RequestMapping("/matching_suggetion_list.do")
public class CtrlAddSuggetion implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//??�??? �?�? ?��??
		//??�??? �?�? ctrl?? �?�?????
      /*
         1. ??�??? �?�?
         select count(*) from customer where customer_phone = ?
         if(rs.hasnext())
            update customer set customer_addr_front=?, customer_addr_detail=? where customer_phone = ?
            insert into customer_apply
         else
            insert into customer
            insert into customer_apply

         2.
         select serialNo, customer_addr_front from customer_apply where customer_phone = ? order by customer_apply_day desc
         '�?�? ??�??? serialNo' = rs?? 첫�?�? 거�?? serialNo
         '�?�? ??�??? customer_addr_front' = rs?? 첫�?�? 거�?? serialNo
         '??주�??/??�??��??' = customer_addr_front.�???1
         '??머�???' = customer_addr_front.�???2

         for�? �?�? ?�거 ?��?��??�?
         INSERT INTO table_a
( title, name, regdate, register, memberid, categoryid )
SELECT title, name, regdate, register, memberid, categoryid
FROM table_b
WHERE categoryid=10

         rs = select helperID  from helper where (wish_addr_front1 = ?'??주�??/??�??��??' and wish_addr_detail1 =?'??머�???')
         or (wish_addr_front2 = ?'??주�??/??�??��??' and wish_addr_detail2 =?'??머�???')
         or (wish_addr_front3 = ?'??주�??/??�??��??' and wish_addr_detail3 =?'??머�???');

         for rs{
            insert into matching(serialNo,helperID,suggestion,acceptance) values (?'�?�? ??�??? serialNo',?'rs.helperID',0,0);
         }

      */

      /*
          ???�리?��?? (??????�?)
          helperVO_list = select * from helper where  helperID in
          (select helperID  from matching where serialNo = ?'serialNo' and suggestion =1 and acceptance =0)
       */

		HttpSession session = request.getSession();
		String auth ="helper";//= null;
		String helperID ="gobaksa4@naver.com";//= null;
		try{
//         auth = (String)session.getAttribute("auth");
//         helperID =  (String)session.getAttribute("id");
			if(auth==null||!auth.equals("helper")||helperID==null||helperID.equals("")){
				response.sendRedirect("loginform.jsp"); //login.jsp�? �?�?
			}
		}catch(Exception e){
			response.sendRedirect("loginform.jsp"); //login.jsp�? �?�?
		}

		String l = null;

      /*
         select * from customer_apply
           where serialNo in (select serialNo from matching where helperID = ?'helperID' and suggestion =0 and acceptance =0
        */
		MatchingDAO dao = new Matching_OracleImpl();
		List<CustomerApplyVO> rl = dao.suggestion_list(helperID);

		if(rl.size() > 0){
			System.out.println("matching_suggestion_list: " + rl.toString());
			request.setAttribute("rl", rl);
		}

		System.out.println("matching_suggestion_list.do");
		return "/matching/matching_suggetion.jsp";

	}

}