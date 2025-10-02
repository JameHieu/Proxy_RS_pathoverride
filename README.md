# 📖 Hướng dẫn sử dụng file `Redshift Path Override Setup.bat`

## 🎯 Mục đích

File batch này được tạo ra để **quản lý biến môi trường `REDSHIFT_PATHOVERRIDE_FILE`** trên Windows, giúp Redshift đọc file `redshift_path_override.txt` nhằm thay đổi đường dẫn Proxy.

Bạn có thể:

1. Cập nhật biến môi trường để trỏ tới file override hiện tại
2. Tạo file override mới (mapping Old Path → New Path)
3. Reset, xóa hẳn biến môi trường này khỏi hệ thống

---

## 🖥 Cách chạy

- Nhấp đôi chuột vào file `.bat` hoặc chạy bằng **Command Prompt**
- Khi mở, màn hình CMD hiện ra với các chức năng :

```
[1] Cap nhat bien moi truong de tro toi file override hien tai
[2] Tao file override moi
[3] Reset (xoa hoan toan REDSHIFT_PATHOVERRIDE_FILE khoi Windows)
```

👉 Nhập số `1`, `2` hoặc `3` rồi bấm **Enter**.

---

## 🔧 Các chức năng chi tiết

### 1️⃣ Cập nhật biến môi trường

- Chọn **[1]**
- Script sẽ kiểm tra có file `redshift_path_override.txt` trong thư mục hiện tại không.
- Nếu có, nó sẽ gán biến `REDSHIFT_PATHOVERRIDE_FILE` = đường dẫn tới file đó (cả session hiện tại và lưu trong Windows).
- Nếu không có, báo lỗi.

➡ Dùng khi bạn đã có sẵn file override và chỉ muốn Redshift nhận lại.

---

### 2️⃣ Tạo file override mới

- Chọn **[2]**
- Script sẽ xóa file override cũ (nếu có).
- Sau đó, bạn nhập lần lượt:
    
    ```
    Nhap Old Proxy Path (go "Done" de ket thuc):
    ```
    
    - Điền đường dẫn Proxy cũ → Enter
    - Tiếp theo nhập đường dẫn Proxy mới tương ứng → Enter
    
    Ví dụ:
    
    ```
    Old: D:\Assets\Proxy\House\
    New: E:\Server\Proxy\House\
    
    ```
    
- Mỗi cặp OLD_PATH → NEW_PATH sẽ được lưu vào file `redshift_path_override.txt`.
- Khi xong, gõ **Done** để kết thúc.
- Script sẽ tạo biến môi trường `REDSHIFT_PATHOVERRIDE_FILE` trỏ tới file mới.

⚠️ Lưu ý: **Không xóa file .txt này**, vì Redshift đọc trực tiếp từ nó.

---

### 3️⃣ Reset (xóa biến môi trường)

- Chọn **[3]**
- Script xóa biến `REDSHIFT_PATHOVERRIDE_FILE` khỏi session hiện tại và khỏi Registry Windows.
- Nếu vẫn còn thấy trong danh sách biến môi trường, bạn cần **đăng xuất hoặc mở lại CMD** để cập nhật.

➡ Dùng khi bạn muốn gỡ bỏ hoàn toàn override khỏi hệ thống.

---

## ✅ Lời khuyên sử dụng

- Khi thay đổi file override, nhớ **tắt và mở lại phần mềm** (Houdini, Maya, C4D…) để Redshift nhận giá trị mới.
- Nên chạy file `.bat` trong cùng thư mục với `redshift_path_override.txt`.
- Nếu dùng nhiều máy trong studio, có thể copy file override và `.bat` sang để đồng bộ.
