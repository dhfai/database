## **Alias dalam SQL (`AS`)**
**Alias** dalam SQL digunakan untuk memberikan **nama sementara** pada tabel atau kolom dalam sebuah query. Ini berguna untuk membuat **query lebih singkat, mudah dibaca, dan lebih rapi**, terutama saat menggunakan JOIN atau fungsi agregasi.

---

## **1. Alias untuk Kolom**
Alias untuk kolom digunakan ketika ingin menampilkan nama kolom dengan **nama yang lebih mudah dibaca** atau ketika menggunakan fungsi agregasi.

### **Sintaks Alias Kolom**
```sql
SELECT kolom AS alias_nama
FROM tabel;
```

---

### **Contoh Alias untuk Kolom**
Misalkan kita memiliki tabel **employees** seperti berikut:

| employee_id | full_name      | salary |
|------------|--------------|--------|
| 1          | Andi          | 5000   |
| 2          | Budi          | 6000   |
| 3          | Citra         | 7000   |

### **Query dengan Alias untuk Kolom**
```sql
SELECT full_name AS nama_karyawan, salary AS gaji
FROM employees;
```

### **Hasil**
| nama_karyawan | gaji  |
|--------------|------|
| Andi         | 5000 |
| Budi         | 6000 |
| Citra        | 7000 |

**Penjelasan:**
- **`full_name` diubah menjadi `nama_karyawan`**.
- **`salary` diubah menjadi `gaji`**.

---

## **2. Alias untuk Tabel**
Alias tabel berguna saat bekerja dengan **JOIN** atau saat tabel memiliki nama panjang.

### **Sintaks Alias Tabel**
```sql
SELECT A.kolom1, B.kolom2
FROM tabel1 AS A
JOIN tabel2 AS B
ON A.kolom_x = B.kolom_y;
```
- **`AS A`** adalah alias untuk `tabel1`.
- **`AS B`** adalah alias untuk `tabel2`.

---

### **Contoh Alias untuk Tabel dalam JOIN**
Misalkan kita memiliki tabel **employees** dan **departments**.

| employee_id | name  | department_id |
|------------|------|--------------|
| 1          | Andi  | 101          |
| 2          | Budi  | 102          |
| 3          | Citra | 101          |

| department_id | department_name |
|--------------|----------------|
| 101          | HR             |
| 102          | IT             |

### **Query dengan Alias untuk Tabel**
```sql
SELECT E.name AS employee_name, D.department_name AS dept_name
FROM employees AS E
JOIN departments AS D
ON E.department_id = D.department_id;
```

### **Hasil**
| employee_name | dept_name |
|--------------|---------|
| Andi         | HR      |
| Budi         | IT      |
| Citra        | HR      |

**Penjelasan:**
- **`employees` diberi alias `E`**, sehingga cukup menulis `E.name`.
- **`departments` diberi alias `D`**, sehingga cukup menulis `D.department_name`.

---

## **3. Alias tanpa `AS`**
Beberapa database (seperti MySQL) mengizinkan alias **tanpa menggunakan `AS`**, seperti:
```sql
SELECT full_name nama_karyawan, salary gaji
FROM employees;
```
Namun, menggunakan `AS` lebih disarankan karena lebih mudah dibaca.

---

## **Kesimpulan**
| Alias Type | Kegunaan |
|------------|----------|
| **Alias Kolom (`AS`)** | Mengubah nama kolom untuk tampilan yang lebih rapi. |
| **Alias Tabel (`AS`)** | Mempermudah penggunaan tabel dalam JOIN. |
| **Tanpa `AS`** | Bisa digunakan di beberapa database, tetapi kurang direkomendasikan. |

