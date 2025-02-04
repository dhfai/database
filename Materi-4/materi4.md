# INNER JOIN, OUTER JOIN, NATURAL JOIN, USING, ON, dan SELF JOIN

## Pengertian

Ketika bekerja dengan database relasional, sering kali kita perlu menggabungkan data dari beberapa tabel berdasarkan kolom yang memiliki hubungan. SQL menyediakan berbagai cara untuk melakukan ini, termasuk `INNER JOIN`, `OUTER JOIN`, `NATURAL JOIN`, `USING`, `ON`, dan `SELF JOIN`. Setiap metode memiliki fungsinya sendiri sesuai dengan kebutuhan penggabungan data.

| JOIN Type      | Cara Kerja |
|---------------|------------|
| **INNER JOIN** | Mengembalikan hanya baris yang memiliki kecocokan di kedua tabel. |
| **OUTER JOIN** | Mengembalikan semua data dari satu atau kedua tabel, meskipun tidak ada kecocokan. |
| **NATURAL JOIN** | Menggabungkan tabel secara otomatis berdasarkan kolom yang sama tanpa menyebutkan kolomnya. |
| **USING**       | Menggabungkan tabel berdasarkan kolom tertentu yang disebutkan secara eksplisit dalam `USING(kolom)`. |
| **ON**       | Menggabungkan tabel berdasarkan kondisi yang ditentukan secara eksplisit, bahkan jika nama kolom berbeda. |
| **SELF JOIN** | Menggabungkan tabel dengan dirinya sendiri untuk membandingkan data dalam satu tabel. |

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

## 5. Summary: Kelebihan, Kekurangan, dan Kapan Menggunakannya

| JOIN Type      | Kelebihan | Kekurangan | Kapan Digunakan? |
|---------------|----------|-----------|----------------|
| **INNER JOIN** | Hanya menampilkan data yang cocok, lebih efisien | Data yang tidak cocok di kedua tabel akan hilang | Saat hanya ingin melihat data yang berelasi di kedua tabel |
| **OUTER JOIN** | Menampilkan semua data meskipun tidak ada kecocokan | Bisa menghasilkan banyak NULL jika banyak data tidak cocok | Jika ingin melihat semua data meskipun tidak memiliki pasangan |
| **NATURAL JOIN** | Otomatis mencocokkan kolom yang sama | Bisa salah jika ada lebih dari satu kolom dengan nama yang sama | Jika yakin ada satu kolom kunci yang cocok |
| **USING** | Eksplisit menyebutkan kolom yang dicocokkan | Tidak bisa digunakan jika kolom memiliki nama yang berbeda | Jika ingin memastikan kolom yang dipakai untuk join |
| **ON** | Fleksibel untuk mencocokkan nama kolom yang berbeda | Harus menentukan kondisi secara eksplisit | Jika kolom yang digunakan untuk join memiliki nama berbeda |
| **SELF JOIN** | Berguna untuk menampilkan hubungan dalam satu tabel | Bisa membingungkan jika tidak diberi alias tabel | Saat bekerja dengan data hierarki atau hubungan dalam satu tabel |

Dengan memahami perbedaan masing-masing tipe JOIN, kita dapat memilih metode yang paling sesuai dengan kebutuhan data yang akan kita analisis atau tampilkan dalam SQL.