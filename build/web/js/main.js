/**
 * AutoWash Pro - Frontend Interactions
 * Designed for PRJ301 Car Wash Management System
 */

document.addEventListener('DOMContentLoaded', () => {
    initModals();
    initMobileNav();
    initSidebar();
    initFormInterceptors();
    initDashboardInteractiveDemo();
});

/* ==========================================================================
 TOAST NOTIFICATION SYSTEM
 ========================================================================== */
function showToast(title, message, type = 'info') {
    // Ensure container exists
    let container = document.querySelector('.toast-container');
    if (!container) {
        container = document.createElement('div');
        container.className = 'toast-container';
        document.body.appendChild(container);
    }

    // Determine icon based on toast type
    let iconClass = 'fa-circle-info';
    if (type === 'success')
        iconClass = 'fa-circle-check';
    if (type === 'error')
        iconClass = 'fa-circle-xmark';

    // Create toast element
    const toast = document.createElement('div');
    toast.className = `toast toast--${type}`;
    toast.innerHTML = `
        <i class="toast__icon fa-solid ${iconClass}"></i>
        <div class="toast__content">
            <div class="toast__title">${title}</div>
            <div class="toast__msg">${message}</div>
        </div>
        <button class="toast__close" aria-label="Close Notification">
            <i class="fa-solid fa-xmark"></i>
        </button>
    `;

    // Append to container
    container.appendChild(toast);

    // Close button event
    const closeBtn = toast.querySelector('.toast__close');
    closeBtn.addEventListener('click', () => {
        dismissToast(toast);
    });

    // Auto dismiss after 4 seconds
    setTimeout(() => {
        dismissToast(toast);
    }, 4000);
}

function dismissToast(toast) {
    if (!toast)
        return;
    toast.style.opacity = '0';
    toast.style.transform = 'translateX(120%)';
    toast.style.transition = 'opacity 0.3s ease, transform 0.3s ease';
    setTimeout(() => {
        if (toast.parentNode) {
            toast.parentNode.removeChild(toast);
        }
    }, 300);
}

/* ==========================================================================
 AUTHENTICATION MODALS
 ========================================================================== */
