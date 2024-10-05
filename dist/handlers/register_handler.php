<?php

session_start();

include_once "../db/connect.php";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $name = $_POST["name"];
    $username = $_POST["username"];
    $password = $_POST["password"];
    $recommended = $_POST["recommended"];

    // Encrypt the password
    $hashed_password = password_hash($password, PASSWORD_DEFAULT);

    $query = "INSERT INTO student (name, username, password, recommended) VALUES (?, ?, ?, ?)";
    $stmt = mysqli_prepare($conn, $query);

    if ($stmt) {
        mysqli_stmt_bind_param($stmt, "ssss", $name, $username, $hashed_password, $recommended);
        $success = mysqli_stmt_execute($stmt);

        if ($success) {
            $new_student_id = mysqli_insert_id($conn);
            $select_query = "SELECT * FROM student WHERE id = ?";
            $select_stmt = mysqli_prepare($conn, $select_query);
            mysqli_stmt_bind_param($select_stmt, "i", $new_student_id);
            mysqli_stmt_execute($select_stmt);
            $result = mysqli_stmt_get_result($select_stmt);

            if ($row = mysqli_fetch_assoc($result)) {
                unset($row['password']);
                $_SESSION["user"] = $row;
                header("Location: ./home.php");
                exit();
            } else {
                header("Location: index.php?error=user_not_found");
                exit();
            }
        } else {
            header("Location: registration.php?error=registration_failed");
            exit();
        }
    } else {
        header("Location: registration.php?error=database_error");
        exit();
    }
} else {
    header("Location: registration.php");
    exit();
}


?>

