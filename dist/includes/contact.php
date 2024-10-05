<footer class="footer mt-5 p-5 bg-dark text-white">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <h2>Contact Us</h2>
                <!-- Contact details -->
                <p><strong>Address:</strong> 123 Main Street, City, Country</p>
                <p><strong>Phone:</strong> +123 456 789</p>
                <p><strong>Email:</strong> info@academy.com</p>
                <p><strong>Fax:</strong> +123 456 789</p>
            </div>
            <div class="col-md-6">
                <h2>Contact Form</h2>
                <!-- Contact Form -->
                <form action="contact_process.php" method="post">
                    <div class="form-group">
                        <label for="name">Name:</label>
                        <input type="text" class="form-control" id="name" name="name" required>
                    </div>
                    <div class="form-group">
                        <label for="email">Email:</label>
                        <input type="email" class="form-control" id="email" name="email" required>
                    </div>
                    <div class="form-group">
                        <label for="message">Message:</label>
                        <textarea class="form-control" id="message" name="message" rows="5" required></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>
        </div>
        <div class="row mt-3">
            <div class="col-md-12">
                <p>Academic Hub &copy; 2024</p>
            </div>
        </div>
    </div>
</footer>
