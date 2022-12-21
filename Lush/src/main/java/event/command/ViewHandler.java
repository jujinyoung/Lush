package event.command;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;
import command.CommandHandler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.Enumeration;

public class ViewHandler implements CommandHandler {
    @Override
    public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

        String requestMethod = request.getMethod();
        String eventId = request.getParameter("eventID");

        if (requestMethod.equals("GET")){
            return "/event/view/"+ eventId +".jsp";
        }else if (requestMethod.equals("POST")){
            //파일
            String savePath = "D:\\LushUpload\\event";
            File saveDir = new File(savePath);
            if (!saveDir.exists()) saveDir.mkdirs();

            int maxPostSize = 5 * 1024 * 1024;
            String encoding = "UTF-8";
            FileRenamePolicy policy = new DefaultFileRenamePolicy();
            MultipartRequest mrequest = new MultipartRequest(request, savePath, maxPostSize, encoding, policy);

//            Enumeration en =  mrequest.getFileNames();
//            while( en.hasMoreElements() ) {
//                String name = (String) en.nextElement();
//                File uploadFile = mrequest.getFile(name);  // file1, file2, file3
//                String fileName = uploadFile.getName(); // 파일명
//                long fileLength = uploadFile.length();      // 파일크기
//
//                String filesystemName = mrequest.getFilesystemName(name);
//            }


            response.sendRedirect("/Lush/event/view.do?evendID="+eventId);
        }

        return null;
    }
}
