<?php

function doSearch($courses)
{
    $filteredCourses = $courses;

    // Filter by course type
    if (!empty($_GET["courseType"])) {
        $filteredCourses = array_filter($filteredCourses, function ($course) {
            return $course["type"] == $_GET["courseType"];
        });
    }

    // Filter by category
    if (!empty($_GET["category"])) {
        $filteredCourses = array_filter($filteredCourses, function ($course) {
            return stripos($course["category"], $_GET["category"]) !== false;
        });
    }

    // Filter by level
    if (!empty($_GET["level"])) {
        $filteredCourses = array_filter($filteredCourses, function ($course) {
            return $course["level"] == $_GET["level"];
        });
    }

    // Filter by cost
    if (!empty($_GET["cost"])) {
        $filteredCourses = array_filter($filteredCourses, function ($course) {
            $price = $course['price'] == 0 ? 'Free' : '$' . $course['price'];
            return ($price == 'Free' && $_GET['cost'] == 'Free') || ($price != 'Free' && $_GET['cost'] == 'Paid');
        });
    }

    // Pagination
    $page = isset($_GET['page']) ? $_GET['page'] : 1;
    $perPage = 9;
    $totalPages = ceil(count($filteredCourses) / $perPage);
    $offset = ($page - 1) * $perPage;
    $paginatedCourses = array_slice($filteredCourses, $offset, $perPage);

    // Result
    $result = [];
    $result['page'] = $page;
    $result['totalPages'] = $totalPages;
    $result['paginatedCourses'] = $paginatedCourses;

    return json_encode($result);
}



?>

