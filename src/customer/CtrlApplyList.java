package customer;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Controller;
import common.RequestMapping;
import customer.CustomerApplyVO;


@RequestMapping("/customer_apply_list.do")
public class CtrlApplyList implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("CtrlList");
		CustomerApplyDAO dao=new CustomerApplyDAO_OracleImpl();

		List<CustomerApplyVO> rl=dao.findAll_nohelper();
		request.setAttribute("rl", rl);
		System.out.println(rl);
		return "/customer/customer_list.jsp";
	}

}