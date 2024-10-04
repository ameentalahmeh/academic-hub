<?php

session_start();

include_once "db/connect.php";

if (isset($_POST["username"]) && isset($_POST["password"]) && !empty($_POST["username"]) && !empty($_POST["password"])) {
    $username = $_POST["username"];
    $password = $_POST["password"];

    $query = "SELECT * FROM student WHERE username = ?";
    $stmt = mysqli_prepare($conn, $query);

    if ($stmt) {
        mysqli_stmt_bind_param($stmt, "s", $username);
        mysqli_stmt_execute($stmt);
        $result = mysqli_stmt_get_result($stmt);

        if ($row = mysqli_fetch_assoc($result)) {
            // Verify the password
            if (password_verify($password, $row['password'])) {
                unset($row['password']);
                $_SESSION["user"] = $row;
                header("Location: ./pages/home.php");
                exit();
            } else {
                header("Location: index.php?error=incorrect_password");
                exit();
            }
        } else {
            header("Location: index.php?error=user_not_found");
            exit();
        }
    } else {
        echo "Prepared statement error: " . mysqli_error($conn);
    }
    mysqli_stmt_close($stmt);
} else {
    header("Location: index.php?error=missing_credentials");
    exit();
}

?>

