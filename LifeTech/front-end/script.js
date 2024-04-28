// Custom JavaScript
window.addEventListener('scroll', function() {
    var navbar = document.querySelector('.navbar');
    navbar.classList.toggle('scroll', window.scrollY > 0);
});