function initModals() {
    const signInOverlay = document.getElementById('signinModalOverlay');
    const signUpOverlay = document.getElementById('signupModalOverlay');
    const addVehicleOverlay = document.getElementById('addVehicleModalOverlay');
    const bookingOverlay = document.getElementById('bookingModalOverlay');

    const signInCard = document.getElementById('signinModalCard');
    const signUpCard = document.getElementById('signupModalCard');
    const addVehicleCard = document.getElementById('addVehicleModalCard');
    const bookingCard = document.getElementById('bookingModalCard');

    // Select buttons based on target requirements
    const signInBtns = document.querySelectorAll('.auth__signin');
    const signUpBtns = document.querySelectorAll('.auth__signup');

    const closeBtns = document.querySelectorAll('.modal-card__close');

    // Helper functions to open modals
    const openSignIn = () => {
        closeAllModals();
        if (signInOverlay && signInCard) {
            signInOverlay.classList.add('modal-overlay--active');
            signInCard.classList.add('modal-card--active');
            document.body.style.overflow = 'hidden';
            showToast('Sign In', 'Please enter your login details.', 'info');
        }
    };

    const openSignUp = () => {
        closeAllModals();
        if (signUpOverlay && signUpCard) {
            signUpOverlay.classList.add('modal-overlay--active');
            signUpCard.classList.add('modal-card--active');
            document.body.style.overflow = 'hidden';
            showToast('Sign Up', 'Fill in the form to register your account.', 'info');
        }
    };

    const closeAllModals = () => {
        if (signInOverlay)
            signInOverlay.classList.remove('modal-overlay--active');
        if (signUpOverlay)
            signUpOverlay.classList.remove('modal-overlay--active');
        if (signInCard)
            signInCard.classList.remove('modal-card--active');
        if (signUpCard)
            signUpCard.classList.remove('modal-card--active');
        if (addVehicleOverlay)
            addVehicleOverlay.classList.remove('modal-overlay--active');
        if (addVehicleCard)
            addVehicleCard.classList.remove('modal-card--active');
        if (bookingOverlay)
            bookingOverlay.classList.remove('modal-overlay--active');
        if (bookingCard)
            bookingCard.classList.remove('modal-card--active');
        document.body.style.overflow = '';
    };

    // Attach click listeners to signin buttons
    signInBtns.forEach(btn => {
        btn.addEventListener('click', (e) => {
            e.preventDefault();
            openSignIn();
        });
    });

    // Attach click listeners to signup buttons
    signUpBtns.forEach(btn => {
        btn.addEventListener('click', (e) => {
            e.preventDefault();
            openSignUp();
        });
    });

    // Attach Add Vehicle Modal Triggers
    const addVehicleBtns = [
        document.getElementById('addNewVehicleLink'),
        document.getElementById('actionAddVehicle')
    ];
    addVehicleBtns.forEach(btn => {
        if (btn) {
            btn.addEventListener('click', (e) => {
                e.preventDefault();
                closeAllModals();
                if (addVehicleOverlay && addVehicleCard) {
                    addVehicleOverlay.classList.add('modal-overlay--active');
                    addVehicleCard.classList.add('modal-card--active');
                    document.body.style.overflow = 'hidden';
                    showToast('Vehicle Registration', 'Enter details to register your vehicle.', 'info');
                }
            });
        }
    });

    // Attach Booking Modal Triggers
    const bookingBtns = [
        document.getElementById('actionBookWash'),
        document.getElementById('menuBookWash'),
        document.getElementById('heroBookNowBtn')
    ];
    bookingBtns.forEach(btn => {
        if (btn) {
            btn.addEventListener('click', (e) => {
                // If it is index.html and user is not logged in, we let the class auth__signin handle it
                if (btn.id === 'heroBookNowBtn') {
                    // Let the default auth handler open sign in
                    return;
                }
                e.preventDefault();
                closeAllModals();
                if (bookingOverlay && bookingCard) {
                    bookingOverlay.classList.add('modal-overlay--active');
                    bookingCard.classList.add('modal-card--active');
                    document.body.style.overflow = 'hidden';
                    showToast('Book Car Wash', 'Select details to reserve your slot.', 'info');
                }
            });
        }
    });

    // Attach click listeners to close buttons
    closeBtns.forEach(btn => {
        btn.addEventListener('click', (e) => {
            e.preventDefault();
            closeAllModals();
        });
    });

    // Click outside overlay to close modal
    window.addEventListener('click', (e) => {
        if (e.target === signInOverlay || e.target === signUpOverlay || e.target === addVehicleOverlay || e.target === bookingOverlay) {
            closeAllModals();
        }
    });

    // Escape key to close modal
    window.addEventListener('keydown', (e) => {
        if (e.key === 'Escape') {
            closeAllModals();
        }
    });

    const hasLoginError = document.body.dataset.loginError === "true";
    if (hasLoginError) {
        openSignIn();
    }
}

/* ==========================================================================
 MOBILE NAVIGATION
 ========================================================================== */
function initMobileNav() {
    const hamburger = document.getElementById('navbarHamburger');
    const mobileMenu = document.getElementById('navbarMobileMenu');

    if (hamburger && mobileMenu) {
        hamburger.addEventListener('click', () => {
            const isOpen = mobileMenu.classList.contains('active');
            if (isOpen) {
                mobileMenu.classList.remove('active');
                hamburger.innerHTML = '<i class="fa-solid fa-bars"></i>';
            } else {
                mobileMenu.classList.add('active');
                hamburger.innerHTML = '<i class="fa-solid fa-xmark"></i>';
            }
        });

        // Close mobile menu on clicking any navigation link
        const mobileLinks = mobileMenu.querySelectorAll('.navbar__mobile-link');
        mobileLinks.forEach(link => {
            link.addEventListener('click', () => {
                mobileMenu.classList.remove('active');
                hamburger.innerHTML = '<i class="fa-solid fa-bars"></i>';
            });
        });

        // Close mobile menu on clicking sign in or sign up button inside mobile menu
        const mobileBtns = mobileMenu.querySelectorAll('.btn');
        mobileBtns.forEach(btn => {
            btn.addEventListener('click', () => {
                mobileMenu.classList.remove('active');
                hamburger.innerHTML = '<i class="fa-solid fa-bars"></i>';
            });
        });
    }
}

