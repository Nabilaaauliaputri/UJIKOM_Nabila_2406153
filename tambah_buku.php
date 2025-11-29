<?php
session_start();
require 'koneksi.php';

// Cek Login
if (!isset($_SESSION['status']) || $_SESSION['status'] != "login") {
    header("Location: login.php");
    exit;
}

if (isset($_POST['simpan'])) {

    $id_buku     = $_POST['id_buku'];
    $judul       = $_POST['judul'];
    $penulis     = $_POST['penulis'];
    $penerbit    = $_POST['penerbit'];
    $kategori    = $_POST['kategori'];
    $tahun       = $_POST['tahun_terbit'];

    // Cek ID duplikat
    $cek_id = mysqli_query($koneksi, "SELECT id_buku FROM buku WHERE id_buku='$id_buku'");
    if (mysqli_num_rows($cek_id) > 0) {
        echo "<script>alert('ID Buku sudah digunakan!'); window.history.back();</script>";
        exit;
    }

    // Upload gambar
    $filename = $_FILES['gambar']['name'];
    $tmp = $_FILES['gambar']['tmp_name'];
    $rand = rand();
    $nama_gambar = "";

    if ($filename != "") {
        $nama_gambar = $rand . "_" . $filename;
        move_uploaded_file($tmp, "img/" . $nama_gambar);
    }

    // Insert data
    $query = "INSERT INTO buku (id_buku, judul, penulis, penerbit, tahun_terbit, kategori, gambar) 
              VALUES ('$id_buku', '$judul', '$penulis', '$penerbit', '$tahun', '$kategori', '$nama_gambar')";

    if (mysqli_query($koneksi, $query)) {
        echo "<script>alert('Data Berhasil Disimpan!'); window.location='buku.php';</script>";
    } else {
        echo "<script>alert('Gagal menyimpan data!');</script>";
    }
}
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <title>Tambah Buku</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #ffe6f2;
        }
        .card {
            border-radius: 15px;
            border: 2px solid #ffb3d9;
        }
        .btn-primary {
            background-color: #ff66a3;
            border: none;
        }
        .btn-primary:hover {
            background-color: #e60073;
        }
    </style>
</head>

<body>

<div class="container mt-5 mb-5">
    <div class="card shadow-sm p-4" style="max-width: 650px; margin: auto;">
        <h4 class="mb-3 text-center" style="color:#e60073;">Form Tambah Buku</h4>

        <form method="POST" enctype="multipart/form-data">

            <div class="mb-3">
                <label>ID Buku</label>
                <input type="number" name="id_buku" class="form-control" required>
            </div>

            <div class="mb-3">
                <label>Judul Buku</label>
                <input type="text" name="judul" class="form-control" required>
            </div>

            <div class="mb-3">
                <label>Penulis</label>
                <input type="text" name="penulis" class="form-control" required>
            </div>

            <div class="mb-3">
                <label>Penerbit</label>
                <input type="text" name="penerbit" class="form-control" required>
            </div>

            <div class="mb-3">
                <label>Tahun Terbit</label>
                <input type="number" name="tahun_terbit" class="form-control" placeholder="2023" required>
            </div>

            <div class="mb-3">
                <label>Kategori</label>
                <select name="kategori" class="form-select" required>
                    <option value="">-- Pilih Kategori --</option>
                    <option value="Pendidikan">Pendidikan</option>
                    <option value="Teknologi">Teknologi</option>
                    <option value="Novel">Novel</option>
                </select>
            </div>

            <div class="mb-3">
                <label>Cover Buku</label>
                <input type="file" name="gambar" class="form-control">
            </div>

            <button type="submit" name="simpan" class="btn btn-primary w-100">Simpan</button>
        </form>

    </div>
</div>

</body>
</html>
