package admin.controller.goods;

import admin.dao.goods_dao;
import admin.entity.goods;
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

@WebServlet("/admin/goodsadd")
public class goodsadd_servlet extends HttpServlet {
    //文件上传只能用post方式接收
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
        goods good = new goods();//good实例对象

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
                    if(fileName.equals("gid"))
                        good.setGid(fileValue);
                    if(fileName.equals("gname"))
                        good.setGname(fileValue);
                    if(fileName.equals("price"))
                        good.setPrice(Double.parseDouble(fileValue));
                    if(fileName.equals("type"))
                        good.setType(Integer.valueOf(fileValue));
                    if(fileName.equals("quantity"))
                        good.setQuantity(Integer.valueOf(fileValue));
                    good.setSold(0);
                }else{  // 如果是上传文件，则保存在服务器端应用根目录
                    // 获得全路径文件名
                    fileName = item.getName();
                    // 截取文件名
                    fileName = fileName.substring(fileName.lastIndexOf("\\") + 1);

                    // 将文件保存到指定的路径
                    File file = new File(getServletContext().getRealPath("/images"),fileName);
                    fileName = "/MyWeb/images/"+fileName;
                    good.setImg(fileName);

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
                    goods_dao dao = new goods_dao();
                    count = dao.AddGoods(req,good);
                    if(good.getType().equals(1) && count == 1)
                        resp.sendRedirect("/MyWeb/admin/goods_manage/snacks_index.jsp");
                    else if(good.getType().equals(2) && count == 1)
                        resp.sendRedirect("/MyWeb/admin/goods_manage/livinggoods_index.jsp");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}