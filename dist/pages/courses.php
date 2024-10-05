<?php

$pageTitle = "Academic Hub | Explore";

session_start();

$user = $_SESSION["user"];
if (!isset($user)) {
    header("Location: ../index.php");
    exit();
}

// DB queries
include_once "../db/queries.php";

// Fetch all courses
$courses = get_all_courses($conn);

// Extract unique values for filter options
$courseTypes = array_unique(array_column($courses, 'type'));
$categories = array_unique(array_column($courses, 'category'));
$levels = array_unique(array_column($courses, 'level'));
$costs = ['Free', 'Paid'];

// Get search results
include_once "../utilities/search.php";

if ($_SERVER["REQUEST_METHOD"] == "GET") {
    $search_result = json_decode(doSearch($courses), true);
    $page = $search_result['page'];
    $totalPages = $search_result['totalPages'];
    $paginatedCourses = $search_result['paginatedCourses'];
}


// UI Components
include_once "../includes/header.php";
include_once "../includes/navbar.php";

?>

<div class="container mt-5">
    <div class="row">
        <!-- Sidebar with search filters -->
        <div class="col-md-3">
            <h4>Search Filters</h4>
            <form action="" method="GET">
                <!-- Course Type -->
                <div class="form-group">
                    <label for="courseType">Course Type:</label>
                    <select name="courseType" id="courseType" class="form-control">
                        <option value="">All</option>
                        <?php foreach ($courseTypes as $type): ?>
                            <option value="<?php echo $type; ?>" <?php if (isset($_GET['courseType']) && $_GET['courseType'] === $type)
                                   echo 'selected'; ?>><?php echo $type; ?></option>
                        <?php endforeach; ?>
                    </select>
                </div>
                <!-- Category -->
                <div class="form-group">
                    <label for="category">Category:</label>
                    <select name="category" id="category" class="form-control">
                        <option value="">All</option>
                        <?php foreach ($categories as $category): ?>
                            <option value="<?php echo $category; ?>" <?php if (isset($_GET['category']) && $_GET['category'] === $category)
                                   echo 'selected'; ?>><?php echo $category; ?></option>
                        <?php endforeach; ?>
                    </select>
                </div>
                <!-- Level -->
                <div class="form-group">
                    <label for="level">Level:</label>
                    <select name="level" id="level" class="form-control">
                        <option value="">All</option>
                        <?php foreach ($levels as $level): ?>
                            <option value="<?php echo $level; ?>" <?php if (isset($_GET['level']) && $_GET['level'] === $level)
                                   echo 'selected'; ?>><?php echo $level; ?></option>
                        <?php endforeach; ?>
                    </select>
                </div>

                <!-- Cost -->
                <div class="form-group">
                    <label for="cost">Cost:</label>
                    <select name="cost" id="cost" class="form-control">
                        <option value="">All</option>
                        <?php foreach ($costs as $cost): ?>
                            <option value="<?php echo $cost; ?>" <?php if (isset($_GET['cost']) && $_GET['cost'] === $cost)
                                   echo 'selected'; ?>><?php echo $cost; ?></option>
                        <?php endforeach; ?>
                    </select>
                </div>

                <!-- Apply Filters Button -->
                <button type="submit" class="btn btn-primary">Apply Filters</button>
            </form>
        </div>

        <!-- Courses -->
        <div class="col-md-9">
            <h2>Courses</h2>
            <?php if (empty($paginatedCourses)): ?>
                <div class="alert alert-info" role="alert">
                    No results found.
                </div>
            <?php else: ?>
                <div class="row">
                    <?php foreach ($paginatedCourses as $course): ?>
                        <div class="col-md-4 mb-4">
                            <?php include "../includes/course.php"; ?>
                        </div>
                    <?php endforeach; ?>
                </div>
            <?php endif; ?>

            <!-- Pagination -->
            <nav aria-label="Page navigation">
                <ul class="pagination justify-content-center">
                    <li class="page-item <?php echo $page <= 1 ? 'disabled' : ''; ?>">
                        <a class="page-link" href="?page=<?php echo $page - 1; ?>" tabindex="-1"
                            aria-disabled="true">Previous</a>
                    </li>
                    <?php for ($i = 1; $i <= $totalPages; $i++): ?>
                        <li class="page-item <?php echo $i == $page ? 'active' : ''; ?>">
                            <a class="page-link" href="?page=<?php echo $i; ?>"><?php echo $i; ?></a>
                        </li>
                    <?php endfor; ?>
                    <li class="page-item <?php echo $page >= $totalPages ? 'disabled' : ''; ?>">
                        <a class="page-link" href="?page=<?php echo $page + 1; ?>">Next</a>
                    </li>
                </ul>
            </nav>
        </div>

    </div>
</div>

<?php include_once "../includes/copy-write.php"; ?>
<?php include_once "../includes/footer.php"; ?>

