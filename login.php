<?php
session_start();
include 'koneksi.php';
$pesan_error = "";

if (isset($_POST['login'])) {
    $username = $_POST['username'];
    $password = $_POST['password']; 

    $cek = mysqli_query($koneksi, "SELECT * FROM user WHERE username = '$username' AND password = '$password'");
    
    if (mysqli_num_rows($cek) > 0) {
        $data = mysqli_fetch_assoc($cek);
        
        $_SESSION['username'] = $data['username'];
        $_SESSION['status'] = "login";
        header("Location: index.php");
    } else {
        $pesan_error = "Username salah atau salah password";
    }
}
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Login SIMBS</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #ffe6f2;
            font-family: Arial, sans-serif;
        }
        .login-box {
            width: 380px;
            margin: 90px auto;
            background: #ffffff;
            padding: 25px;
            border-radius: 15px;
            box-shadow: 0 0 15px rgba(255, 102, 179, 0.4);
            border-top: 5px solid #ff66b3;
        }

        .login-title {
            text-align: center;
            color: #ff66b3;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .btn-pink {
            background-color: #ff66b3;
            color: white;
        }

        .btn-pink:hover {
            background-color: #ff3385;
            color: white;
        }

        a {
            color: #ff3385;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        .error-box {
            background: #ffd1e0;
            border-left: 5px solid #ff3385;
            padding: 10px;
            margin-bottom: 15px;
            color: #cc005a;
            border-radius: 5px;
        }
    </style>
</head>

<body>

    <div class="login-box">
        <h3 class="login-title">Login SIMBS</h3>

        <?php if($pesan_error != ""): ?>
            <div class="error-box">
                <?= $pesan_error; ?>
            </div>
        <?php endif; ?>

        <form method="POST">
            <div class="mb-3">
                <label class="form-label">Username</label>
                <input type="text" 
                       name="username" 
                       class="form-control" 
                       required>
            </div>

            <div class="mb-3">
                <label class="form-label">Password</label>
                <input type="password" 
                       name="password" 
                       class="form-control" 
                       required>
            </div>

            <button type="submit" name="login" class="btn btn-pink w-100">
                Login
            </button>
        </form>

        <div class="text-center mt-3">
            <small>Belum punya akun? <a href="register.php">Register</a></small>
        </div>
    </div>

</body>
</html>
