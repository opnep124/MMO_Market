package model;

import java.math.BigDecimal;

public class User {
    private int userId;
    private String login;
    private String name;
    private String email;
    private String phone;
    private String avatar;
    private BigDecimal accountBalance;
    private boolean flag;
    private int roleId;
    private String password;

    // Getters & Setters
    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }
    public String getLogin() { return login; }
    public void setLogin(String login) { this.login = login; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }
    public String getAvatar() { return avatar; }
    public void setAvatar(String avatar) { this.avatar = avatar; }
    public BigDecimal getAccountBalance() { return accountBalance; }
    public void setAccountBalance(BigDecimal accountBalance) { this.accountBalance = accountBalance; }
    public boolean isFlag() { return flag; }
    public void setFlag(boolean flag) { this.flag = flag; }
    public int getRoleId() { return roleId; }
    public void setRoleId(int roleId) { this.roleId = roleId; }
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
}
