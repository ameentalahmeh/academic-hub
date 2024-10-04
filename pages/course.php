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
$course_id = $_GET['id'];
$course = get_course_details($conn, $course_id);

if (!$course) {
    echo "<h1>Error: Course not found!</h1>";
    exit();
}

// Page Title
$pageTitle = "Academic Hub | " . $course['name'];

// Enroll handling
$cost = $course['price'] == 0 ? 'Free' : '$' . $course['price'];
$username = $user['username'];
$lessons = $course['lessons'];
$enroll_status = enroll_course_status($conn, $username, $course_id, $lessons);

if ($_SERVER["REQUEST_METHOD"] == "POST" && $enroll_status == "Ready") {
    $enroll_status = enroll_course($conn, $username, $course_id, $lessons);
}

// Course level style
$matchStyle = 'background-color: rgb(255, 250, 220); color: rgb(246, 162, 78);';


// UI Components
include_once "../includes/header.php";
include_once "../includes/navbar.php";

?>

<div class="container mt-5 my-5">
    <!-- Course Header -->
    <div class="col-md-12 course-header">
        <!-- Title and Description -->
        <h2><?php echo $course['name']; ?></h2>
        <p><?php echo $course['description']; ?></p>
        <!-- Course Category and Type -->
        <div class="row course-tc">
            <span class="badge badge-type"><?php echo $course['type']; ?></span>
            <span class="badge badge-category"><?php echo $course['category']; ?></span>
        </div>
    </div>

    <div class="row mt-5">
        <!-- Left Column - Course Details -->
        <div class="col w-50">
            <!-- Description -->
            <div class="row mt-5">
                <div class="col-md-12">
                    <h3>Description</h3>
                    <p><?php echo $course['description']; ?></p>
                </div>
            </div>

            <!-- What you'll learn -->
            <div class="row mt-5">
                <div class="col-md-12">
                    <h3>What you'll learn</h3>
                    <ul class="learn-items-list">
                        <?php foreach ($course['learn_items'] as $learnItem): ?>
                            <li class="learn-item">
                                <i class="fas fa-arrow-right icon-arrow-right"></i>
                                <span><?php echo $learnItem; ?></span>
                            </li>
                        <?php endforeach; ?>
                    </ul>
                </div>
            </div>

            <!-- Syllabus -->
            <?php if (count($course['lessons']) > 0): ?>
                <div class="row mt-5">
                    <div class="col-md-12">
                        <h3>Syllabus</h3>
                        <?php foreach ($course['lessons'] as $index => $lesson): ?>
                            <div class="lesson">
                                <h4 class="lesson-title">Lesson .<?php echo $index + 1; ?>: <?php echo $lesson['title']; ?></h4>
                                <p class="lesson-description"><?php echo $lesson['description']; ?></p>
                            </div>
                        <?php endforeach; ?>
                    </div>
                </div>
            <?php endif; ?>

            <!-- Teacher -->
            <div class="row mt-5">
                <div class="col-md-12">
                    <h3>Teacher</h3>
                    <div class="teacher-card">
                        <img src="../assets/images/<?php echo $course['teacher']['image']; ?>"
                            class="mr-3 rounded-circle" alt="<?php echo $course['teacher']['name']; ?>" height="100px"
                            width="100px">
                        <div class="teacher-details">
                            <span class="teacher-name"><?php echo $course['teacher']['name']; ?></span>
                            <span class="teacher-title"><?php echo $course['teacher']['title']; ?></span>
                            <p class="teacher-bio"><?php echo $course['teacher']['bio']; ?></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Right Column - Course Details Card -->
        <div class="col w-50">
            <div class="course-details-card">
                <!-- Course Image -->
                <img class="course-img" src="../assets/images/<?php echo $course['image']; ?>" alt="course image">

                <div class="course-details-container">
                    <!-- Course Pace -->
                    <span class="course-pace">Self-paced course - you can start learning now</span>

                    <!-- Level -->
                    <div class="course-property">
                        <h5 class="property-title">Level:</h5>
                        <div class="property-items">
                            <span class="property-label"
                                style="<?php echo $course['level'] == "Beginner" ? $matchStyle : null; ?>">Beginner</span>
                            <span class="property-label"
                                style="<?php echo $course['level'] == "Intermediate" ? $matchStyle : null; ?>">Intermediate</span>
                            <span class="property-label"
                                style="<?php echo $course['level'] == "Advanced" ? $matchStyle : null; ?>">Advanced</span>
                        </div>
                    </div>

                    <!-- Course Details Bullets -->
                    <div class="course-details-bullets">
                        <ul>
                            <li class="bullet-item">Lifetime access</li>
                            <li class="bullet-item">Graded exams</li>
                            <li class="bullet-item">Certificate of completion</li>
                        </ul>
                    </div>

                    <!-- Course Enroll -->
                    <div id="course-enroll" class="course-enroll-container">
                        <?php
                        switch ($enroll_status) {
                            case 'Coming Soon':
                                echo "<div class='enroll-status course-coming-soon'>Coming Soon</div>";
                                break;
                            case 'Completed':
                                echo "<button type='button' class='btn btn-success btn-rounded btn-lg btn-block' onclick='redirectToEnrollment($course_id)'>Watch Again</button>";
                                break;
                            case "Start Learning":
                                echo "<button type='button' class='btn btn-info btn-rounded btn-lg btn-block' onclick='redirectToEnrollment($course_id)'>Start Learning</button>";
                                break;
                            case "Continue Learning":
                                echo "<button type='button' class='btn btn-warning btn-rounded btn-lg btn-block' onclick='redirectToEnrollment($course_id)'>Continue Learning</button>";
                                break;
                            case "Ready":
                                echo "<div class='course-enroll'><form action='course.php?id=$course_id' method='post'><button type='submit' class='btn btn-primary btn-rounded btn-lg btn-block btn-enroll'>Enroll now</button></form><p class='course-cost'>$cost</p></div>";
                                break;
                            default:
                                echo "<p>Unknown</p>";
                                break;
                        }
                        ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<?php include_once "../includes/copy-write.php"; ?>
<?php include_once "../includes/footer.php"; ?>

