<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description"
              content="Modern automated car wash platform with loyalty rewards, multi-vehicle management, and smart booking experience.">
        <title>AutoWash Pro - Smart Automated Car Wash Platform</title>
        <!-- Google Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link
            href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Outfit:wght@400;500;600;700;800&display=swap"
            rel="stylesheet">
        <!-- FontAwesome Icons -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <!-- Stylesheets -->
        <link rel="stylesheet" href="css/reset.css">
        <link rel="stylesheet" href="css/style.css">
        <!-- Script -->
        <script src="js/main.js" defer></script>
    </head>

    <body data-login-error="${not empty requestScope.ERROR}">

        <!-- ==========================================================================
           1. HEADER / NAVBAR
           ========================================================================== -->
        <header class="navbar" id="appNavbar">
            <div class="container navbar__container">
                <a href="index.jsp" class="navbar__logo" id="logoLink">
                    <i class="fa-solid fa-droplet navbar__logo-icon"></i>
                    AutoWash Pro
                </a>

                <nav class="navbar__links" id="mainNavigation">
                    <a href="#features" class="navbar__link">Features</a>
                    <a href="#membership" class="navbar__link">Membership</a>
                    <a href="#vehicles" class="navbar__link">Vehicle Management</a>
                    <a href="#promotions" class="navbar__link">Promotions</a>
                </nav>

                <div class="navbar__actions" id="navbarActions">
                    <button type="button" class="btn btn--outline auth__signin" id="navSignInBtn">Sign In</button>
                    <button type="button" class="btn btn--primary auth__signup" id="navSignUpBtn">Sign Up</button>
                </div>

                <button type="button" class="navbar__hamburger" id="navbarHamburger" aria-label="Toggle Navigation">
                    <i class="fa-solid fa-bars"></i>
                </button>
            </div>

            <!-- Mobile Navigation Panel -->
            <div class="navbar__mobile-menu" id="navbarMobileMenu">
                <a href="#features" class="navbar__mobile-link">Features</a>
                <a href="#membership" class="navbar__mobile-link">Membership</a>
                <a href="#vehicles" class="navbar__mobile-link">Vehicle Management</a>
                <a href="#promotions" class="navbar__mobile-link">Promotions</a>
                <div class="navbar__actions--mobile">
                    <button type="button" class="btn btn--outline auth__signin" id="mobileSignInBtn">Sign In</button>
                    <button type="button" class="btn btn--primary auth__signup" id="mobileSignUpBtn">Sign Up</button>
                </div>
            </div>
        </header>

        <main>

            <!-- ==========================================================================
               2. HERO SECTION
               ========================================================================== -->
            <section class="hero" id="home">
                <div class="container hero__grid">
                    <div class="hero__content">
                        <div class="hero__badge">
                            <span class="hero__badge-pulse"></span>
                            Smart Automated Car Wash Experience
                        </div>
                        <h1 class="hero__title">Smart Car Wash Experience for Modern Drivers</h1>
                        <p class="hero__subtitle">Book faster, manage multiple vehicles, and unlock premium rewards with
                            AutoWash Pro.</p>
                        <div class="hero__actions">
                            <button type="button" class="btn btn--primary auth__signup" id="heroGetStartedBtn">
                                Get Started <i class="fa-solid fa-arrow-right"></i>
                            </button>
                            <button type="button" class="btn btn--outline auth__signin" id="heroBookNowBtn">
                                Book Now
                            </button>
                            <a href="#membership" class="btn btn--secondary" id="heroJoinMembershipBtn">
                                Join Membership
                            </a>
                        </div>
                    </div>

                    <div class="hero__visual">
                        <div class="hero__image-wrapper">
                            <div class="hero__image-graphic">
                                <span class="hero__graphic-bubble hero__graphic-bubble--1"></span>
                                <span class="hero__graphic-bubble hero__graphic-bubble--2"></span>
                                <span class="hero__graphic-bubble hero__graphic-bubble--3"></span>
                                <div class="hero__graphic-content">
                                    <i class="fa-solid fa-car-clean hero__graphic-icon"></i>
                                    <div class="hero__graphic-text">AutoWash Pro</div>
                                </div>
                            </div>
                        </div>
                        <!-- Floating Info Card 1 -->
                        <div class="hero__floating-card hero__floating-card--1">
                            <div class="hero__floating-icon">
                                <i class="fa-solid fa-qrcode"></i>
                            </div>
                            <div>
                                <div class="hero__floating-title">Instant Scan</div>
                                <div class="hero__floating-desc">LPR Entry in 3s</div>
                            </div>
                        </div>
                        <!-- Floating Info Card 2 -->
                        <div class="hero__floating-card hero__floating-card--2">
                            <div class="hero__floating-icon">
                                <i class="fa-solid fa-circle-check"></i>
                            </div>
                            <div>
                                <div class="hero__floating-title">Smart Booking</div>
                                <div class="hero__floating-desc">Priority Lane active</div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- ==========================================================================
               3. FEATURES SECTION
               ========================================================================== -->
            <section class="section section--white" id="features">
                <div class="container">
                    <div class="section-header">
                        <span class="section-header__badge">Features</span>
                        <h2 class="section-header__title">Why Choose AutoWash Pro?</h2>
                        <p class="section-header__subtitle">Experience a smarter way to keep your vehicles clean, tracked, and
                            rewarded.</p>
                    </div>

                    <div class="feature-grid">
                        <!-- Smart booking -->
                        <article class="feature-card" id="featSmartBooking">
                            <div class="feature-card__icon">
                                <i class="fa-solid fa-calendar-check"></i>
                            </div>
                            <h3 class="feature-card__title">Smart Booking</h3>
                            <p class="feature-card__desc">Reserve your wash in seconds with priority scheduling.</p>
                        </article>

                        <!-- Loyalty membership -->
                        <article class="feature-card" id="featLoyaltyMembership">
                            <div class="feature-card__icon">
                                <i class="fa-solid fa-award"></i>
                            </div>
                            <h3 class="feature-card__title">VIP Membership</h3>
                            <p class="feature-card__desc">Enjoy premium car wash experiences with priority access.</p>
                        </article>

                        <!-- Rewards tracking -->
                        <article class="feature-card" id="featRewardsTracking">
                            <div class="feature-card__icon">
                                <i class="fa-solid fa-coins"></i>
                            </div>
                            <h3 class="feature-card__title">Loyalty Rewards</h3>
                            <p class="feature-card__desc">Earn points and unlock exclusive promotions.</p>
                        </article>

                        <!-- Multiple vehicles -->
                        <article class="feature-card" id="featMultipleVehicles">
                            <div class="feature-card__icon">
                                <i class="fa-solid fa-car-tunnel"></i>
                            </div>
                            <h3 class="feature-card__title">Multi-Vehicle Management</h3>
                            <p class="feature-card__desc">Manage all your vehicles in one account.</p>
                        </article>

                        <!-- LPR support -->
                        <article class="feature-card" id="featLprSupport">
                            <div class="feature-card__icon">
                                <i class="fa-solid fa-camera"></i>
                            </div>
                            <h3 class="feature-card__title">License Plate Recognition</h3>
                            <p class="feature-card__desc">Automated LPR scanner recognizes your vehicle at the entry gate.</p>
                        </article>

                        <!-- Customer dashboard -->
                        <article class="feature-card" id="featCustomerDashboard">
                            <div class="feature-card__icon">
                                <i class="fa-solid fa-chart-line"></i>
                            </div>
                            <h3 class="feature-card__title">Customer Dashboard</h3>
                            <p class="feature-card__desc">Track rewards, manage vehicles, and book washes from one centralized
                                dashboard.</p>
                        </article>

                        <!-- Promotions -->
                        <article class="feature-card" id="featPromotions">
                            <div class="feature-card__icon">
                                <i class="fa-solid fa-tags"></i>
                            </div>
                            <h3 class="feature-card__title">Personalized Promotions</h3>
                            <p class="feature-card__desc">Receive offers based on your membership tier.</p>
                        </article>

                        <!-- Wash history -->
                        <article class="feature-card" id="featWashHistory">
                            <div class="feature-card__icon">
                                <i class="fa-solid fa-history"></i>
                            </div>
                            <h3 class="feature-card__title">Wash History</h3>
                            <p class="feature-card__desc">Access details and receipts of all your past washes instantly.</p>
                        </article>
                    </div>
                </div>
            </section>

            <!-- ==========================================================================
               4. MEMBERSHIP TIER SECTION
               ========================================================================== -->
            <section class="section section--light" id="membership">
                <div class="container">
                    <div class="section-header">
                        <span class="section-header__badge">Membership Tiers</span>
                        <h2 class="section-header__title">Select Your Wash Plan</h2>
                        <p class="section-header__subtitle">Unlock priority queues, bonus points, and VIP benefits tailored to
                            your routine.</p>
                    </div>

                    <div class="tier-grid">
                        <!-- Member Tier -->
                        <article class="tier-card" id="tierMember">
                            <div class="tier-card__badge tier-card__badge--member">
                                <i class="fa-solid fa-user"></i>
                            </div>
                            <h3 class="tier-card__name">Member</h3>
                            <p class="tier-card__desc">Basic rewards and booking access.</p>
                            <div class="tier-card__price-wrapper">
                                <span class="tier-card__price">Free</span>
                                <span class="tier-card__duration">/ lifetime</span>
                            </div>
                            <ul class="tier-card__features">
                                <li class="tier-card__feature-item"><i class="fa-solid fa-check tier-card__feature-icon"></i>
                                    Standard scheduling</li>
                                <li class="tier-card__feature-item"><i class="fa-solid fa-check tier-card__feature-icon"></i> 1
                                    reward point per wash</li>
                                <li class="tier-card__feature-item"><i class="fa-solid fa-check tier-card__feature-icon"></i>
                                    Max 1 registered vehicle</li>
                            </ul>
                            <button type="button" class="btn btn--outline auth__signup">Select Plan</button>
                        </article>

                        <!-- Silver Tier -->
                        <article class="tier-card" id="tierSilver">
                            <div class="tier-card__badge tier-card__badge--silver">
                                <i class="fa-solid fa-shield-halved"></i>
                            </div>
                            <h3 class="tier-card__name">Silver</h3>
                            <p class="tier-card__desc">Extra rewards and faster booking.</p>
                            <div class="tier-card__price-wrapper">
                                <span class="tier-card__price">$19</span>
                                <span class="tier-card__duration">/ month</span>
                            </div>
                            <ul class="tier-card__features">
                                <li class="tier-card__feature-item"><i class="fa-solid fa-check tier-card__feature-icon"></i>
                                    Faster scheduling</li>
                                <li class="tier-card__feature-item"><i class="fa-solid fa-check tier-card__feature-icon"></i>
                                    1.5x bonus points</li>
                                <li class="tier-card__feature-item"><i class="fa-solid fa-check tier-card__feature-icon"></i>
                                    Max 3 registered vehicles</li>
                                <li class="tier-card__feature-item"><i class="fa-solid fa-check tier-card__feature-icon"></i>
                                    10% off custom add-ons</li>
                            </ul>
                            <button type="button" class="btn btn--outline auth__signup">Select Plan</button>
                        </article>

                        <!-- Gold Tier -->
                        <article class="tier-card tier-card--popular" id="tierGold">
                            <div class="tier-card__badge tier-card__badge--gold">
                                <i class="fa-solid fa-crown"></i>
                            </div>
                            <h3 class="tier-card__name">Gold</h3>
                            <p class="tier-card__desc">Priority service and bonus points.</p>
                            <div class="tier-card__price-wrapper">
                                <span class="tier-card__price">$39</span>
                                <span class="tier-card__duration">/ month</span>
                            </div>
                            <ul class="tier-card__features">
                                <li class="tier-card__feature-item"><i class="fa-solid fa-check tier-card__feature-icon"></i>
                                    Priority queue access</li>
                                <li class="tier-card__feature-item"><i class="fa-solid fa-check tier-card__feature-icon"></i> 2x
                                    bonus points</li>
                                <li class="tier-card__feature-item"><i class="fa-solid fa-check tier-card__feature-icon"></i>
                                    Max 5 registered vehicles</li>
                                <li class="tier-card__feature-item"><i class="fa-solid fa-check tier-card__feature-icon"></i> 1
                                    free monthly interior polish</li>
                            </ul>
                            <button type="button" class="btn btn--primary auth__signup">Select Plan</button>
                        </article>

                        <!-- Platinum Tier -->
                        <article class="tier-card" id="tierPlatinum">
                            <div class="tier-card__badge tier-card__badge--platinum">
                                <i class="fa-solid fa-gem"></i>
                            </div>
                            <h3 class="tier-card__name">Platinum</h3>
                            <p class="tier-card__desc">Maximum rewards and VIP experience.</p>
                            <div class="tier-card__price-wrapper">
                                <span class="tier-card__price">$59</span>
                                <span class="tier-card__duration">/ month</span>
                            </div>
                            <ul class="tier-card__features">
                                <li class="tier-card__feature-item"><i class="fa-solid fa-check tier-card__feature-icon"></i>
                                    VIP Lane & No-wait priority</li>
                                <li class="tier-card__feature-item"><i class="fa-solid fa-check tier-card__feature-icon"></i> 3x
                                    bonus points</li>
                                <li class="tier-card__feature-item"><i class="fa-solid fa-check tier-card__feature-icon"></i>
                                    Unlimited vehicles</li>
                                <li class="tier-card__feature-item"><i class="fa-solid fa-check tier-card__feature-icon"></i>
                                    Complimentary engine bay clean</li>
                            </ul>
                            <button type="button" class="btn btn--outline auth__signup">Select Plan</button>
                        </article>
                    </div>
                </div>
            </section>

            <!-- ==========================================================================
               5. VEHICLE MANAGEMENT SECTION
               ========================================================================== -->
            <section class="section section--white" id="vehicles">
                <div class="container vehicle-section__grid">
                    <div class="vehicle-section__content">
                        <span class="vehicle-section__badge">Centralized Account</span>
                        <h2 class="vehicle-section__title">Manage all your vehicles in one account.</h2>
                        <p class="vehicle-section__desc">Whether you have a family collection, business delivery vans, or
                            personal commuter cars, register them all under a single dashboard profile. Track active statuses,
                            schedules, and license plates in real time.</p>

                        <div class="vehicle-section__list">
                            <div class="vehicle-section__item">
                                <div class="vehicle-section__item-icon">
                                    <i class="fa-solid fa-fingerprint"></i>
                                </div>
                                <div>
                                    <h3 class="vehicle-section__item-title">LPR Gate Sync</h3>
                                    <p class="vehicle-section__item-desc">Our intelligent License Plate Recognition reads your
                                        registered vehicle plates and rolls up the entry gate instantly.</p>
                                </div>
                            </div>
                            <div class="vehicle-section__item">
                                <div class="vehicle-section__item-icon">
                                    <i class="fa-solid fa-list-check"></i>
                                </div>
                                <div>
                                    <h3 class="vehicle-section__item-title">Unified History</h3>
                                    <p class="vehicle-section__item-desc">Consolidate bills, wash statuses, and loyalty points
                                        across all family cars into a single payment plan.</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="vehicle-section__visual">
                        <div class="vehicle-showcase">
                            <div class="vehicle-showcase__header">
                                <h3 class="vehicle-showcase__title">My Registered Vehicles</h3>
                                <span class="badge badge--primary-bold"><i class="fa-solid fa-car"></i> 3 Cars</span>
                            </div>
                            <div class="vehicle-showcase__cards">
                                <!-- Car 1: Clean -->
                                <article class="vehicle-demo-card vehicle-demo-card--clean">
                                    <div class="vehicle-demo-card__left">
                                        <div class="vehicle-demo-card__icon">
                                            <i class="fa-solid fa-car-side"></i>
                                        </div>
                                        <div>
                                            <h4 class="vehicle-demo-card__name">Tesla Model 3 (Sedan)</h4>
                                            <span class="vehicle-demo-card__plate">51K-123.45</span>
                                        </div>
                                    </div>
                                    <span class="vehicle-demo-card__badge vehicle-demo-card__badge--clean">Clean</span>
                                </article>

                                <!-- Car 2: Needs Wash -->
                                <article class="vehicle-demo-card">
                                    <div class="vehicle-demo-card__left">
                                        <div class="vehicle-demo-card__icon">
                                            <i class="fa-solid fa-truck-pickup"></i>
                                        </div>
                                        <div>
                                            <h4 class="vehicle-demo-card__name">Ford F-150 (Truck)</h4>
                                            <span class="vehicle-demo-card__plate">30H-987.65</span>
                                        </div>
                                    </div>
                                    <span class="vehicle-demo-card__badge vehicle-demo-card__badge--dirty">Needs Wash</span>
                                </article>

                                <!-- Car 3: Clean -->
                                <article class="vehicle-demo-card vehicle-demo-card--clean">
                                    <div class="vehicle-demo-card__left">
                                        <div class="vehicle-demo-card__icon">
                                            <i class="fa-solid fa-van-shuttle"></i>
                                        </div>
                                        <div>
                                            <h4 class="vehicle-demo-card__name">Honda CR-V (SUV)</h4>
                                            <span class="vehicle-demo-card__plate">43A-555.22</span>
                                        </div>
                                    </div>
                                    <span class="vehicle-demo-card__badge vehicle-demo-card__badge--clean">Clean</span>
                                </article>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- ==========================================================================
               6. PROMOTIONS / REWARDS SECTION
               ========================================================================== -->
            <section class="section section--light" id="promotions">
                <div class="container">
                    <div class="promo-banner">
                        <div class="promo-banner__content">
                            <span class="promo-banner__badge">Exclusive Rewards</span>
                            <h2 class="promo-banner__title">Personalized Offers & Points Tracking</h2>
                            <p class="promo-banner__desc">Earn 10 points on every wash! Accumulate points to trade for free
                                detailing packages, priority entries, or high-grade ceramic coatings. Log into your dashboard to
                                discover tailored promotions based on your tier status.</p>

                            <div class="promo-banner__stats">
                                <div class="promo-banner__stat">
                                    <span class="promo-banner__stat-num">10+</span>
                                    <span class="promo-banner__stat-lbl">Active Promos</span>
                                </div>
                                <div class="promo-banner__stat">
                                    <span class="promo-banner__stat-num">2x</span>
                                    <span class="promo-banner__stat-lbl">Points on Weekends</span>
                                </div>
                            </div>
                        </div>

                        <div class="promo-banner__visual">
                            <!-- Digital Membership Card representation -->
                            <div class="promo-banner__card">
                                <div class="promo-banner__card-header">
                                    <span class="promo-banner__card-logo"><i class="fa-solid fa-droplet"></i> AutoWash</span>
                                    <span class="promo-banner__card-chip"></span>
                                </div>
                                <div class="promo-banner__card-number">•••• •••• 9876</div>
                                <div class="promo-banner__card-footer">
                                    <div>
                                        <span class="promo-banner__card-holder">Member Name</span>
                                        <div class="promo-banner__card-name">Alex Johnson</div>
                                    </div>
                                    <span class="promo-banner__card-tier">GOLD MEMBER</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- ==========================================================================
               7. CTA SECTION
               ========================================================================== -->
            <section class="section section--white">
                <div class="container">
                    <div class="cta-banner">
                        <div class="cta-banner__content">
                            <h2 class="cta-banner__title">Upgrade your car wash experience today.</h2>
                            <p class="cta-banner__desc">Ready to experience automated booking, premium loyalty bonuses, and
                                multi-car registration? Create your account or sign in to get started.</p>
                            <div class="cta-banner__actions">
                                <button type="button" class="btn btn--white auth__signup">Get Started <i
                                        class="fa-solid fa-arrow-right"></i></button>
                                <button type="button" class="btn btn--outline-white auth__signin">Sign In</button>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

        </main>

        <!-- ==========================================================================
           8. FOOTER
           ========================================================================== -->
        <footer class="footer">
            <div class="container footer__grid">
                <div class="footer__brand">
                    <a href="index.jsp" class="footer__logo">
                        <i class="fa-solid fa-droplet footer__logo-icon"></i>
                        AutoWash Pro
                    </a>
                    <p class="footer__desc">AutoWash Pro is a leading edge SaaS solution built for automated car wash
                        schedules, loyalty tier management, and license plate check-ins.</p>
                    <div class="footer__socials">
                        <a href="#" class="footer__social-btn" aria-label="Facebook"><i
                                class="fa-brands fa-facebook-f"></i></a>
                        <a href="#" class="footer__social-btn" aria-label="Twitter"><i class="fa-brands fa-twitter"></i></a>
                        <a href="#" class="footer__social-btn" aria-label="Instagram"><i
                                class="fa-brands fa-instagram"></i></a>
                        <a href="#" class="footer__social-btn" aria-label="LinkedIn"><i
                                class="fa-brands fa-linkedin-in"></i></a>
                    </div>
                </div>

                <div>
                    <h3 class="footer__col-title">Navigation</h3>
                    <ul class="footer__links">
                        <li><a href="#home" class="footer__link">Home</a></li>
                        <li><a href="#features" class="footer__link">Features</a></li>
                        <li><a href="#membership" class="footer__link">Membership Tiers</a></li>
                        <li><a href="#vehicles" class="footer__link">Vehicles</a></li>
                    </ul>
                </div>

                <div>
                    <h3 class="footer__col-title">Support</h3>
                    <ul class="footer__links">
                        <li><a href="#" class="footer__link">FAQ</a></li>
                        <li><a href="#" class="footer__link">Contact Support</a></li>
                        <li><a href="#" class="footer__link">Terms of Service</a></li>
                        <li><a href="#" class="footer__link">Privacy Policy</a></li>
                    </ul>
                </div>

                <div>
                    <h3 class="footer__col-title">Contact</h3>
                    <ul class="footer__links footer__links--reset">
                        <li class="footer__link"><i class="fa-solid fa-envelope"></i> support@autowash.pro</li>
                        <li class="footer__link"><i class="fa-solid fa-phone"></i> +1 (555) 019-2834</li>
                        <li class="footer__link"><i class="fa-solid fa-location-dot"></i> 100 Water Tech Blvd, Clean City
                        </li>
                    </ul>
                </div>
            </div>

            <div class="container footer__bottom">
                <p class="footer__copyright">&copy; 2026 AutoWash Pro. All rights reserved. Prepared for FPT PRJ301 Project.
                </p>
                <div class="footer__bottom-links">
                    <a href="dashboard.jsp" class="footer__link"><i class="fa-solid fa-chart-pie"></i> View Demo
                        Dashboard</a>
                </div>
            </div>
        </footer>

        <!-- ==========================================================================
           AUTHENTICATION MODAL: SIGN IN
           ========================================================================== -->
        <div class="modal-overlay" id="signinModalOverlay">
            <div class="modal-card" id="signinModalCard" role="dialog" aria-modal="true" aria-labelledby="signinTitle">
                <div class="modal-card__header">
                    <h2 class="modal-card__title" id="signinTitle">Welcome Back</h2>
                    <button type="button" class="modal-card__close" aria-label="Close Modal" id="closeSignInBtn">
                        <i class="fa-solid fa-xmark"></i>
                    </button>
                </div>

                <div class="modal-card__body">
                    <p class="modal-card__lead">Access your dashboard to book washes, manage license plates, and track
                        points.</p>

                    <!-- TODO: Connect LoginServlet -->
                    <!-- TODO: Validate data from SQL Server -->
                    <form action="LoginServlet" method="post" id="signInServletForm">

                        <div class="form-group">
                            <label for="loginEmail" class="form-group__label">Email Address</label>
                            <div class="form-group__input-wrapper">
                                <i class="fa-solid fa-envelope form-group__icon"></i>
                                <input type="email" class="form-group__input" id="loginEmail" name="email"
                                       placeholder="name@example.com" autocomplete="email" required maxlength="50">
                            </div>
                            <p class="form-error">${requestScope.ERROR}</p>
                        </div>

                        <div class="form-group">
                            <label for="loginPassword" class="form-group__label">Password</label>
                            <div class="form-group__input-wrapper">
                                <i class="fa-solid fa-lock form-group__icon"></i>
                                <input type="password" class="form-group__input" id="loginPassword" name="password"
                                       placeholder="Enter your password" autocomplete="current-password" required minlength="3" maxlength="20">
                            </div>
                        </div>

                        <div class="form-actions-row">
                            <label class="form-checkbox" for="loginRemember">
                                <input type="checkbox" class="form-checkbox__input" id="loginRemember" name="remember"
                                       value="true">
                                Remember me
                            </label>
                            <a href="#" class="form-link" id="forgotPasswordLink">Forgot Password?</a>
                        </div>

                        <button type="submit" class="btn btn--primary" id="submitSignInBtn">
                            Sign In
                        </button>
                    </form>
                </div>

                <div class="modal-card__footer">
                    Don't have an account? <a href="#" class="form-link auth__signup" id="switchToSignUp">Create Account</a>
                </div>
            </div>
        </div>

        <!-- ==========================================================================
           AUTHENTICATION MODAL: SIGN UP
           ========================================================================== -->
        <div class="modal-overlay" id="signupModalOverlay">
            <div class="modal-card" id="signupModalCard" role="dialog" aria-modal="true" aria-labelledby="signupTitle">
                <div class="modal-card__header">
                    <h2 class="modal-card__title" id="signupTitle">Create Account</h2>
                    <button type="button" class="modal-card__close" aria-label="Close Modal" id="closeSignUpBtn">
                        <i class="fa-solid fa-xmark"></i>
                    </button>
                </div>

                <div class="modal-card__body">
                    <p class="modal-card__lead">Start managing your vehicles and accumulating premium points today.</p>

                    <!-- TODO: Connect RegisterServlet -->
                    <!-- TODO: Validate data from SQL Server -->
                    <form action="register" method="post" id="signUpServletForm">

                        <div class="form-group">
                            <label for="regFullName" class="form-group__label">Full Name</label>
                            <div class="form-group__input-wrapper">
                                <i class="fa-solid fa-user form-group__icon"></i>
                                <input type="text" class="form-group__input" id="regFullName" name="fullName"
                                       placeholder="John Doe" autocomplete="name" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="regEmail" class="form-group__label">Email Address</label>
                            <div class="form-group__input-wrapper">
                                <i class="fa-solid fa-envelope form-group__icon"></i>
                                <input type="email" class="form-group__input" id="regEmail" name="email"
                                       placeholder="name@example.com" autocomplete="email" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="regPhone" class="form-group__label">Phone Number</label>
                            <div class="form-group__input-wrapper">
                                <i class="fa-solid fa-phone form-group__icon"></i>
                                <input type="tel" class="form-group__input" id="regPhone" name="phone"
                                       placeholder="+1 (555) 000-0000" autocomplete="tel" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="regVehiclePlate" class="form-group__label">Primary Vehicle Plate</label>
                            <div class="form-group__input-wrapper">
                                <i class="fa-solid fa-car form-group__icon"></i>
                                <input type="text" class="form-group__input" id="regVehiclePlate" name="vehiclePlate"
                                       placeholder="e.g. 51K-12345" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="regPassword" class="form-group__label">Password</label>
                            <div class="form-group__input-wrapper">
                                <i class="fa-solid fa-lock form-group__icon"></i>
                                <input type="password" class="form-group__input" id="regPassword" name="password"
                                       placeholder="Min 6 characters" autocomplete="new-password" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="regConfirmPassword" class="form-group__label">Confirm Password</label>
                            <div class="form-group__input-wrapper">
                                <i class="fa-solid fa-shield form-group__icon"></i>
                                <input type="password" class="form-group__input" id="regConfirmPassword"
                                       name="confirmPassword" placeholder="Confirm your password" autocomplete="new-password" required>
                            </div>
                        </div>

                        <button type="submit" class="btn btn--primary" id="submitSignUpBtn">
                            Create Account
                        </button>
                    </form>
                </div>

                <div class="modal-card__footer">
                    Already have an account? <a href="#" class="form-link auth__signin" id="switchToSignIn">Sign In</a>
                </div>
            </div>
        </div>

    </body>

</html>