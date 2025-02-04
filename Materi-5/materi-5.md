## **Fungsi GROUP dalam SQL (Aggregate Functions)**
Fungsi **GROUP** dalam SQL adalah fungsi agregasi yang digunakan untuk **melakukan operasi perhitungan pada sekelompok data** dalam tabel. Fungsi-fungsi ini sering digunakan bersamaan dengan **GROUP BY** untuk mengelompokkan data berdasarkan kolom tertentu.

---

## **1. Jenis-Jenis Fungsi GROUP**
Fungsi GROUP dalam SQL meliputi:
| Fungsi | Deskripsi |
|--------|----------|
| **AVG()** | Menghitung rata-rata nilai dalam kelompok data. |
| **COUNT()** | Menghitung jumlah baris dalam kelompok data. |
| **MIN()** | Mengambil nilai minimum dari kelompok data. |
| **MAX()** | Mengambil nilai maksimum dari kelompok data. |
| **SUM()** | Menjumlahkan nilai dalam kelompok data. |
| **VARIANCE()** | Menghitung varians dari kelompok data. |
| **STDDEV()** | Menghitung standar deviasi dari kelompok data. |

---

## **2. Studi Kasus: Departemen dan Gaji Karyawan**
Misalkan kita memiliki **tabel `employees`** dan **tabel `departments`**.

### **Tabel `employees`**
| employee_id | name  | department_id | salary |
|------------|------|--------------|--------|
| 1          | Andi  | 101          | 5000   |
| 2          | Budi  | 101          | 6000   |
| 3          | Citra | 102          | 7000   |
| 4          | Dewi  | 102          | 8000   |
| 5          | Eka   | 103          | 5500   |

### **Tabel `departments`**
| department_id | department_name |
|--------------|----------------|
| 101          | HR             |
| 102          | IT             |
| 103          | Finance        |

---

## **3. Contoh Penggunaan Fungsi GROUP dalam SQL**
### **🔹 3.1 Menghitung Rata-Rata Gaji per Departemen (`AVG`)**
```sql
SELECT department_id, AVG(salary) AS rata_rata_gaji
FROM employees
GROUP BY department_id;
```
#### **Hasil:**
| department_id | rata_rata_gaji |
|--------------|--------------|
| 101          | 5500         |
| 102          | 7500         |
| 103          | 5500         |

---

### **🔹 3.2 Menghitung Jumlah Karyawan per Departemen (`COUNT`)**
```sql
SELECT department_id, COUNT(employee_id) AS jumlah_karyawan
FROM employees
GROUP BY department_id;
```
#### **Hasil:**
| department_id | jumlah_karyawan |
|--------------|----------------|
| 101          | 2              |
| 102          | 2              |
| 103          | 1              |

---

### **🔹 3.3 Menentukan Gaji Tertinggi dan Terendah per Departemen (`MIN` dan `MAX`)**
```sql
SELECT department_id,
       MIN(salary) AS gaji_terendah,
       MAX(salary) AS gaji_tertinggi
FROM employees
GROUP BY department_id;
```

---

### **🔹 3.4 Menghitung Total Gaji per Departemen (`SUM`)**
```sql
SELECT department_id, SUM(salary) AS total_gaji
FROM employees
GROUP BY department_id;
```

---

### **🔹 3.5 Menghitung Varians dan Standar Deviasi Gaji per Departemen (`VARIANCE` dan `STDDEV`)**
```sql
SELECT department_id,
       VARIANCE(salary) AS varians_gaji,
       STDDEV(salary) AS stddev_gaji
FROM employees
GROUP BY department_id;
```

---

## **4. Menggabungkan Fungsi GROUP dengan JOIN**
Kita juga bisa menggunakan **JOIN** untuk menampilkan nama departemen.

```sql
SELECT d.department_name, COUNT(e.employee_id) AS jumlah_karyawan, AVG(e.salary) AS rata_rata_gaji
FROM employees e
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_name;
```

---

## **5. Kesimpulan**
| Fungsi GROUP | Kegunaan |
|-------------|---------|
| **AVG()** | Menghitung rata-rata nilai dalam kelompok data. |
| **COUNT()** | Menghitung jumlah data dalam kelompok. |
| **MIN()** | Mencari nilai minimum dalam kelompok. |
| **MAX()** | Mencari nilai maksimum dalam kelompok. |
| **SUM()** | Menjumlahkan nilai dalam kelompok. |
| **VARIANCE()** | Menghitung varians dalam kelompok. |
| **STDDEV()** | Menghitung standar deviasi dalam kelompok. |

Fungsi-fungsi ini **sering digunakan dengan `GROUP BY`** untuk mengelompokkan data dan mendapatkan informasi agregat.

