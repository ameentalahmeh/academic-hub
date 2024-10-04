<a href="course.php?id=<?php echo $course['id']; ?>" class="card rounded shadow course-card course-link">
    <img src="../assets/images/<?php echo $course['image']; ?>" class="card-img-top"
        alt="<?php echo $course['name']; ?> Image" height="200" width="100%">
    <div class="card-body">
        <h4 class="card-title course-name"><?php echo $course['name']; ?></h4>
        <p class="card-text course-desc"><?php echo $course['description']; ?></p>
        <span class="badge badge-category"><?php echo $course['category']; ?></span>
    </div>
    <div class="card-footer bg-transparent">
        <div class="d-flex justify-content-start align-items-center">
            <span class="badge badge-type"><?php echo $course['type']; ?></span>
            <span class="badge badge-level"><?php echo $course['level']; ?></span>
            <p class="ml-auto mb-0">
                <?php echo $course['price'] == 0 ? 'Free' : '$' . $course['price']; ?>
            </p>
        </div>
    </div>
</a>
