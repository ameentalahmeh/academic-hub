$(document).ready(function () {
    $('.carousel').carousel();
});


$(document).ready(function () {
    var currentPath = window.location.pathname.split('/').pop();
    $('.nav-item a').each(function () {
        var navPath = $(this).attr('href').split('/').pop();
        if (navPath === currentPath) {
            $(this).addClass('active');
        } else {
            $(this).removeClass('active');
        }
    });
});


function redirectToEnrollment(course_id) {
    window.location.href = `learn.php?course_id=${course_id}`;
}



document.addEventListener("DOMContentLoaded", function () {
    const lessonItems = document.querySelectorAll(".lesson-toggle");

    lessonItems.forEach(function (lessonItem) {
        lessonItem.addEventListener("click", function () {
            // Update lesson title area
            const lessonTitle = lessonItem.getAttribute("data-lesson-title");
            const lessonTitleElement = document.querySelector(".lesson-content-title");
            lessonTitleElement.innerHTML = lessonTitle;

            // Update lesson description area
            const lessonDescription = lessonItem.getAttribute("data-lesson-description");
            const lessonDescriptionElement = document.querySelector(".lesson-content-description");
            lessonDescriptionElement.innerHTML = lessonDescription;
        });
    });
});

