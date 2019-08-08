package certify;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.Controller;
import common.RequestMapping;
import common.Util;



@RequestMapping("/certify/certify_add2.do")
public class CtrlAdd2 implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("�߰� ��");

		System.out.println("���� �߰� ����");
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

		
		
	
		System.out.println("���� DB insert ����");
		String details = Util.h(mpr.getParameter("details"));
		CertifyVO vo = new CertifyVO();
		
		 vo.setSerialNo(Util.parseInt(mpr.getParameter("certify_serialNo")));
		 vo.setHelperID(mpr.getParameter("certify_helperID"));
		 vo.setDetails(details);
		 vo.setHousePlace(mpr.getParameter("housePlace"));
		 vo.setCertify_photo_ofn(ofn);
		 vo.setCertify_photo_fsn(fsn);
		 System.out.println(vo.getHelperID());
		 CertifyDAO dao = new CertifyDAO_OracleImpl();
		 dao.insert(vo);
		return "redirect:/matching/matching_acceptance.jsp";
	}

	

}
