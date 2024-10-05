<?php
$pageTitle = "Login";

session_start();

if (isset($_SESSION["user"])) {
    header("Location: pages/home.php");
    exit();
}

// Redirect if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    include_once "handlers/login_handler.php";
}


// UI Components
include_once "includes/header.php";

?>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card mt-5">
                <div class="card-header">
                    <h2 class="text-center">Login</h2>
                </div>
                <div class="card-body">
                    <form id="login-form" action="index.php" method="POST">
                        <div class="form-group">
                            <label for="username">Username</label>
                            <input type="text" class="form-control" id="username" name="username" required>
                        </div>
                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="password" class="form-control" id="password" name="password" required>
                        </div>
                        <button type="submit" class="btn btn-primary btn-block">Login</button>
                        <p class="text-center mt-3">Don't have an account? <a href="pages/registration.php">Register</a>
                        </p>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<?php include_once "includes/footer.php"; ?>

