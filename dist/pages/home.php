<?php

$pageTitle = "Academic Hub";

session_start();

$user = $_SESSION["user"];
if (!isset($user)) {
    header("Location: ../index.php");
    exit();
}

// DB queries
include_once "../db/queries.php";

$latest_courses = get_latest_courses($conn);
$recommended_courses = get_recommended_courses($conn, $user['username']);

// UI Components
include_once "../includes/header.php";
include_once "../includes/navbar.php";
include_once "../includes/slider.php";

?>

<!-- Latest Courses Section -->
<div class="container mt-5">
    <div class="row">
        <div class="col-md-12">
            <h2 class="text-left mb-4">Latest Courses</h2>
        </div>
    </div>

    <div class="row">
        <?php foreach ($latest_courses as $course): ?>
            <div class="col-md-4 mb-4">
                <?php include "../includes/course.php"; ?>
            </div>
        <?php endforeach; ?>
    </div>
</div>


<!-- Recommended Courses Section -->
<?php if ($recommended_courses && count($recommended_courses) > 0): ?>
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-12">
                <h2 class="text-left mb-4">Recommended Courses</h2>
            </div>
        </div>
        <div class="row">
            <?php foreach ($recommended_courses as $course): ?>
                <div class="col-md-4 mb-4">
                    <?php include "../includes/course.php"; ?>
                </div>
            <?php endforeach; ?>
        </div>
    </div>
<?php endif; ?>

<?php include_once "../includes/contact.php"; ?>
<?php include_once "../includes/footer.php"; ?>

