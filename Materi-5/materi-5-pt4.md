## **Menggunakan Operator Set dalam SQL**

Operator set dalam SQL digunakan untuk **menggabungkan hasil dari dua atau lebih query** menjadi satu hasil akhir. Operator ini bekerja dengan cara mengelompokkan hasil dari query-query yang memiliki jumlah dan tipe kolom yang sama.

---

## **1. Jenis-Jenis Operator Set dalam SQL**
| Operator Set | Fungsi |
|-------------|--------|
| **UNION** | Menggabungkan hasil dari dua query dan menghapus duplikat. |
| **UNION ALL** | Menggabungkan hasil dari dua query tanpa menghapus duplikat. |
| **INTERSECT** | Menghasilkan data yang muncul di kedua query. |
| **EXCEPT (MINUS di Oracle)** | Menghasilkan data yang hanya ada di query pertama tetapi tidak ada di query kedua. |

---

## **2. UNION dan UNION ALL**

### **🔹 UNION**
- Menggabungkan hasil dari dua query dan menghapus nilai duplikat.
- Kolom yang digabungkan harus memiliki tipe data yang sama.

#### **Sintaks UNION**
```sql
SELECT kolom1, kolom2 FROM tabel1
UNION
SELECT kolom1, kolom2 FROM tabel2;
```

#### **Contoh Penggunaan UNION**
Misalkan kita memiliki dua tabel **employees_2023** dan **employees_2024**:

### **Tabel employees_2023**
| employee_id | name  |
|------------|------|
| 1          | Andi  |
| 2          | Budi  |
| 3          | Citra |

### **Tabel employees_2024**
| employee_id | name  |
|------------|------|
| 3          | Citra |
| 4          | Dewi  |
| 5          | Eka   |

```sql
SELECT name FROM employees_2023
UNION
SELECT name FROM employees_2024;
```

#### **Hasil:**
| name  |
|------|
| Andi  |
| Budi  |
| Citra |
| Dewi  |
| Eka   |

💡 **Perhatikan bahwa `Citra` hanya muncul satu kali karena UNION menghapus duplikat.**

---

### **🔹 UNION ALL**
- Menggabungkan hasil dari dua query **tanpa menghapus nilai duplikat**.

```sql
SELECT name FROM employees_2023
UNION ALL
SELECT name FROM employees_2024;
```

#### **Hasil:**
| name  |
|------|
| Andi  |
| Budi  |
| Citra |
| Citra |
| Dewi  |
| Eka   |

💡 **`Citra` muncul dua kali karena UNION ALL tidak menghapus duplikat.**

---

## **3. INTERSECT**
- Menghasilkan **data yang ada di kedua query**.
- Tidak tersedia di MySQL (bisa diganti dengan `INNER JOIN`).

#### **Sintaks INTERSECT**
```sql
SELECT kolom FROM tabel1
INTERSECT
SELECT kolom FROM tabel2;
```

#### **Contoh Penggunaan INTERSECT**
```sql
SELECT name FROM employees_2023
INTERSECT
SELECT name FROM employees_2024;
```

#### **Hasil:**
| name  |
|------|
| Citra |

💡 **Hanya `Citra` yang muncul karena hanya dia yang ada di kedua tabel.**

---

## **4. EXCEPT (MINUS di Oracle)**
- Menghasilkan **data yang hanya ada di query pertama** tetapi **tidak ada di query kedua**.

#### **Sintaks EXCEPT**
```sql
SELECT kolom FROM tabel1
EXCEPT
SELECT kolom FROM tabel2;
```

#### **Contoh Penggunaan EXCEPT**
```sql
SELECT name FROM employees_2023
EXCEPT
SELECT name FROM employees_2024;
```

#### **Hasil:**
| name  |
|------|
| Andi  |
| Budi  |

💡 **Andi dan Budi muncul karena hanya ada di `employees_2023`, tetapi tidak di `employees_2024`.**

---

## **5. Kesimpulan**
| Operator Set | Kegunaan |
|-------------|----------|
| **UNION** | Menggabungkan hasil query dan menghapus duplikat. |
| **UNION ALL** | Menggabungkan hasil query tanpa menghapus duplikat. |
| **INTERSECT** | Menampilkan data yang muncul di kedua query. |
| **EXCEPT (MINUS di Oracle)** | Menampilkan data yang hanya ada di query pertama. |

✅ **Gunakan `UNION` jika ingin menghindari duplikasi.**  
✅ **Gunakan `UNION ALL` jika ingin mempertahankan semua data, termasuk duplikat.**  
✅ **Gunakan `INTERSECT` jika hanya ingin melihat data yang muncul di kedua query.**  
✅ **Gunakan `EXCEPT` jika hanya ingin melihat data yang unik di query pertama.**  

---

