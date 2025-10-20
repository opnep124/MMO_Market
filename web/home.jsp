<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>MMO Market - Home</title>
<link rel="stylesheet" href="css/home.css">
<style>
/* reset cơ bản */
html, body {
    margin: 0;
    padding: 0;
    height: 100%;
}

/* wrapper tổng */
.wrapper {
    display: flex;
    flex-direction: column;
    min-height: 100vh; /* chiếm toàn bộ chiều cao viewport */
}

/* nội dung chính */
.content {
    flex: 1; /* chiếm phần còn lại giữa header và footer */
    padding: 20px;
    background: #f9f9f9;
}

/* footer tách riêng trong footer.jsp sẽ tự động xuống dưới */
</style>
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
                <div class="item"><img src="https://via.placeholder.com/150"><p>SP1</p></div>
                <div class="item"><img src="https://via.placeholder.com/150"><p>SP2</p></div>
                <div class="item"><img src="https://via.placeholder.com/150"><p>SP3</p></div>
                <div class="item"><img src="https://via.placeholder.com/150"><p>SP4</p></div>
            </div>

            <h2>Dịch vụ tiêu biểu</h2>
            <div class="products-list">
                <div class="item"><img src="https://via.placeholder.com/150"><p>DV1</p></div>
                <div class="item"><img src="https://via.placeholder.com/150"><p>DV2</p></div>
                <div class="item"><img src="https://via.placeholder.com/150"><p>DV3</p></div>
                <div class="item"><img src="https://via.placeholder.com/150"><p>DV4</p></div>
            </div>
        </section>
    </div>
</div>


    <!-- footer -->
    <jsp:include page="footer.jsp" />
</div>

<script>
    const modal = document.getElementById("profileModal");
    document.getElementById("btnProfile")?.addEventListener('click', () => { modal.style.display='block'; });
    window.addEventListener('click', (event) => { if(event.target==modal) modal.style.display='none'; });
</script>

</body>
</html>
