package admin.controller.books;

import admin.dao.books_dao;
import admin.dao.goods_dao;
import admin.entity.books;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.List;

@WebServlet("/admin/booksadd")
public class booksadd_servlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //判断请求是否为multipart请求
        if( !ServletFileUpload.isMultipartContent(req)){
            throw new RuntimeException("当前请求不支持文件上传");
        }

        String fileName = "";//文件名
        String fileValue = "";//文件值
        books book = new books();

        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);

        //设置每一个item的头部字符编码集 可以解决文件名的中文乱码问题
        upload.setHeaderEncoding("utf-8");
        //单位 【字节】 本例设置边界值为1M
        factory.setSizeThreshold(1024 * 1024 * 1);
        //设置临时文件
        String tempPath = this.getServletContext().getRealPath("/temp");
        File temp = new File(tempPath);
        factory.setRepository(temp);
        //设置单个上传文件的最大边界值 5M
        upload.setFileSizeMax(1024 * 1024 * 5);

        try {
            List<FileItem> items = upload.parseRequest(req);//解析请求 获取到所有的item
            //遍历item
            for(FileItem item : items){
                if(item.isFormField()){
                    fileName = item.getFieldName();
                    fileValue = item.getString("utf-8");  //获取表单项的值 防止表单中上传的值携带中文
                    if(fileName.equals("bid"))
                        book.setBid(fileValue);
                    if(fileName.equals("bname"))
                        book.setBname(fileValue);
                    if(fileName.equals("author"))
                        book.setAuthor(fileValue);
                    if(fileName.equals("quantity"))
                        book.setQuantity(Integer.valueOf(fileValue));
                    book.setBorrow(0);
                }else{  // 如果是上传文件，则保存在服务器端应用根目录
                    // 获得全路径文件名
                    fileName = item.getName();
                    // 截取文件名
                    fileName = fileName.substring(fileName.lastIndexOf("\\") + 1);

                    // 将文件保存到指定的路径
                    File file = new File(getServletContext().getRealPath("/images"),fileName);
                    fileName = "/MyWeb/images/"+fileName;
                    book.setImg(fileName);

                    //获取输入流 其中有上传文件的内容
                    InputStream is = item.getInputStream();

                    //创建文件输出流
                    OutputStream os = new FileOutputStream(file);
                    //将输入流中的数据写入输出流
                    int len = -1;
                    byte[] buf = new byte[1024];
                    while ((len = is.read(buf)) != -1){
                        os.write(buf,0,len);
                    }
                    //关闭流
                    os.close();
                    is.close();

                    //上传商品
                    int count = 0;
                    books_dao dao = new books_dao();
                    count = dao.AddBooks(req,book);
                    if( count == 1)
                        resp.sendRedirect("/MyWeb/admin/books_manage/books_index.jsp");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
