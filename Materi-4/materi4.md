# INNER JOIN, OUTER JOIN, NATURAL JOIN, USING, dan ON

## Pengertian

Ketika bekerja dengan database relasional, sering kali kita perlu menggabungkan data dari beberapa tabel berdasarkan kolom yang memiliki hubungan. SQL menyediakan berbagai cara untuk melakukan ini, termasuk `INNER JOIN`, `OUTER JOIN`, `NATURAL JOIN`, `USING`, dan `ON`. Setiap metode memiliki fungsinya sendiri sesuai dengan kebutuhan penggabungan data.


## Summary: Kelebihan, Kekurangan, dan Kapan Menggunakannya

| JOIN Type      | Kelebihan | Kekurangan | Kapan Digunakan? |
|---------------|----------|-----------|----------------|
| **INNER JOIN** | Hanya menampilkan data yang cocok, lebih efisien | Data yang tidak cocok di kedua tabel akan hilang | Saat hanya ingin melihat data yang berelasi di kedua tabel |
| **OUTER JOIN** | Menampilkan semua data meskipun tidak ada kecocokan | Bisa menghasilkan banyak NULL jika banyak data tidak cocok | Jika ingin melihat semua data meskipun tidak memiliki pasangan |
| **NATURAL JOIN** | Otomatis mencocokkan kolom yang sama | Bisa salah jika ada lebih dari satu kolom dengan nama yang sama | Jika yakin ada satu kolom kunci yang cocok |
| **USING** | Eksplisit menyebutkan kolom yang dicocokkan | Tidak bisa digunakan jika kolom memiliki nama yang berbeda | Jika ingin memastikan kolom yang dipakai untuk join |
| **ON** | Fleksibel untuk mencocokkan nama kolom yang berbeda | Harus menentukan kondisi secara eksplisit | Jika kolom yang digunakan untuk join memiliki nama berbeda |
| **SELF JOIN** | Berguna untuk menampilkan hubungan dalam satu tabel | Bisa membingungkan jika tidak diberi alias tabel | Saat bekerja dengan data hierarki atau hubungan dalam satu tabel |

Dengan memahami perbedaan masing-masing tipe JOIN, kita dapat memilih metode yang paling sesuai dengan kebutuhan data yang akan kita analisis atau tampilkan dalam SQL.

## Kapan Menggunakan INNER JOIN, OUTER JOIN, NATURAL JOIN, USING, atau ON?

| Situasi | Gunakan |
|---------|------------|
| Hanya ingin menampilkan data yang cocok di kedua tabel | `INNER JOIN` |
| Ingin menampilkan semua data dari tabel kiri | `LEFT JOIN` |
| Ingin menampilkan semua data dari tabel kanan | `RIGHT JOIN` |
| Ingin menampilkan semua data dari kedua tabel | `FULL JOIN` |
| Kolom yang dicocokkan pasti sama | `NATURAL JOIN` |
| Ada lebih dari satu kolom yang sama, tetapi ingin mencocokkan kolom tertentu saja | `USING` |
| Nama kolom berbeda di kedua tabel, atau ada kondisi tambahan dalam JOIN | `ON` |


## Contoh Perbandingan JOIN dalam SQL

Misalkan kita memiliki dua tabel: **employees** dan **departments**.

### Tabel **employees**
| employee_id  | name   | department_id |
|-------------|-----------|--------------|
| 1           | Klara     | D001         |
| 2           | Emilia    | D002         |
| 3           | Robert    | D003         |
| 4           | Satria    | D004         |

### Tabel **departments**
| department_id | department_name |
|--------------|----------------|
| D001        | HR              |
| D002        | IT              |
| D003        | Finance         |

### 🔹 Contoh NATURAL JOIN
```sql
SELECT employee_id, name, department_name
FROM employees
NATURAL JOIN departments;
```
#### Hasil:
| employee_id | name   | department_name |
|------------|--------|---------------|
| 1          | Klara  | HR            |
| 2          | Emilia | IT            |
| 3          | Robert | Finance       |

**Penjelasan:**
- `NATURAL JOIN` otomatis mencocokkan tabel berdasarkan kolom dengan nama yang sama (`department_id`).


### 🔹 Contoh USING
```sql
SELECT employee_id, name, department_name
FROM employees
JOIN departments
USING (department_id);
```
#### Hasil:
| employee_id | name   | department_name |
|------------|--------|---------------|
| 1          | Klara  | HR            |
| 2          | Emilia | IT            |
| 3          | Robert | Finance       |

**Penjelasan:**
- Dengan `USING`, kita harus menyebutkan kolom yang akan dicocokkan (`department_id`).

### 🔹 Contoh ON
```sql
SELECT employees.name, departments.department_name
FROM employees
JOIN departments
ON employees.department_id = departments.department_id;
```
#### Hasil:
| name   | department_name |
|--------|---------------|
| Klara  | HR            |
| Emilia | IT            |
| Robert | Finance       |

**Kenapa menggunakan ON?**
- `ON` digunakan karena nama kolom berbeda di kedua tabel (`department_id` di `employees` dan `department_id` di `departments`).
- Memberikan fleksibilitas lebih jika ada kondisi tambahan yang ingin diterapkan.


### 🔹 Contoh INNER JOIN
```sql
SELECT employees.name, departments.department_name
FROM employees
INNER JOIN departments
ON employees.department_id = departments.department_id;
```
#### Hasil:
| name   | department_name |
|--------|---------------|
| Klara  | HR            |
| Emilia | IT            |
| Robert | Finance       |

