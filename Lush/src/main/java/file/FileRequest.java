package file;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.Enumeration;

public class FileRequest {

    public static String[] createFileURL(HttpServletRequest request) throws Exception{

        String[] uploadURL = new String[5];
        //파일 경로
        String savePath = "D:\\LushUpload\\event";
        File saveDir = new File(savePath);
        if (!saveDir.exists()) saveDir.mkdirs();

        int maxPostSize = 5 * 1024 * 1024;
        String encoding = "UTF-8";
        FileRenamePolicy policy = new DefaultFileRenamePolicy();
        MultipartRequest mrequest = new MultipartRequest(request, savePath, maxPostSize, encoding, policy);

        Enumeration en =  mrequest.getFileNames();
        int n = 0;
        while( en.hasMoreElements() ) {
            String name = (String) en.nextElement();
            String filesystemName = mrequest.getFilesystemName(name);
            uploadURL[n++] = savePath + "\\" + filesystemName;
        }

        return uploadURL;
    }
}
