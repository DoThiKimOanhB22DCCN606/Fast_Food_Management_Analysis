<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Đăng ký tài khoản</title>
    <style>
        body { font-family: Arial, sans-serif; padding: 20px; }
        form { max-width: 400px; margin: 0 auto; border: 1px solid #ccc; padding: 20px; border-radius: 5px; }
        div { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; font-weight: bold; }
        input, select { width: 100%; padding: 8px; box-sizing: border-box; } /* Thêm select vào CSS */
        button { width: 100%; padding: 10px; background-color: #28a745; color: white; border: none; cursor: pointer; }
        button:hover { background-color: #218838; }
        .error { color: red; font-size: 0.9em; text-align: center;}
    </style>
</head>
<body>
    <h2 style="text-align: center;">Đăng Ký Tài Khoản</h2>
    
    <% String err = request.getParameter("err"); %>
    <% if("exist".equals(err)) { %>
        <p class="error">Tên đăng nhập đã tồn tại!</p>
    <% } else if("fail".equals(err)) { %>
        <p class="error">Đăng ký thất bại, vui lòng thử lại.</p>
    <% } %>

    <form action="doRegister.jsp" method="POST">
        <div>
            <label>Vai trò:</label>
            <select name="role">
                <option value="Customer">Khách hàng</option>
                <option value="Shipper">Nhân viên giao hàng </option>
                <option value="Staff">Nhân viên cửa hàng</option>
            </select>
        </div>

        <div>
            <label>Họ và Tên:</label>
            <input type="text" name="fullname" required>
        </div>
        <div>
            <label>Tên đăng nhập:</label>
            <input type="text" name="username" required>
        </div>
        <div>
            <label>Mật khẩu:</label>
            <input type="password" name="password" required>
        </div>
        <div>
            <label>Số điện thoại:</label>
            <input type="text" name="number" required>
        </div>
        <div>
            <label>Địa chỉ:</label>
            <input type="text" name="address" required>
        </div>
        <div>
            <label>Ngày sinh:</label>
            <input type="date" name="birth" required>
        </div>
        
        <button type="submit">Đăng Ký</button>
        
        <p style="text-align: center; margin-top: 15px;">
            Đã có tài khoản? <a href="Login.jsp">Đăng nhập ngay</a>
        </p>
    </form>
</body>
</html>