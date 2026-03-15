package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Member;
import model.Staff; // Bổ sung import Staff

public class MemberDAO extends DAO {

    public MemberDAO() {
        super();
    }

    /**
     * Kiem tra dang nhap 
     */
    public Member checkLogin(String username, String password) {
        Member member = null; 
        
        String sql = "SELECT * FROM tblMember WHERE Username = ? AND Password = ? AND Role = 'Staff'";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            // Nếu tìm thấy 1 dòng
            if (rs.next()) {
                // Khởi tạo Staff 
                member = new Staff(); 
                
                member.setId(rs.getInt("ID"));
                member.setFullname(rs.getString("Fullname"));
                member.setRole(rs.getString("Role"));
                member.setUsername(rs.getString("Username"));
                member.setAddress(rs.getString("Address"));
                member.setCode(rs.getString("Code"));
                member.setNumber(rs.getString("Number"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return member; 
    }
    
    // Hàm kiểm tra username đã tồn tại chưa
    public boolean checkUsernameExist(String username) {
        String sql = "SELECT * FROM tblMember WHERE Username = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return true; // Đã tồn tại
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false; // Chưa tồn tại
    }
     
    // đăng ký thành viên mới
    public boolean registerMember(Member m) {
        String sql = "INSERT INTO tblMember(Code, Username, Password, Fullname, Role, Address, Number, Birth) VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, m.getCode());
            ps.setString(2, m.getUsername());
            ps.setString(3, m.getPassword());
            ps.setString(4, m.getFullname());
            ps.setString(5, m.getRole());
            ps.setString(6, m.getAddress());
            ps.setString(7, m.getNumber());
            ps.setDate(8, new java.sql.Date(m.getBirth().getTime()));
            
            int result = ps.executeUpdate();
            return result > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}