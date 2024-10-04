<?php

session_start();

$user = $_SESSION["user"];
if (!isset($user)) {
    header("Location: ../index.php");
    exit();
}

// DB queries
include_once "../db/queries.php";

// Fetch course details
$course_id = $_GET['course_id'];
$username = $user['username'];
$course = get_learning_course_details($conn, $username, $course_id);

if (!$course) {
    echo "<h1>Error: Course not found!</h1>";
    exit();
}

$lessons = $course['lessons'];
$firstLesson = $lessons[0];

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $lesson_id = $_POST['lesson_id'];
    $course = update_learning_progress_percentage($conn, $username, $course_id, $lesson_id);
}

// Page Title
$pageTitle = "Academic Hub | Learn " . $course['name'];

// UI Components
include_once "../includes/header.php";
include_once "../includes/navbar.php";

?>

<div class="learn-container">
    <!-- Syllabus -->
    <div class="learn-sidebar">
        <div class="col learn-sidebar-heading">
            <a href="course.php?id=<?php echo $course_id; ?>" class="course-link">
                <h6 class="course-title"><?php echo $course['name']; ?></h6>
            </a>
            <?php if ($course['progress'] == 100): ?>
                <i class="fa fa-check-circle course-completed-icon" aria-label="Course Completed"
                    title="Course Completed"></i>
            <?php else: ?>
                <p class="course-progress"><?php echo $course['progress'] . "%"; ?></p>
            <?php endif; ?>
        </div>

        <div class="col learn-sidebar-lessons">
            <?php foreach ($course['lessons'] as $index => $lesson): ?>
                <div class="lesson-toggle mb-3" data-lesson-index="<?php echo $index; ?>"
                    data-lesson-title="<?php echo $lesson['title']; ?>"
                    data-lesson-description="<?php echo htmlspecialchars($lesson['description']); ?>">
                    <h6 class="lesson-title"><?php echo $lesson['title']; ?></h6>
                    <?php if ($lesson['status'] == 0): ?>
                        <form action="learn.php?course_id=<?php echo $course_id; ?>" method='post'>
                            <input type="hidden" name="lesson_id" class="lesson-id-input" value="<?php echo $lesson['id']; ?>">
                            <button type='submit' class='btn mark-lesson-done'>
                                <i class="fas fa-check"></i>
                            </button>
                        </form>
                    <?php endif; ?>
                </div>
            <?php endforeach; ?>
        </div>
    </div>

    <!-- Main content area -->
    <div class="lesson-content">
        <div class="lesson-content-title-container">
            <h2 class="lesson-content-title"><?php echo $firstLesson['title']; ?></h2>
        </div>
        <div class="lesson-content-description-container">
            <h5 class="lesson-content-description"><?php echo $firstLesson['description']; ?></h5>
        </div>
        <iframe class="lesson-content-video" width="inherit" height="420" src="<?php echo $firstLesson['video']; ?>"
            frameborder="0"
            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
            referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
    </div>
</div>

<?php include_once "../includes/copy-write.php"; ?>
<?php include_once "../includes/footer.php"; ?>

