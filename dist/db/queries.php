<?php

include_once "../db/connect.php";

function get_latest_courses($conn)
{
    $query = "SELECT * FROM course ORDER BY created_at DESC LIMIT 3";
    $result = mysqli_query($conn, $query);

    if ($result) {
        $latest_courses = array();
        while ($row = mysqli_fetch_assoc($result)) {
            $latest_courses[] = $row;
        }
        mysqli_free_result($result);
        return $latest_courses;
    } else {
        echo "Error: " . mysqli_error($conn);
    }
}

function get_recommended_courses($conn, $username)
{
    $student_recommended_query = "SELECT recommended FROM student WHERE username=?";
    $stmt = mysqli_prepare($conn, $student_recommended_query);

    if ($stmt) {
        mysqli_stmt_bind_param($stmt, "s", $username);
        mysqli_stmt_execute($stmt);
        mysqli_stmt_bind_result($stmt, $recommended);
        mysqli_stmt_fetch($stmt);
        mysqli_stmt_close($stmt);

        if ($recommended !== null) {
            $query = "SELECT * FROM course WHERE category=? LIMIT 3";
            $stmt = mysqli_prepare($conn, $query);

            if ($stmt) {
                mysqli_stmt_bind_param($stmt, "s", $recommended);
                mysqli_stmt_execute($stmt);
                $result = mysqli_stmt_get_result($stmt);
                if ($result) {
                    $recommended_courses = array();
                    while ($row = mysqli_fetch_assoc($result)) {
                        $recommended_courses[] = $row;
                    }
                    mysqli_stmt_close($stmt);
                    mysqli_free_result($result);
                    return $recommended_courses;
                }
            } else {
                echo "Error: " . mysqli_error($conn);
            }
        } else {
            echo "Error: No recommended courses found for the student.";
        }
    } else {
        echo "Error: " . mysqli_error($conn);
    }
}

function get_all_courses($conn)
{
    $query = "SELECT * FROM course ORDER BY created_at DESC";
    $result = mysqli_query($conn, $query);

    if ($result) {
        $all_courses = array();
        while ($row = mysqli_fetch_assoc($result)) {
            $all_courses[] = $row;
        }
        mysqli_free_result($result);
        return $all_courses;
    } else {
        echo "Error: " . mysqli_error($conn);
    }
}

function get_course_details($conn, $course_id)
{
    $course_query = "SELECT * FROM course WHERE id=?";
    $stmt = mysqli_prepare($conn, $course_query);

    if ($stmt) {
        mysqli_stmt_bind_param($stmt, "i", $course_id);
        mysqli_stmt_execute($stmt);
        $result = mysqli_stmt_get_result($stmt);

        if ($result && $course = mysqli_fetch_assoc($result)) {
            // Learn items
            $course['learn_items'] = json_decode($course['learn_items'], true);

            // Teacher
            $teacher_id = $course['teacher_id'];
            if ($teacher_id) {
                $teacher_query = "SELECT * FROM teacher WHERE id=?";
                $stmt = mysqli_prepare($conn, $teacher_query);

                if ($stmt) {
                    mysqli_stmt_bind_param($stmt, "i", $teacher_id);
                    mysqli_stmt_execute($stmt);
                    $teacher_result = mysqli_stmt_get_result($stmt);
                    if ($teacher_result && $teacher = mysqli_fetch_assoc($teacher_result)) {
                        $course['teacher'] = $teacher;
                        mysqli_free_result($teacher_result);
                    } else {
                        echo "Error fetching teacher: " . mysqli_error($conn);
                    }
                } else {
                    echo "Error preparing teacher query: " . mysqli_error($conn);
                }
            }

            // Lessons
            $lessons_query = "SELECT * FROM lesson WHERE course_id=?";
            $stmt = mysqli_prepare($conn, $lessons_query);
            if ($stmt) {
                mysqli_stmt_bind_param($stmt, "i", $course_id);
                mysqli_stmt_execute($stmt);
                $lessons_result = mysqli_stmt_get_result($stmt);
                if ($lessons_result) {
                    $course_lessons = [];
                    while ($lesson = mysqli_fetch_assoc($lessons_result)) {
                        $course_lessons[] = $lesson;
                    }
                    $course['lessons'] = $course_lessons;
                    mysqli_free_result($lessons_result);
                } else {
                    echo "Error fetching lessons: " . mysqli_error($conn);
                }
            } else {
                echo "Error preparing lessons query: " . mysqli_error($conn);
            }
        } else {
            echo "Error fetching course: " . mysqli_error($conn);
        }
        mysqli_stmt_close($stmt);
        mysqli_free_result($result);
    } else {
        echo "Error preparing course query: " . mysqli_error($conn);
    }

    return $course;
}


