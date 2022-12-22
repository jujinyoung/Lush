package file;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

public class FileRequest {

    private final static String savePath = "D:\\LushUpload\\event";

    public static MultipartRequest getFileRequest(HttpServletRequest request) throws IOException {

        //파일 경로
        File saveDir = new File(savePath);
        if (!saveDir.exists()) saveDir.mkdirs();

        int maxPostSize = 5 * 1024 * 1024;
        String encoding = "UTF-8";
        FileRenamePolicy policy = new DefaultFileRenamePolicy();
        MultipartRequest mrequest = new MultipartRequest(request, savePath, maxPostSize, encoding, policy);
        return mrequest;
    }

    public static List<String> createFileURL(MultipartRequest mrequest) throws Exception{
        List<String> uploadURL = new ArrayList<>();

        Enumeration en =  mrequest.getFileNames();
        while( en.hasMoreElements() ) {
            String name = (String) en.nextElement();
            String filesystemName = mrequest.getFilesystemName(name);
            if (filesystemName!=null) uploadURL.add(savePath + "\\" + filesystemName);
        }

        return uploadURL;
    }
}
