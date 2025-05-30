<div align="center"> 
  <h1>📘 Buku Penghubung Digital (DekulConnect)</h1> 
  <h3>Aplikasi mobile berbasis Flutter untuk menghubungkan guru dan orang tua dalam memantau aktivitas serta nilai siswa di sekolah dan rumah.<br>Proyek ini menggantikan buku penghubung konvensional dengan sistem terintegrasi berbasis mobile.</h3>
  
  ![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
  ![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
  <br>
  ![RESTful API](https://img.shields.io/badge/RESTful_API-009688?style=for-the-badge&logo=fastapi&logoColor=white)
  ![JSON Web Tokens](https://img.shields.io/badge/JWT-000000?style=for-the-badge&logo=jsonwebtokens&logoColor=white)
</div>


---

## 🎯 Deskripsi Project

Dekul Connect adalah aplikasi monitoring siswa yang memungkinkan:
- **Guru** untuk mencatat aktivitas siswa di sekolah dan input nilai
- **Orang Tua** untuk mencatat aktivitas anak di rumah dan melihat nilai
- Sinkronisasi data real-time antara guru dan orang tua

### 👨‍🏫 Fitur Guru

- [x] Halaman Opsi Login Guru dan Ortu
- [x] Halaman Login
- [x] Dashboard Guru
- [x] profile
- [x] input aktifitas di sekolah
- [x] lihat aktifitas di rumah
- [x] input nilai siswa
- [x] logout

### 👨‍👩‍👧‍👦 Fitur Orang Tua

- [x] Halaman Opsi Login Guru dan Ortu
- [x] Halaman Login
- [x] Dashboard Ortu
- [x] profile
- [x] input aktivitas di rumah
- [x] lihat aktivitas di sekolah
- [x] lihat nilai
- [x] logout

### 📊 Sistem Monitoring
- **Kalender Aktivitas** dengan indikator checklist
- **Filter berdasarkan bulan/tanggal**
- **Laporan aktivitas harian**
- **Riwayat nilai per mata pelajaran**

### Kategori Aktivitas

#### Aktivitas Rumah
1. **Ibadah**: Salat 5 waktu, Duha, berdoa, mengaji dll
2. **Sosial**: Hormat orang tua, sopan santun, menyayangi saudara dll
3. **Kemandirian**: Bangun sendiri, mandi, berpakaian, belajar dll

#### Aktivitas Sekolah
1. **Worship**: Prayer on time, orderly, after prayer etc
2. **Social**: Greetings, good association, obedience, politeness etc
3. **Responsibility**: Punctuality, uniform, focus, completing tasks etc

### Fitur Admin

[Repo admin ada di sini, klik dan baca fitur di readme](https://github.com/jalesjj/DekulConnect_BE)


## 🔧 Konfigurasi Environment

### API Configuration
```dart
// lib/configuration/app_environment.dart
class AppEnvironment {
  static String get apiUrl => env[EnvironmentConstant.apiUrl] ?? '';
}
```

### Launch Configuration
```json
// .vscode/launch.json
{
  "version": "3",
  "configurations": [{
    "name": "Main",
    "type": "dart",
    "request": "launch",
    "program": "lib/main.dart",
    "args": ["--dart-define=API_URL=http://your_IP/api/"]
  }]
}
```

## 🔒 Authentication & Security

### Login System
- **Dual Role**: Guru dan Orang Tua
- **Phone & Password** authentication
- **JWT Token** untuk session management
- **Encrypted Storage** untuk data lokal

### API Security
- **Bearer Token** authorization
- **Request/Response** interceptors
- **Error handling** yang comprehensive
- **Auto logout** pada unauthorized access

## 📋 API Endpoints

### Authentication
- `POST /login` - User login
- `GET /me` - Get user profile
- `POST /logout` - User logout

### School Services
- `GET /siswa` - Get all students (for teachers)
- `GET /siswa/{id}` - Get students by parent ID
- `GET /nilai/{id}` - Get grades by student ID
- `POST /nilai` - Create new grade
- `GET /aktivitas-rumah/{id}` - Get home activities
- `POST /aktivitas-rumah` - Create home activity
- `GET /aktivitas-sekolah/{id}` - Get school activities
- `POST /aktivitas-sekolah` - Create school activity

---

### 👥 Collaborators

<table>
  <tr>
    <td align="center">
      <a href="https://github.com/jalesjj">
        <img src="https://avatars.githubusercontent.com/jalesjj" width="100px;" alt=""/>
        <br /><sub><b>Jales Junda Istiqfariz</b></sub>
      </a>
      <br />
      <a href="https://mail.google.com/mail/?view=cm&fs=1&to=jalesjunda22@gmail.com" target="_blank">📧 Email</a> |
      <a href="https://instagram.com/j_stqfrz" target="_blank">📸 IG</a>
    </td>
    <td align="center">
      <a href="https://github.com/RizaldhiP20">
        <img src="https://avatars.githubusercontent.com/RizaldhiP20" width="100px;" alt=""/>
        <br /><sub><b>Moch. Rizaldhi Pratama</b></sub>
      </a>
      <br />
      <a href="https://mail.google.com/mail/?view=cm&fs=1&to=rizaldhiyt@gmail.com" target="_blank">📧 Email</a> |
      <a href="https://instagram.com/rizaldhialdhi24" target="_blank">📸 IG</a>
    </td>
  </tr>
</table>

**Dibuat dengan ❤️ menggunakan Flutter**