/* ==========================================================================
 DASHBOARD SIDEBAR
 ========================================================================== */
function initSidebar() {
    const toggleBtn = document.getElementById('sidebarToggleBtn');
    const sidebar = document.getElementById('dashboardSidebar');

    if (toggleBtn && sidebar) {
        toggleBtn.addEventListener('click', (e) => {
            e.stopPropagation();
            sidebar.classList.toggle('sidebar--open');
        });

        // Close sidebar on clicking outside (for mobile viewports)
        document.addEventListener('click', (e) => {
            if (sidebar.classList.contains('sidebar--open') && !sidebar.contains(e.target) && e.target !== toggleBtn) {
                sidebar.classList.remove('sidebar--open');
            }
        });
    }
}

/* ==========================================================================
 FORM INTERCEPTORS (FRONTEND VALIDATION)
 ========================================================================== */
function initFormInterceptors() {
    const loginForm = document.querySelector('form[action="LoginServlet"]');
    const registerForm = document.querySelector('form[action="register"]');
    const vehicleForm = document.querySelector('form[action="vehicle"]');
    const bookingForm = document.querySelector('form[action="booking"]');
    const settingsForm = document.querySelector('form[action="settings"]');
    const rewardForm = document.querySelector('form[action="reward"]');
    const historyForm = document.querySelector('form[action="history"]');

    if (loginForm) {
        loginForm.addEventListener('submit', (e) => {
            const emailInput = document.getElementById('loginEmail');
            const passwordInput = document.getElementById('loginPassword');

            if (!emailInput.value.trim()) {
                showToast('Validation Warning', 'Please provide a valid email.', 'error');
                e.preventDefault();
                return;
            }

            if (passwordInput.value.length < 6) {
                showToast('Validation Warning', 'Password must contain at least 6 characters.', 'error');
                e.preventDefault();
                return;
            }

            // Note: Since this is frontend UI only, we log details and inform the user
            showToast('Form Validated', 'Submitting login request to Java Servlet...', 'success');
            // Form is allowed to submit via POST to 'login' servlet
        });
    }

    if (registerForm) {
        registerForm.addEventListener('submit', (e) => {
            const fullName = document.getElementById('regFullName').value.trim();
            const email = document.getElementById('regEmail').value.trim();
            const phone = document.getElementById('regPhone').value.trim();
            const password = document.getElementById('regPassword').value;
            const confirmPassword = document.getElementById('regConfirmPassword').value;
            const vehiclePlate = document.getElementById('regVehiclePlate').value.trim();

            if (!fullName || !email || !phone || !password || !confirmPassword || !vehiclePlate) {
                showToast('Validation Warning', 'All fields are required to register.', 'error');
                e.preventDefault();
                return;
            }

            // Password matching
            if (password !== confirmPassword) {
                showToast('Validation Warning', 'Passwords do not match.', 'error');
                e.preventDefault();
                return;
            }

            if (password.length < 6) {
                showToast('Validation Warning', 'Password must be at least 6 characters.', 'error');
                e.preventDefault();
                return;
            }

            // Basic phone format check
            const phoneRegex = /^[0-9+\s-]{8,15}$/;
            if (!phoneRegex.test(phone)) {
                showToast('Validation Warning', 'Please enter a valid phone number (digits only).', 'error');
                e.preventDefault();
                return;
            }

            showToast('Form Validated', 'Submitting registration to Java Servlet...', 'success');
            // Form is allowed to submit via POST to 'register' servlet
        });
    }

    if (vehicleForm) {
        vehicleForm.addEventListener('submit', (e) => {
            const vehicleModel = document.getElementById('vehicleModel').value.trim();
            const licensePlate = document.getElementById('licensePlate').value.trim();
            const vehicleType = document.getElementById('vehicleType').value;

            if (!vehicleModel || !licensePlate || !vehicleType) {
                showToast('Validation Warning', 'All vehicle fields are required.', 'error');
                e.preventDefault();
                return;
            }

            showToast('Form Validated', 'Adding vehicle to DB via VehicleServlet...', 'success');
            // Form is allowed to submit via POST to 'vehicle' servlet
        });
    }

    if (bookingForm) {
        bookingForm.addEventListener('submit', (e) => {
            const bookingVehicle = document.getElementById('bookingVehicle').value;
            const washPackage = document.getElementById('washPackage').value;
            const bookingDate = document.getElementById('bookingDate').value;
            const bookingTimeSlot = document.getElementById('bookingTimeSlot').value;
            const bookingLane = document.getElementById('bookingLane').value;

            if (!bookingVehicle || !washPackage || !bookingDate || !bookingTimeSlot || !bookingLane) {
                showToast('Validation Warning', 'Please fill in all booking fields.', 'error');
                e.preventDefault();
                return;
            }

            showToast('Form Validated', 'Creating reservation via BookingServlet...', 'success');
            // Form is allowed to submit via POST to 'booking' servlet
        });
    }

    if (settingsForm) {
        settingsForm.addEventListener('submit', (e) => {
            const fullName = document.getElementById('settingsFullName').value.trim();
            const email = document.getElementById('settingsEmail').value.trim();
            const phone = document.getElementById('settingsPhone').value.trim();
            const currentPassword = document.getElementById('settingsCurrentPassword').value;
            const newPassword = document.getElementById('settingsNewPassword').value;

            if (!fullName || !email || !phone) {
                showToast('Validation Warning', 'Full Name, Email, and Phone are required.', 'error');
                e.preventDefault();
                return;
            }

            if (newPassword && newPassword.length < 6) {
                showToast('Validation Warning', 'New password must be at least 6 characters.', 'error');
                e.preventDefault();
                return;
            }

            showToast('Form Validated', 'Updating profile details via SettingsServlet...', 'success');
            // Form is allowed to submit via POST to 'settings' servlet
        });
    }

    if (rewardForm) {
        rewardForm.addEventListener('submit', (e) => {
            const promoCode = document.getElementById('promoCode').value.trim();

            if (!promoCode) {
                showToast('Validation Warning', 'Please enter a valid promo code.', 'error');
                e.preventDefault();
                return;
            }

            showToast('Form Validated', 'Applying coupon code via RewardServlet...', 'success');
            // Form is allowed to submit via POST to 'reward' servlet
        });
    }

    if (historyForm) {
        historyForm.addEventListener('submit', (e) => {
            showToast('Filtering Wash History', 'Querying database via HistoryServlet...', 'success');
            // Form is allowed to submit via POST to 'history' servlet
        });
    }
}

