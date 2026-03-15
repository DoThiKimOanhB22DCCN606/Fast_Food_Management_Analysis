<%@page import="java.sql.Date"%>
<%@page import="dao.MemberDAO"%>
<%@page import="model.Member"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    
    //Lấy dữ liệu từ form
    String role = request.getParameter("role"); 
    String fullname = request.getParameter("fullname");
    String username = request.getParameter("username");
    String pass = request.getParameter("password");
    String phone = request.getParameter("number");
    String address = request.getParameter("address");
    String birthStr = request.getParameter("birth");
    
    MemberDAO dao = new MemberDAO();
    
    //Kiểm tra username trùng
    if(dao.checkUsernameExist(username)) {
        response.sendRedirect("Register.jsp?err=exist");
        return;
    }
    
    //Tạo đối tượng Member
    Member m = new Member();
    m.setFullname(fullname);
    m.setUsername(username);
    m.setPassword(pass);
    m.setNumber(phone);
    m.setAddress(address);
    m.setRole(role); 
    
    // Xử lý ngày sinh
    try {
        m.setBirth(Date.valueOf(birthStr));
    } catch(Exception e) {
        m.setBirth(new java.util.Date());
    }
    
    // Sinh mã tự động theo Vai trò (KH, NV, SH)
    String prefix = "KH";
    if("Staff".equals(role)) {
        prefix = "NV";
    } else if("Shipper".equals(role)) {
        prefix = "SH";
    }
    
    // Tạo số ngẫu nhiên 5 chữ số cho mã
    long randomNum = System.currentTimeMillis() % 100000; 
    m.setCode(prefix + randomNum);
    
    //Gọi DAO lưu xuống DB
    boolean result = dao.registerMember(m);
    
    if(result) {
        response.sendRedirect("Login.jsp?msg=reg_success");
    } else {
        response.sendRedirect("Register.jsp?err=fail");
    }
%>