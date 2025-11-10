// Mobile menu toggle
const mobileMenuBtn = document.getElementById('mobile-menu-btn');
const mobileMenu = document.getElementById('mobile-menu');

if (mobileMenuBtn && mobileMenu) {
    mobileMenuBtn.addEventListener('click', function() {
        mobileMenu.classList.toggle('hidden');
        
        // Toggle icon
        const icon = this.querySelector('i');
        if (mobileMenu.classList.contains('hidden')) {
            icon.classList.remove('fa-times');
            icon.classList.add('fa-bars');
        } else {
            icon.classList.remove('fa-bars');
            icon.classList.add('fa-times');
        }
    });

    // Close mobile menu when clicking on a link
    document.querySelectorAll('#mobile-menu a').forEach(link => {
        link.addEventListener('click', function() {
            mobileMenu.classList.add('hidden');
            const icon = mobileMenuBtn.querySelector('i');
            icon.classList.remove('fa-times');
            icon.classList.add('fa-bars');
        });
    });
}

// Smooth scroll for anchor links
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        e.preventDefault();
        const target = document.querySelector(this.getAttribute('href'));
        if (target) {
            const offsetTop = target.offsetTop - 80; // Account for fixed nav
            window.scrollTo({
                top: offsetTop,
                behavior: 'smooth'
            });
        }
    });
});

// Add fade-in animation on scroll
const observerOptions = {
    threshold: 0.1,
    rootMargin: '0px 0px -50px 0px'
};

const observer = new IntersectionObserver(function(entries) {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            entry.target.classList.add('fade-in');
            observer.unobserve(entry.target);
        }
    });
}, observerOptions);

// Observe all sections
document.querySelectorAll('section').forEach(section => {
    observer.observe(section);
});

// Form submission handling
const contactForm = document.getElementById('contact-form');
if (contactForm) {
    contactForm.addEventListener('submit', async function(e) {
        e.preventDefault();
        
        const submitBtn = this.querySelector('button[type="submit"]');
        const originalText = submitBtn.innerHTML;
        
        // Show loading state
        submitBtn.classList.add('loading');
        submitBtn.innerHTML = 'Sending...';
        submitBtn.disabled = true;
        
        // Get form data
        const formData = new FormData(this);
        const data = Object.fromEntries(formData);
        
        try {
            // Here you would send to your backend or email service
            // For now, we'll simulate a delay
            await new Promise(resolve => setTimeout(resolve, 1500));
            
            // Show success message
            showAlert('success', 'Thank you! Your message has been sent successfully. We\'ll get back to you soon.');
            this.reset();
            
        } catch (error) {
            // Show error message
            showAlert('error', 'Sorry, there was an error sending your message. Please try again or email us directly.');
        } finally {
            // Reset button state
            submitBtn.classList.remove('loading');
            submitBtn.innerHTML = originalText;
            submitBtn.disabled = false;
        }
    });
}

// Alert helper function
function showAlert(type, message) {
    const alertDiv = document.createElement('div');
    alertDiv.className = `alert alert-${type}`;
    alertDiv.innerHTML = `
        <div class="flex items-center justify-between">
            <span>${message}</span>
            <button onclick="this.parentElement.parentElement.remove()" class="ml-4 text-xl">&times;</button>
        </div>
    `;
    
    const form = document.getElementById('contact-form');
    if (form) {
        form.parentElement.insertBefore(alertDiv, form);
        
        // Auto-remove after 5 seconds
        setTimeout(() => {
            alertDiv.remove();
        }, 5000);
    }
}

// Navbar scroll effect
let lastScroll = 0;
const navbar = document.querySelector('nav');

window.addEventListener('scroll', () => {
    const currentScroll = window.pageYOffset;
    
    if (currentScroll > 100) {
        navbar.classList.add('shadow-lg');
    } else {
        navbar.classList.remove('shadow-lg');
    }
    
    lastScroll = currentScroll;
});

// Add current year to footer
const yearSpan = document.getElementById('current-year');
if (yearSpan) {
    yearSpan.textContent = new Date().getFullYear();
}

// Console message
console.log('%cTelecity Technologies', 'color: #667eea; font-size: 24px; font-weight: bold;');
console.log('%cEmpowering Africa\'s Digital Future', 'color: #764ba2; font-size: 14px;');
console.log('Website: https://telecitytech.com');
console.log('Email: ofatokun@telecitytech.com');