**Penjelasan:**
- `INNER JOIN` hanya menampilkan data yang memiliki kecocokan di kedua tabel.
- Karyawan dengan `department_id` yang tidak ditemukan di tabel departments (misalnya Satria) tidak akan ditampilkan.

### 🔹 Contoh OUTER JOIN
#### 🔹 LEFT JOIN (LEFT OUTER JOIN)
```sql
SELECT employees.name, departments.department_name
FROM employees
LEFT JOIN departments
ON employees.department_id = departments.department_id;
```
#### Hasil:
| name   | department_name |
|--------|---------------|
| Klara  | HR            |
| Emilia | IT            |
| Robert | Finance       |
| Satria | NULL          |

**Penjelasan:**
- Semua karyawan ditampilkan, termasuk yang tidak memiliki departemen yang cocok.
- Satria tetap muncul, tetapi `department_name` bernilai `NULL` karena `department_id = D004` tidak ditemukan di tabel `departments`.

#### 🔹 RIGHT JOIN (RIGHT OUTER JOIN)
```sql
SELECT employees.name, departments.department_name
FROM employees
RIGHT JOIN departments
ON employees.department_id = departments.department_id;
```
#### Hasil:
| name   | department_name |
|--------|---------------|
| Klara  | HR            |
| Emilia | IT            |
| Robert | Finance       |
| NULL   | Operations    |

**Penjelasan:**
- Semua departemen ditampilkan, termasuk yang tidak memiliki karyawan yang cocok.
- Jika ada departemen yang tidak memiliki karyawan, maka `name` bernilai `NULL`.

#### 🔹 FULL JOIN (FULL OUTER JOIN)
```sql
SELECT employees.name, departments.department_name
FROM employees
FULL JOIN departments
ON employees.department_id = departments.department_id;
```
#### Hasil:
| name   | department_name |
|--------|---------------|
| Klara  | HR            |
| Emilia | IT            |
| Robert | Finance       |
| Satria | NULL          |
| NULL   | Operations    |

**Penjelasan:**
- Semua data dari kedua tabel ditampilkan.
- Satria tetap muncul meskipun tidak memiliki departemen.
- Jika ada departemen yang tidak memiliki karyawan, departemen tetap ditampilkan dengan nilai `NULL` pada kolom `name`.

## SELF JOIN dalam SQL

### 1. Apa Itu SELF JOIN?
`SELF JOIN` adalah teknik SQL yang digunakan untuk menggabungkan tabel dengan dirinya sendiri. Ini berguna ketika kita ingin membandingkan data dalam satu tabel atau menganalisis hubungan rekursif, seperti struktur hierarki karyawan dan manajer.

### 2. Sintaks SELF JOIN
```sql
SELECT A.kolom1, B.kolom2, ...
FROM tabel AS A
JOIN tabel AS B
ON A.kolom_x = B.kolom_y;
```
- Menggunakan alias (A dan B) untuk merujuk ke tabel yang sama dua kali.
- `ON` digunakan untuk menentukan cara tabel berelasi dengan dirinya sendiri.

### 3. Contoh SELF JOIN
#### Contoh: Menampilkan Karyawan dan Manajernya
Misalkan kita memiliki tabel `employees` yang menyimpan informasi karyawan dan siapa manajernya.

#### Tabel **employees**
| employee_id | name   | manager_id |
|------------|--------|------------|
| 1          | Klara  | NULL       |
| 2          | Emilia | 1          |
| 3          | Robert | 1          |
| 4          | Satria | 2          |
| 5          | Farah  | 2          |

#### Query SELF JOIN untuk Menampilkan Karyawan dan Manajernya
```sql
SELECT E1.name AS employee_name, 
       E2.name AS manager_name
FROM employees E1
LEFT JOIN employees E2
ON E1.manager_id = E2.employee_id;
```
#### Hasil:
| employee_name | manager_name |
|--------------|--------------|
| Klara        | NULL         |
| Emilia       | Klara        |
| Robert       | Klara        |
| Satria       | Emilia       |
| Farah        | Emilia       |

**Penjelasan:**
- `E1` mewakili karyawan dan `E2` mewakili manajer.
- `manager_id` dari `E1` dicocokkan dengan `employee_id` dari `E2` untuk mendapatkan nama manajer.
- Manajer tertinggi (CEO) tidak memiliki atasan, sehingga bernilai `NULL`.

#### Contoh: Mencari Pasangan dalam Database
Misalkan kita memiliki tabel `customers` dengan pasangan suami-istri.

#### Tabel **customers**
| customer_id | name   | spouse_id |
|------------|--------|-----------|
| 1          | Klara  | 2         |
| 2          | Emilia | 1         |
| 3          | Robert | 4         |
| 4          | Satria | 3         |

#### Query SELF JOIN untuk Menampilkan Pasangan
```sql
SELECT C1.name AS person, 
       C2.name AS spouse
FROM customers C1
JOIN customers C2
ON C1.spouse_id = C2.customer_id;
```
#### Hasil:
| person  | spouse  |
|---------|--------|
| Klara   | Emilia |
| Emilia  | Klara  |
| Robert  | Satria |
| Satria  | Robert |

**Penjelasan:**
- `SELF JOIN` mencocokkan pasangan dengan dirinya sendiri berdasarkan `spouse_id`.

## 4. Kapan Menggunakan SELF JOIN?
✅ Untuk menampilkan hierarki dalam satu tabel (misalnya, karyawan dan manajer).
✅ Untuk membandingkan baris dalam satu tabel (misalnya, membandingkan dua produk dalam satu database produk).
✅ Untuk menemukan hubungan rekursif dalam satu tabel.