function calc_learning_progress_percentage($conn, $username, $course_id, $lessons)
{
    $lessonIds = array_map(function ($lesson) {
        return $lesson['id'];
    }, $lessons);

    $placeholders = implode(",", array_fill(0, count($lessonIds), "?"));
    $query = "SELECT status FROM learning_status WHERE student_username = ? AND course_id = ? AND lesson_id IN ($placeholders)";

    $stmt = mysqli_prepare($conn, $query);
    if (!$stmt) {
        echo "Error preparing query: " . mysqli_error($conn);
        return;
    }

    $bindParams = array_merge([$username, $course_id], array_values($lessonIds));
    $bindParamsRefs = array();
    foreach ($bindParams as $key => $value) {
        $bindParamsRefs[$key] = &$bindParams[$key];
    }

    mysqli_stmt_bind_param($stmt, str_repeat("i", count($lessonIds) + 2), ...$bindParamsRefs);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);

    if (!$result) {
        echo "Error executing query: " . mysqli_error($conn);
        return;
    }

    if (mysqli_num_rows($result) == 0) {
        return -1;
    } else {
        $completedCount = 0;
        while ($row = mysqli_fetch_assoc($result)) {
            if ($row['status'] == 1) {
                $completedCount++;
            }
        }

        $percentage = round(($completedCount / count($lessonIds)) * 100, 0);
        return $percentage;
    }

}


function enroll_course_status($conn, $username, $course_id, $lessons)
{
    $status = "Coming Soon";

    if (empty($lessons)) {
        return $status;
    }

    $learning_percentage = calc_learning_progress_percentage($conn, $username, $course_id, $lessons);
    switch ($learning_percentage) {
        case -1:
            $status = "Ready";
            break;
        case 0:
            $status = "Start Learning";
            break;
        case 100:
            $status = "Completed";
            break;
        default:
            $status = "Continue Learning";
            break;
    }

    return $status;
}

function enroll_course($conn, $username, $course_id, $lessons)
{
    $status = 0;
    $learning_query = "INSERT INTO learning_status (student_username, course_id, lesson_id, status) VALUES (?, ?, ?, ?)";
    $stmt = mysqli_prepare($conn, $learning_query);
    if (!$stmt) {
        echo "Error preparing learning query: " . mysqli_error($conn);
        return;
    }

    // Check if $lessons is an array
    if (!is_array($lessons)) {
        echo "Error: Lessons parameter must be an array";
        return;
    }

    foreach ($lessons as $lesson) {
        $lesson_id = $lesson["id"];
        mysqli_stmt_bind_param($stmt, "siii", $username, $course_id, $lesson_id, $status);
        if (!mysqli_stmt_execute($stmt)) {
            echo "Error inserting learning status: " . mysqli_error($conn);
        }
    }

    mysqli_stmt_close($stmt);

    return enroll_course_status($conn, $username, $course_id, $lessons);
}

function get_learning_course_details($conn, $username, $course_id)
{
    $course_query = "SELECT * FROM course WHERE id=?";
    $stmt = mysqli_prepare($conn, $course_query);

    if ($stmt) {
        mysqli_stmt_bind_param($stmt, "i", $course_id);
        mysqli_stmt_execute($stmt);
        $result = mysqli_stmt_get_result($stmt);

        if ($result && $course = mysqli_fetch_assoc($result)) {
            $lessons_query = "SELECT * FROM lesson WHERE course_id=?";
            $stmt = mysqli_prepare($conn, $lessons_query);
            if ($stmt) {
                mysqli_stmt_bind_param($stmt, "i", $course_id);
                mysqli_stmt_execute($stmt);
                $lessons_result = mysqli_stmt_get_result($stmt);
                if ($lessons_result) {
                    $course_lessons = [];
                    while ($lesson = mysqli_fetch_assoc($lessons_result)) {
                        $lesson['status'] = calc_learning_progress_percentage($conn, $username, $course_id, [$lesson]);
                        $course_lessons[] = $lesson;
                    }
                    $course['lessons'] = $course_lessons;
                    $course['progress'] = calc_learning_progress_percentage($conn, $username, $course_id, $course_lessons);
                    mysqli_free_result($lessons_result);
                } else {
                    echo "Error fetching lessons: " . mysqli_error($conn);
                }
            } else {
                echo "Error preparing lessons query: " . mysqli_error($conn);
            }
        } else {
            echo "Error fetching course: " . mysqli_error($conn);
        }
        mysqli_stmt_close($stmt);
        mysqli_free_result($result);
    } else {
        echo "Error preparing course query: " . mysqli_error($conn);
    }

    return $course;
}

function update_learning_progress_percentage($conn, $username, $course_id, $lesson_id)
{
    $update_query = "UPDATE learning_status SET status = 1 WHERE student_username = ? AND course_id = ? AND lesson_id = ?";
    $stmt = mysqli_prepare($conn, $update_query);

    if ($stmt) {
        mysqli_stmt_bind_param($stmt, "sii", $username, $course_id, $lesson_id);
        if (!mysqli_stmt_execute($stmt)) {
            echo "Error updating learning status: " . mysqli_error($conn);
        }
    } else {
        echo "Error preparing course query: " . mysqli_error($conn);
    }

    mysqli_stmt_close($stmt);

    return get_learning_course_details($conn, $username, $course_id);
}














?>

