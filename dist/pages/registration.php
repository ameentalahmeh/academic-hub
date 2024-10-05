<?php
$pageTitle = "Registration";

session_start();

if (isset($_SESSION["user"])) {
    header("Location: ../pages/home.php");
    exit();
}

// Fetch course categories from the database or define them statically
$courseCategories = array("Programming", "Web Development", "Data Science", "Design", "Business", "Language");

// Redirect if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    include_once "../handlers/register_handler.php";
}



// UI Components
include_once "../includes/header.php";

?>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card mt-5">
                <div class="card-header">
                    <h2 class="text-center">Registration</h2>
                </div>
                <div class="card-body">
                    <form id="registration-form" action="registration.php" method="POST">
                        <div class="form-group">
                            <label for="name">Name</label>
                            <input type="text" class="form-control" id="name" name="name" required>
                        </div>
                        <div class="form-group">
                            <label for="username">Username</label>
                            <input type="text" class="form-control" id="username" name="username" required>
                        </div>
                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="password" class="form-control" id="password" name="password" required>
                        </div>
                        <div class="form-group">
                            <label for="recommended">Recommended Courses</label>
                            <select class="form-control" id="recommended" name="recommended">
                                <option value="">Select a category...</option>
                                <?php foreach ($courseCategories as $category): ?>
                                    <option value="<?php echo $category; ?>"><?php echo $category; ?></option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-primary btn-block">Register</button>
                        <p class="text-center mt-3">Already have an account? <a href="../index.php">Login</a></p>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<?php include_once "../includes/footer.php"; ?>

