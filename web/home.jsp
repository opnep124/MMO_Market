<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>MMO Market - Home</title>
<link rel="stylesheet" href="css/home.css">
</head>
<body>

<div class="wrapper">
    <!-- header -->
    <jsp:include page="header.jsp" />

    <div class="content">
        <div class="content-center">
            <!-- 1. Tìm kiếm -->
            <section class="search-section">
                <div class="dropdowns">
                    <select>
                        <option value="">Sản phẩm/Dịch vụ</option>
                        <option value="sp1">Sản phẩm 1</option>
                        <option value="sp2">Sản phẩm 2</option>
                        <option value="dv1">Dịch vụ 1</option>
                    </select>
                    <select>
                        <option value="">Phân loại 1</option>
                        <option value="cat1">Loại 1</option>
                        <option value="cat2">Loại 2</option>
                    </select>
                    <select>
                        <option value="">Phân loại 2</option>
                        <option value="catA">Loại A</option>
                        <option value="catB">Loại B</option>
                    </select>
                </div>
                <div class="search-input">
                    <input type="text" placeholder="Nhập sản phẩm/gian hàng/người bán">
                    <button>Tìm kiếm</button>
                </div>
            </section>

            <!-- 2. Danh sách sản phẩm/dịch vụ -->
            <section class="products-section">
                <h2>Sản phẩm tiêu biểu</h2>
                <div class="products-list">
                    <div class="item">
                        <img src="https://taphoammo.net/images/categories/mail.png" alt="SP1">
                        <p class="item-name">SP1</p>
                        <p class="item-desc">Mô tả ngắn gọn về sản phẩm 1</p>
                    </div>
                    <div class="item">
                        <img src="https://taphoammo.net/images/categories/soft2.png" alt="SP2">
                        <p class="item-name">SP2</p>
                        <p class="item-desc">Mô tả ngắn gọn về sản phẩm 2</p>
                    </div>
                    <div class="item">
                        <img src="https://taphoammo.net/images/categories/account.png" alt="SP3">
                        <p class="item-name">SP3</p>
                        <p class="item-desc">Mô tả ngắn gọn về sản phẩm 3</p>
                    </div>
                    <div class="item">
                        <img src="https://taphoammo.net/images/categories/more.png" alt="SP4">
                        <p class="item-name">SP4</p>
                        <p class="item-desc">Mô tả ngắn gọn về sản phẩm 4</p>
                    </div>
                </div>

                <h2>Dịch vụ tiêu biểu</h2>
                <div class="products-list">
                    <div class="item">
                        <img src="https://taphoammo.net/images/categories/boost2.png" alt="DV1">
                        <p class="item-name">DV1</p>
                        <p class="item-desc">Mô tả ngắn gọn về dịch vụ 1</p>
                    </div>
                    <div class="item">
                        <img src="https://taphoammo.net/images/categories/soft-service.png" alt="DV2">
                        <p class="item-name">DV2</p>
                        <p class="item-desc">Mô tả ngắn gọn về dịch vụ 2</p>
                    </div>
                    <div class="item">
                        <img src="https://taphoammo.net/images/categories/block2.png" alt="DV3">
                        <p class="item-name">DV3</p>
                        <p class="item-desc">Mô tả ngắn gọn về dịch vụ 3</p>
                    </div>
                    <div class="item">
                        <img src="https://taphoammo.net/images/categories/more-service.png" alt="DV4">
                        <p class="item-name">DV4</p>
                        <p class="item-desc">Mô tả ngắn gọn về dịch vụ 4</p>
                    </div>
                </div>
            </section>
        </div>
    </div>

    <!-- footer -->
    <jsp:include page="footer.jsp" />
</div>

</body>
</html>
