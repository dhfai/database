## **Klausa GROUP BY dan HAVING dalam SQL**

Dalam SQL, **GROUP BY** digunakan untuk mengelompokkan data berdasarkan satu atau lebih kolom, sedangkan **HAVING** digunakan untuk menyaring hasil setelah pengelompokan dilakukan.

---

## **1. Klausa GROUP BY**
### **Pengertian**
`GROUP BY` digunakan untuk **mengelompokkan data berdasarkan satu atau lebih kolom**. Klausa ini sering digunakan bersamaan dengan fungsi agregasi seperti `COUNT()`, `SUM()`, `AVG()`, `MAX()`, dan `MIN()`.

### **Sintaks GROUP BY**
```sql
SELECT kolom, fungsi_agregasi(kolom)
FROM tabel
GROUP BY kolom;
```

### **Contoh Penggunaan GROUP BY**
Misalkan kita memiliki tabel **employees**:

| employee_id | name  | department_id | salary |
|------------|------|--------------|--------|
| 1          | Andi  | 101          | 5000   |
| 2          | Budi  | 101          | 6000   |
| 3          | Citra | 102          | 7000   |
| 4          | Dewi  | 102          | 8000   |
| 5          | Eka   | 103          | 5500   |

#### **🔹 Contoh 1: Menghitung Jumlah Karyawan per Departemen**
```sql
SELECT department_id, COUNT(employee_id) AS jumlah_karyawan
FROM employees
GROUP BY department_id;
```

**Hasil:**
| department_id | jumlah_karyawan |
|--------------|----------------|
| 101          | 2              |
| 102          | 2              |
| 103          | 1              |

#### **🔹 Contoh 2: Menghitung Rata-Rata Gaji per Departemen**
```sql
SELECT department_id, AVG(salary) AS rata_rata_gaji
FROM employees
GROUP BY department_id;
```

**Hasil:**
| department_id | rata_rata_gaji |
|--------------|--------------|
| 101          | 5500         |
| 102          | 7500         |
| 103          | 5500         |

---

## **2. Klausa HAVING**
### **Pengertian**
`HAVING` digunakan untuk **menyaring hasil setelah GROUP BY diterapkan**. Berbeda dengan `WHERE`, yang digunakan sebelum pengelompokan, `HAVING` bekerja setelah agregasi dilakukan.

### **Sintaks HAVING**
```sql
SELECT kolom, fungsi_agregasi(kolom)
FROM tabel
GROUP BY kolom
HAVING kondisi;
```

### **Contoh Penggunaan HAVING**
#### **🔹 Contoh 1: Menampilkan Departemen dengan Lebih dari 1 Karyawan**
```sql
SELECT department_id, COUNT(employee_id) AS jumlah_karyawan
FROM employees
GROUP BY department_id
HAVING COUNT(employee_id) > 1;
```

**Hasil:**
| department_id | jumlah_karyawan |
|--------------|----------------|
| 101          | 2              |
| 102          | 2              |

#### **🔹 Contoh 2: Menampilkan Departemen dengan Rata-Rata Gaji di Atas 6000**
```sql
SELECT department_id, AVG(salary) AS rata_rata_gaji
FROM employees
GROUP BY department_id
HAVING AVG(salary) > 6000;
```

**Hasil:**
| department_id | rata_rata_gaji |
|--------------|--------------|
| 102          | 7500         |

---

## **3. Perbedaan WHERE dan HAVING**
| Klausa | Kegunaan |
|--------|----------|
| **WHERE** | Menyaring data sebelum dilakukan `GROUP BY`. |
| **HAVING** | Menyaring data setelah dilakukan `GROUP BY`. |

**Contoh Perbandingan:**
- Jika ingin menampilkan **karyawan dengan gaji di atas 5000**, gunakan `WHERE`:
  ```sql
  SELECT * FROM employees WHERE salary > 5000;
  ```
- Jika ingin menampilkan **departemen dengan rata-rata gaji di atas 6000**, gunakan `HAVING`:
  ```sql
  SELECT department_id, AVG(salary) AS rata_rata_gaji
  FROM employees
  GROUP BY department_id
  HAVING AVG(salary) > 6000;
  ```

---

## **4. Kesimpulan**
| Klausa | Kegunaan |
|--------|----------|
| **GROUP BY** | Mengelompokkan data berdasarkan kolom tertentu. |
| **HAVING** | Menyaring hasil setelah `GROUP BY` dilakukan. |
| **WHERE** | Menyaring data sebelum pengelompokan dilakukan. |

✅ **Gunakan `GROUP BY`** saat ingin mengelompokkan data berdasarkan kategori.  
✅ **Gunakan `HAVING`** saat ingin menyaring hasil agregasi.  
✅ **Gunakan `WHERE`** saat ingin menyaring data sebelum dilakukan pengelompokan.  

---

