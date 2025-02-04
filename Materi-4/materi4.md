# NATURAL JOIN vs USING

## Pengertian

Ketika bekerja dengan database relasional, sering kali kita perlu menggabungkan data dari beberapa tabel berdasarkan kolom yang sama. SQL menyediakan berbagai cara untuk melakukan ini, termasuk `NATURAL JOIN` dan `USING`. Kedua klausa ini digunakan untuk menggabungkan tabel berdasarkan kolom yang memiliki nama yang sama, tetapi ada beberapa perbedaan utama dalam cara kerjanya.

| JOIN Type      | Cara Kerja |
|---------------|------------|
| **NATURAL JOIN** | Menggabungkan tabel secara otomatis berdasarkan kolom yang sama tanpa menyebutkan kolomnya. |
| **USING**       | Menggabungkan tabel berdasarkan kolom tertentu yang disebutkan secara eksplisit dalam `USING(kolom)`. |

## Contoh Perbandingan NATURAL JOIN vs USING

Misalkan kita memiliki dua tabel: **employee** dan **department**.

### Tabel **employee**
| emp_id  | emp_name   | dept_id |
|---------|-----------|---------|
| 101     | John Doe  | D001    |
| 102     | Jane Doe  | D002    |

### Tabel **department**
| dept_id | dept_name        |
|---------|-----------------|
| D001    | HR              |
| D002    | IT              |

### 🔹 Contoh NATURAL JOIN
```sql
SELECT emp_id, emp_name, dept_name
FROM employee
NATURAL JOIN department;
```
#### Hasil:
| emp_id  | emp_name   | dept_name |
|---------|-----------|-----------|
| 101     | John Doe  | HR        |
| 102     | Jane Doe  | IT        |

**Kenapa bisa?**
- `NATURAL JOIN` otomatis mencocokkan tabel berdasarkan kolom yang memiliki nama sama (`dept_id`).
- Kita tidak perlu menulis `ON` atau `USING`.

### 🔹 Contoh USING
```sql
SELECT emp_id, emp_name, dept_name
FROM employee
JOIN department
USING (dept_id);
```
#### Hasil:
| emp_id  | emp_name   | dept_name |
|---------|-----------|-----------|
| 101     | John Doe  | HR        |
| 102     | Jane Doe  | IT        |

**Perbedaannya?**
- Dengan `USING`, kita harus menyebutkan kolom yang akan dicocokkan (`dept_id`).
- Lebih eksplisit dan aman, karena jika ada lebih banyak kolom dengan nama yang sama, kita bisa memilih hanya kolom tertentu.

## Kapan Menggunakan NATURAL JOIN atau USING?

| Situasi | Gunakan |
|---------|------------|
| Kolom yang dicocokkan pasti sama | `NATURAL JOIN` |
| Ada lebih dari satu kolom yang sama, tetapi ingin mencocokkan kolom tertentu saja | `USING` |
| Nama kolom berbeda di kedua tabel | ❌ Gunakan `ON` (bukan `NATURAL JOIN` atau `USING`) |