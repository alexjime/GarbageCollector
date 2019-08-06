package certify;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.Controller;
import common.RequestMapping;
import common.Util;


@RequestMapping("/certify/certify_update2.do")
public class CtrlUpdate2 implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
		System.out.println("���� ��");

		System.out.println("���� ����");

		// fileup ���͸��� ���� ������ġ (������) ���� �ľ��Ѵ�.
		String path = request.getServletContext().getRealPath("/assets/img");
		System.out.println( path );
		
		// cos.jar���� �����Ǵ� Ŭ����
		// ��� �ø� �� �̸��� ������ �÷��� �̸��� �ٸ� �� �ִ�.
		MultipartRequest mpr = new MultipartRequest( request , path , 1024*1024*20 , "UTF-8" ,
				new DefaultFileRenamePolicy()); // �� �̸��� ��ĥ �� �̸� �ٲ㼭 �÷��ش�.
		// new DefaultFileRenamePolicy() ��ſ� null���� �ָ� �����.
		// ���ε��� ���� ���� �̸� 
		String ofn = mpr.getOriginalFileName("photo");
		// �ٲ� �̸�
		String fsn = mpr.getFilesystemName("photo");
		System.out.println(ofn+"->"+fsn);
		//MultipartRequest ���� request.getParameter ������ .
		// ��� MultipartRequest ���� getParameter�� ����.
		// �ѱ�ó���� ���ο��� ���ִ���(UTF-8�� �����ؼ�)
		String title = mpr.getParameter("title");
		
		
		System.out.println(mpr.getParameter("certify_helperID"));
		System.out.println("���� DB ������Ʈ ����");
		String details = Util.h(mpr.getParameter("details"));
		System.out.println(details);
		CertifyVO vo = new CertifyVO();
		System.out.println("mpr get param certify no"+mpr.getParameter("certify_serialNo"));
		 vo.setSerialNo(Util.parseInt(mpr.getParameter("certify_serialNo")));
		 System.out.println("serialNo after set: " + vo.getSerialNo());
		 vo.setHelperID("certify_helperID");
		 
		 vo.setDetails(details);
		 vo.setHousePlace(mpr.getParameter("housePlace"));
		 System.out.println(mpr.getParameter("housePlace"));
		 vo.setCertify_photo_ofn(ofn);
		 vo.setCertify_photo_fsn(fsn);
		 CertifyDAO dao = new CertifyDAO_OracleImpl();
		 System.out.println(vo.getDetails());
		 dao.update(vo);
		 return "redirect:/certify/certify_list.jsp";
	}
}
