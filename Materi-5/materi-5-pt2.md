## **Materi SQL: COUNT, DISTINCT, dan NVL**
Dalam SQL, ada beberapa fungsi penting yang digunakan untuk menghitung data dan menangani nilai kosong (`NULL`). Kali ini, kita akan membahas **COUNT, DISTINCT, dan NVL**.

---

## **1. COUNT()**
Fungsi **`COUNT()`** digunakan untuk menghitung jumlah baris dalam suatu tabel. COUNT bisa digunakan dengan berbagai cara:
- Menghitung semua baris.
- Menghitung baris dengan nilai tertentu (tanpa `NULL`).
- Menggunakan `DISTINCT` untuk menghitung nilai unik.

### **Sintaks COUNT()**
```sql
SELECT COUNT(kolom) FROM tabel;
```

### **Contoh Penggunaan COUNT**
Misalkan kita memiliki tabel **employees**:

| employee_id | name  | department_id | salary  |
|------------|------|--------------|--------|
| 1          | Andi  | 101          | 5000   |
| 2          | Budi  | 101          | NULL   |
| 3          | Citra | 102          | 7000   |
| 4          | Dewi  | NULL         | 8000   |
| 5          | Eka   | 103          | 5500   |

#### **🔹 Contoh 1: Menghitung Semua Baris**
```sql
SELECT COUNT(*) AS total_karyawan FROM employees;
```

#### **🔹 Contoh 2: Menghitung Karyawan dengan Gaji (Tanpa `NULL`)**
```sql
SELECT COUNT(salary) AS jumlah_gaji FROM employees;
```

---

## **2. DISTINCT**
Fungsi **`DISTINCT`** digunakan untuk **menghapus duplikasi** dan hanya mengambil nilai yang unik dari sebuah kolom.

### **Sintaks DISTINCT**
```sql
SELECT DISTINCT kolom FROM tabel;
```

### **Contoh Penggunaan DISTINCT**
#### **🔹 Contoh 1: Menampilkan Departemen Unik**
```sql
SELECT DISTINCT department_id FROM employees;
```

#### **🔹 Contoh 2: Menghitung Jumlah Departemen Unik (Tanpa `NULL`)**
```sql
SELECT COUNT(DISTINCT department_id) AS jumlah_departemen FROM employees;
```

---

## **3. NVL()**
Fungsi **`NVL()`** digunakan untuk menggantikan nilai `NULL` dengan nilai lain.

### **Sintaks NVL()**
```sql
SELECT NVL(kolom, nilai_pengganti) FROM tabel;
```

### **Contoh Penggunaan NVL**
#### **🔹 Contoh 1: Mengganti NULL dengan Angka Default**
```sql
SELECT name, NVL(salary, 0) AS salary_fixed FROM employees;
```

#### **🔹 Contoh 2: Mengganti NULL dengan Teks Default**
```sql
SELECT name, NVL(department_id, 'Belum Ditentukan') AS departemen
FROM employees;
```

💡 **NVL() hanya berfungsi di Oracle.** Untuk SQL Server, gunakan `ISNULL()`, dan untuk MySQL gunakan `IFNULL()`.

---

## **4. Menggabungkan COUNT, DISTINCT, dan NVL**
```sql
SELECT
    COUNT(*) AS total_karyawan,
    COUNT(DISTINCT department_id) AS jumlah_departemen,
    COUNT(NVL(salary, 0)) AS jumlah_gaji_terisi
FROM employees;
```

---

## **5. Kesimpulan**
| Fungsi | Kegunaan |
|--------|----------|
| **COUNT()** | Menghitung jumlah baris, dengan atau tanpa `NULL`. |
| **DISTINCT** | Menghapus nilai duplikat dalam hasil query. |
| **NVL()** | Mengganti `NULL` dengan nilai yang ditentukan. |

✅ **COUNT** berguna untuk menghitung data.  
✅ **DISTINCT** digunakan untuk mendapatkan data unik.  
✅ **NVL** digunakan untuk menangani nilai `NULL`.  

---