/* ==========================================================================
 INTERACTIVE DASHBOARD DEMO
 ========================================================================== */
function initDashboardInteractiveDemo() {
    // If we are on the dashboard page, hooks for user actions to simulate responses
    const quickActions = document.querySelectorAll('.quick-action-btn');
    quickActions.forEach(btn => {
        btn.addEventListener('click', (e) => {
            const label = btn.querySelector('.quick-action-btn__lbl').innerText;
            if (label === 'Scan Code') {
                showToast('Loyalty Rewards', 'Camera activated for license plate or barcode scanning.', 'info');
            }
        });
    });

    const promoCardCopyBtns = document.querySelectorAll('.promo-card__copy-btn');
    promoCardCopyBtns.forEach(btn => {
        btn.addEventListener('click', () => {
            const code = btn.previousElementSibling.innerText;
            navigator.clipboard.writeText(code).then(() => {
                showToast('Copied Code', `Promo code "${code}" copied to clipboard!`, 'success');
            }).catch(() => {
                showToast('Error', 'Unable to copy to clipboard.', 'error');
            });
        });
    });
}

document.addEventListener("DOMContentLoaded", function () {
    const hasLoginError = document.body.dataset.loginError === "true";
    if (hasLoginError) {
        document.getElementById('signinModalOverlay').classList.add('modal-overlay--active');
        document.getElementById('signinModalCard').classList.add('modal-card--active');
        document.body.style.overflow = 'hidden';
    }
});
