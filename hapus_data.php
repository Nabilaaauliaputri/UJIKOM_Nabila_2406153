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
<html>
<head><title>Login SIMBS</title></head>
<body>
    <h2>Login</h2>
    <?php if($pesan_error != ""): ?>
        <div style="color: red; border: 1px solid red; padding: 10px;">
            <?= $pesan_error; ?>
        </div>
    <?php endif; ?>

    <form method="POST">
        Username: <input type="text" name="username" required><br>
        Password: <input type="password" name="password" required><br>
        <button type="submit" name="login">Login</button>
    </form>
    <a href="register.php">Belum punya akun? Register</a>
</body>
</html>