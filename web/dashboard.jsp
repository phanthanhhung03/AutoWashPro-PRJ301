<%@page import="dto.Customer"%>

<%
    Customer user = (Customer) session.getAttribute("USER");
    if (user == null) {
        response.sendRedirect("index.jsp");
    }

    // Next Reward
    String nextTierName = "";
    int remainingBookings = 0;
    double remainingSpend = 0;

    String tierName = user.getTierId().getTierName();

    int currentBookings = user.getTotalBooking();
    double currentSpend = user.getTotalSpend();

    switch (tierName) {

        case "Member":

            nextTierName = "Silver";

            remainingBookings = 5 - currentBookings;

            remainingSpend = 2000000 - currentSpend;

            break;

        case "Silver":

            nextTierName = "Gold";

            remainingBookings = 15 - currentBookings;

            remainingSpend = 6000000 - currentSpend;

            break;

        case "Gold":

            nextTierName = "Platinum";

            remainingBookings = 30 - currentBookings;

            remainingSpend = 15000000 - currentSpend;

            break;

        case "Platinum":

            nextTierName = "MAX";

            remainingBookings = 0;
            remainingSpend = 0;

            break;
    }

// Tranh negative number
    if (remainingBookings < 0) {
        remainingBookings = 0;
    }

    if (remainingSpend < 0) {
        remainingSpend = 0;
    }
%>


<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description"
              content="Manage your AutoWash Pro membership account, register family vehicles, schedule washes, and claim exclusive loyalty vouchers.">
        <title>Customer Dashboard - AutoWash Pro</title>
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

    <body>

        <div class="dashboard-container" id="dashboardContainer">

            <!-- ==========================================================================
               1. SIDEBAR NAVIGATION
               ========================================================================== */ -->
            <aside class="sidebar" id="dashboardSidebar">
                <div class="sidebar__header">
                    <a href="index.jsp" class="sidebar__logo" id="sidebarLogo">
                        <i class="fa-solid fa-droplet"></i>
                        AutoWash Pro
                    </a>
                </div>

                <nav class="sidebar__menu" id="sidebarMenu">
                    <a href="#" class="sidebar__link sidebar__link--active" id="menuDashboard">
                        <i class="fa-solid fa-chart-pie"></i> Dashboard
                    </a>
                    <a href="#vehiclesSection" class="sidebar__link" id="menuVehicles">
                        <i class="fa-solid fa-car"></i> My Vehicles
                    </a>
                    <a href="#bookingSection" class="sidebar__link" id="menuBookWash">
                        <i class="fa-solid fa-calendar-plus"></i> Book Wash
                    </a>
                    <a href="#rewardsSection" class="sidebar__link" id="menuRewards">
                        <i class="fa-solid fa-gift"></i> Rewards
                    </a>
                    <a href="#historySection" class="sidebar__link" id="menuHistory">
                        <i class="fa-solid fa-history"></i> History
                    </a>
                    <a href="#membershipPlanSection" class="sidebar__link" id="menuMembership">
                        <i class="fa-solid fa-crown"></i> Membership
                    </a>
                    <a href="#settingsSection" class="sidebar__link" id="menuSettings">
                        <i class="fa-solid fa-sliders"></i> Settings
                    </a>
                </nav>

                <div class="sidebar__footer">
                    <a href="index.jsp" class="sidebar__link" id="menuLogout">
                        <i class="fa-solid fa-right-from-bracket"></i> Logout
                    </a>
                </div>
            </aside>

            <!-- ==========================================================================
               2. MAIN DASHBOARD CONTENT
               ========================================================================== */ -->
            <main class="dashboard-main" id="dashboardMainArea">

                <!-- Top Header Navbar -->
                <header class="dash-header" id="dashboardHeader">
                    <div class="dash-header__left">
                        <button type="button" class="dash-header__toggle" id="sidebarToggleBtn" aria-label="Toggle Sidebar">
                            <i class="fa-solid fa-bars"></i>
                        </button>
                        <h1 class="dash-header__title">Dashboard</h1>
                    </div>

                    <div class="dash-header__right">
                        <!-- Notifications Dropdown Trigger -->
                        <div class="dash-header__notifications" id="notificationsWrapper">
                            <button type="button" class="dash-header__noti-btn" id="notiBellBtn"
                                    aria-label="View Notifications">
                                <i class="fa-solid fa-bell"></i>
                                <span class="dash-header__noti-badge"></span>
                            </button>
                        </div>

                        <!-- Profile Info -->
                        <div class="dash-header__profile" id="userProfileBadge">
                            <div class="dash-header__avatar"><%= user.getInitials()%></div>
                            <div class="dash-header__user-info">
                                <span class="dash-header__name"><%= user.getFullName()%></span>
                                <span class="dash-header__badge"> <%= user.getTierId().getTierName()%> </span>
                            </div>
                        </div>
                    </div>
                </header>

                <!-- Dashboard Inner Content -->
                <div class="dashboard-content">

                    <!-- ROW 1: Membership Overview & Quick Actions -->
                    <div class="dash-grid-2">

                        <!-- Membership card -->
                        <section class="dash-card member-overview-card" id="membershipOverviewCard">
                            <h2
                                style="position: absolute; width: 1px; height: 1px; padding: 0; margin: -1px; overflow: hidden; clip: rect(0, 0, 0, 0); border: 0;">
                                Membership Overview</h2>
                            <div class="member-overview-card__header">
                                <div>
                                    <span class="member-overview-card__tier-lbl">Current Tier</span>
                                    <div class="member-overview-card__tier-val"><%= user.getTierId().getTierName()%> Level</div>
                                </div>
                                <span class="member-overview-card__badge">
                                    <i class="fa-solid fa-award"></i> VIP Status
                                </span>
                            </div>

                            <div>
                                <span class="member-overview-card__points-lbl">Available Points</span>
                                <div class="member-overview-card__points-val"><%= user.getCurrentPoint()%> <span>pts</span></div>
                            </div>

                            <div class="member-overview-card__reward">

                                <span class="member-overview-card__reward-label">
                                    Next Tier Requirement
                                </span>

                                <% if (!nextTierName.equals("MAX")) {%>

                                <div class="member-overview-card__reward-value">

                                    Unlock
                                    <%= nextTierName%>
                                    Tier

                                </div>

                                <div class="member-overview-card__requirement">

                                    <div> Need
                                        <strong>
                                            <%= remainingBookings%>
                                        </strong>
                                        more washes
                                    </div>

                                    <div> OR spend more
                                        <strong>
                                            <%= String.format("%,.0f", remainingSpend)%>
                                        </strong>
                                        VND 
                                    </div>

                                </div>

                                <% } else { %>

                                <div class="member-overview-card__reward-value">

                                    Highest Membership Tier Achieved

                                </div>

                                <% }%>

                            </div>
                        </section>

                        <!-- Quick Actions Card -->
                        <section class="dash-card" id="quickActionsCard">
                            <div class="dash-card__header">
                                <h2 class="dash-card__title"><i class="fa-solid fa-rocket dash-card__title-icon"></i> Quick
                                    Actions</h2>
                            </div>
                            <div class="quick-actions">
                                <button type="button" class="quick-action-btn" id="actionBookWash">
                                    <span class="quick-action-btn__icon"><i class="fa-solid fa-calendar-plus"></i></span>
                                    <span class="quick-action-btn__lbl">Book Wash</span>
                                </button>
                                <button type="button" class="quick-action-btn" id="actionAddVehicle">
                                    <span class="quick-action-btn__icon"><i class="fa-solid fa-plus"></i></span>
                                    <span class="quick-action-btn__lbl">Add Vehicle</span>
                                </button>
                                <button type="button" class="quick-action-btn" id="actionScanCode">
                                    <span class="quick-action-btn__icon"><i class="fa-solid fa-qrcode"></i></span>
                                    <span class="quick-action-btn__lbl">Scan Code</span>
                                </button>
                            </div>
                        </section>

                    </div>

                    <!-- ROW 2: Multi-Vehicle Management Section -->
                    <section class="dash-card" id="vehiclesSection">
                        <div class="dash-card__header">
                            <h2 class="dash-card__title">
                                <i class="fa-solid fa-car-tunnel dash-card__title-icon"></i>
                                Multi-Vehicle Management
                            </h2>
                            <a href="#" class="dash-card__action-link" id="addNewVehicleLink">+ Add New Vehicle</a>
                        </div>
                        <p class="section-header__subtitle dash-card__subtitle">
                            Manage all your vehicles in one account. Tap on a vehicle to modify license plates or review
                            statuses.
                        </p>

                        <div class="dash-vehicles-grid">
                            <!-- Vehicle 1: Clean -->
                            <article class="vehicle-card vehicle-card--clean" id="cardTesla">
                                <div class="vehicle-card__header">
                                    <i class="fa-solid fa-car-side vehicle-card__type-icon"></i>
                                    <span class="vehicle-card__status-dot" title="Clean status"></span>
                                </div>
                                <h3 class="vehicle-card__name">Tesla Model 3</h3>
                                <span class="vehicle-card__plate">51K-123.45</span>
                                <div class="vehicle-card__meta">
                                    <div class="vehicle-card__meta-item">
                                        <span>Type</span>
                                        <span class="vehicle-card__meta-val">Sedan</span>
                                    </div>
                                    <div class="vehicle-card__meta-item">
                                        <span>Last Wash</span>
                                        <span class="vehicle-card__meta-val">May 24, 2026</span>
                                    </div>
                                    <div class="vehicle-card__meta-item">
                                        <span>Status</span>
                                        <span class="vehicle-card__meta-val text-success">Clean</span>
                                    </div>
                                </div>
                            </article>

                            <!-- Vehicle 2: Needs Wash -->
                            <article class="vehicle-card vehicle-card--dirty" id="cardFord">
                                <div class="vehicle-card__header">
                                    <i class="fa-solid fa-truck-pickup vehicle-card__type-icon"></i>
                                    <span class="vehicle-card__status-dot" title="Needs wash status"></span>
                                </div>
                                <h3 class="vehicle-card__name">Ford F-150</h3>
                                <span class="vehicle-card__plate">30H-987.65</span>
                                <div class="vehicle-card__meta">
                                    <div class="vehicle-card__meta-item">
                                        <span>Type</span>
                                        <span class="vehicle-card__meta-val">Truck</span>
                                    </div>
                                    <div class="vehicle-card__meta-item">
                                        <span>Last Wash</span>
                                        <span class="vehicle-card__meta-val">May 12, 2026</span>
                                    </div>
                                    <div class="vehicle-card__meta-item">
                                        <span>Status</span>
                                        <span class="vehicle-card__meta-val text-error">Needs Wash</span>
                                    </div>
                                </div>
                            </article>

                            <!-- Vehicle 3: Wash In Progress -->
                            <article class="vehicle-card vehicle-card--progress" id="cardHonda">
                                <div class="vehicle-card__header">
                                    <i class="fa-solid fa-van-shuttle vehicle-card__type-icon"></i>
                                    <span class="vehicle-card__status-dot" title="Wash in progress"></span>
                                </div>
                                <h3 class="vehicle-card__name">Honda CR-V</h3>
                                <span class="vehicle-card__plate">43A-555.22</span>
                                <div class="vehicle-card__meta">
                                    <div class="vehicle-card__meta-item">
                                        <span>Type</span>
                                        <span class="vehicle-card__meta-val">SUV</span>
                                    </div>
                                    <div class="vehicle-card__meta-item">
                                        <span>Last Wash</span>
                                        <span class="vehicle-card__meta-val">In Progress</span>
                                    </div>
                                    <div class="vehicle-card__meta-item">
                                        <span>Status</span>
                                        <span class="vehicle-card__meta-val text-info">Washing...</span>
                                    </div>
                                </div>
                            </article>
                        </div>
                    </section>

                    <!-- ROW 3: Upcoming Bookings & Active Vouchers -->
                    <div class="dash-grid-2">

                        <!-- Upcoming booking section -->
                        <section class="dash-card" id="bookingSection">
                            <div class="dash-card__header">
                                <h2 class="dash-card__title"><i class="fa-solid fa-clock dash-card__title-icon"></i>
                                    Upcoming Bookings</h2>
                            </div>
                            <div class="booking-list">
                                <article class="booking-item">
                                    <div class="booking-item__left">
                                        <div class="booking-item__calendar">
                                            <span class="booking-item__day">28</span>
                                            <span class="booking-item__month">May</span>
                                        </div>
                                        <div>
                                            <h3 class="booking-item__title">Ford F-150 - Deluxe Wash</h3>
                                            <div class="booking-item__details">
                                                <span><i class="fa-solid fa-clock-four"></i> 09:30 AM</span>
                                                <span><i class="fa-solid fa-bolt"></i> Priority Lane</span>
                                            </div>
                                        </div>
                                    </div>
                                    <span class="booking-item__badge">Confirmed</span>
                                </article>
                            </div>
                        </section>

                        <!-- Promotions / Rewards Section -->
                        <section class="dash-card" id="rewardsSection">
                            <div class="dash-card__header">
                                <h2 class="dash-card__title"><i class="fa-solid fa-tags dash-card__title-icon"></i> My
                                    Promotion Rewards</h2>
                            </div>
                            <div class="promo-list">
                                <article class="promo-card">
                                    <span class="promo-card__badge">Gold Perk</span>
                                    <h3 class="promo-card__title">Rainy Day 10% Off</h3>
                                    <p class="promo-card__desc">Enjoy 10% off any wash tier during rain events. Exclusive to
                                        Gold & Silver tiers.</p>
                                    <div class="promo-card__code">
                                        <span class="promo-card__code-txt">RAINY10GOLD</span>
                                        <button type="button" class="promo-card__copy-btn" id="copyPromo1Btn">Copy</button>
                                    </div>
                                </article>
                            </div>

                            <!-- TODO: Connect RewardServlet -->
                            <!-- TODO: Validate data from SQL Server -->
                            <form action="reward" method="post" id="rewardServletForm">
                                <div class="form-group form-group--no-margin">
                                    <div class="form-group__input-wrapper form-group__input-wrapper--flex">
                                        <label for="promoCode"
                                               style="position: absolute; width: 1px; height: 1px; padding: 0; margin: -1px; overflow: hidden; clip: rect(0, 0, 0, 0); border: 0;">Promo
                                            Coupon Code</label>
                                        <i class="fa-solid fa-ticket form-group__icon"></i>
                                        <input type="text" class="form-group__input" id="promoCode" name="promoCode"
                                               placeholder="e.g. GOLD20" required>
                                        <button type="submit" class="btn btn--primary" id="applyPromoBtn">
                                            Apply
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </section>

                    </div>

                    <!-- ROW 4: Wash History Section -->
                    <section class="dash-card" id="historySection">
                        <div class="dash-card__header">
                            <h2 class="dash-card__title"><i class="fa-solid fa-history dash-card__title-icon"></i> Wash
                                History</h2>
                            <a href="#" class="dash-card__action-link">Download Full Log</a>
                        </div>

                        <!-- TODO: Connect HistoryServlet -->
                        <!-- TODO: Validate data from SQL Server -->
                        <form action="history" method="post" id="searchFilterServletForm" class="history-filter-form">
                            <div class="form-group history-filter-form__group-search">
                                <label for="searchQuery" class="form-group__label">Search Vehicle or Plate</label>
                                <div class="form-group__input-wrapper">
                                    <i class="fa-solid fa-search form-group__icon"></i>
                                    <input type="text" class="form-group__input" id="searchQuery" name="searchQuery"
                                           placeholder="Search...">
                                </div>
                            </div>
                            <div class="form-group history-filter-form__group-status">
                                <label for="statusFilter" class="form-group__label">Filter Status</label>
                                <select id="statusFilter" name="statusFilter" class="form-group__input">
                                    <option value="">All Statuses</option>
                                    <option value="Completed">Completed</option>
                                    <option value="Needs Wash">Needs Wash</option>
                                    <option value="Washing">Washing</option>
                                </select>
                            </div>
                            <button type="submit" class="btn btn--secondary" id="filterHistoryBtn">
                                <i class="fa-solid fa-filter"></i> Filter
                            </button>
                        </form>

                        <div class="history-table-wrapper">
                            <table class="history-table">
                                <thead>
                                    <tr>
                                        <th>Date & Time</th>
                                        <th>Vehicle Model</th>
                                        <th>License Plate</th>
                                        <th>Wash Package</th>
                                        <th>Cost</th>
                                        <th>Status</th>
                                        <th>Receipt</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>May 26, 2026, 14:15</td>
                                        <td>Honda CR-V</td>
                                        <td><span class="history-table__plate">43A-555.22</span></td>
                                        <td>Basic Express</td>
                                        <td>$15.00</td>
                                        <td><span class="history-table__status history-table__status--completed"><i
                                                    class="fa-solid fa-circle-check"></i> Completed</span></td>
                                        <td><a href="#" class="history-table__action"><i
                                                    class="fa-solid fa-file-pdf"></i></a></td>
                                    </tr>
                                    <tr>
                                        <td>May 24, 2026, 08:30</td>
                                        <td>Tesla Model 3</td>
                                        <td><span class="history-table__plate">51K-123.45</span></td>
                                        <td>Platinum Polish</td>
                                        <td>$45.00</td>
                                        <td><span class="history-table__status history-table__status--completed"><i
                                                    class="fa-solid fa-circle-check"></i> Completed</span></td>
                                        <td><a href="#" class="history-table__action"><i
                                                    class="fa-solid fa-file-pdf"></i></a></td>
                                    </tr>
                                    <tr>
                                        <td>May 12, 2026, 17:00</td>
                                        <td>Ford F-150</td>
                                        <td><span class="history-table__plate">30H-987.65</span></td>
                                        <td>Deluxe Wash</td>
                                        <td>$25.00</td>
                                        <td><span class="history-table__status history-table__status--completed"><i
                                                    class="fa-solid fa-circle-check"></i> Completed</span></td>
                                        <td><a href="#" class="history-table__action"><i
                                                    class="fa-solid fa-file-pdf"></i></a></td>
                                    </tr>
                                    <tr>
                                        <td>Apr 29, 2026, 10:10</td>
                                        <td>Tesla Model 3</td>
                                        <td><span class="history-table__plate">51K-123.45</span></td>
                                        <td>Basic Express</td>
                                        <td>$15.00</td>
                                        <td><span class="history-table__status history-table__status--completed"><i
                                                    class="fa-solid fa-circle-check"></i> Completed</span></td>
                                        <td><a href="#" class="history-table__action"><i
                                                    class="fa-solid fa-file-pdf"></i></a></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </section>

                    <!-- Settings Section -->
                    <section class="dash-card" id="settingsSection">
                        <div class="dash-card__header">
                            <h2 class="dash-card__title">
                                <i class="fa-solid fa-sliders dash-card__title-icon"></i>
                                Account Settings
                            </h2>
                        </div>
                        <p class="section-header__subtitle dash-card__subtitle">
                            Update your profile credentials, change password, and check membership status.
                        </p>

                        <!-- TODO: Connect SettingsServlet -->
                        <!-- TODO: Validate data from SQL Server -->
                        <form action="settings" method="post" id="settingsServletForm">
                            <div class="settings-grid">
                                <div>
                                    <div class="form-group">
                                        <label for="settingsFullName" class="form-group__label">Full Name</label>
                                        <div class="form-group__input-wrapper">
                                            <i class="fa-solid fa-user form-group__icon"></i>
                                            <input type="text" class="form-group__input" id="settingsFullName"
                                                   name="fullName" value="Alex Johnson" autocomplete="name" required>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="settingsEmail" class="form-group__label">Email Address</label>
                                        <div class="form-group__input-wrapper">
                                            <i class="fa-solid fa-envelope form-group__icon"></i>
                                            <input type="email" class="form-group__input" id="settingsEmail" name="email"
                                                   value="alex.johnson@example.com" autocomplete="email" required>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="settingsPhone" class="form-group__label">Phone Number</label>
                                        <div class="form-group__input-wrapper">
                                            <i class="fa-solid fa-phone form-group__icon"></i>
                                            <input type="tel" class="form-group__input" id="settingsPhone" name="phone"
                                                   value="+1 (555) 019-2834" autocomplete="tel" required>
                                        </div>
                                    </div>
                                </div>

                                <div>
                                    <div class="form-group">
                                        <label for="settingsCurrentPassword" class="form-group__label">Current
                                            Password</label>
                                        <div class="form-group__input-wrapper">
                                            <i class="fa-solid fa-lock-open form-group__icon"></i>
                                            <input type="password" class="form-group__input" id="settingsCurrentPassword"
                                                   name="currentPassword" placeholder="Enter current password to verify"
                                                   autocomplete="current-password">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="settingsNewPassword" class="form-group__label">New Password</label>
                                        <div class="form-group__input-wrapper">
                                            <i class="fa-solid fa-lock form-group__icon"></i>
                                            <input type="password" class="form-group__input" id="settingsNewPassword"
                                                   name="newPassword" placeholder="Min 6 characters (optional)"
                                                   autocomplete="new-password">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="settingsMembershipTier" class="form-group__label">Membership Tier</label>
                                        <div class="form-group__input-wrapper">
                                            <i class="fa-solid fa-crown form-group__icon"></i>
                                            <input type="text"class="form-group__input" id="settingsMembershipTier" 
                                                   value="<%= user.getTierId().getTierName()%> "readonly />
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="form-actions-row--end">
                                <button type="submit" class="btn btn--primary" id="saveSettingsBtn">
                                    Save Changes
                                </button>
                            </div>
                        </form>
                    </section>

                </div>
            </main>

        </div>

        <!-- ==========================================================================
           DASHBOARD MODAL: ADD VEHICLE
           ========================================================================== -->
        <div class="modal-overlay" id="addVehicleModalOverlay">
            <div class="modal-card" id="addVehicleModalCard" role="dialog" aria-modal="true"
                 aria-labelledby="addVehicleTitle">
                <div class="modal-card__header">
                    <h2 class="modal-card__title" id="addVehicleTitle">Register New Vehicle</h2>
                    <button type="button" class="modal-card__close" aria-label="Close Modal" id="closeAddVehicleBtn">
                        <i class="fa-solid fa-xmark"></i>
                    </button>
                </div>

                <div class="modal-card__body">
                    <p class="modal-card__lead">Add a vehicle to your account to enable License Plate Recognition (LPR)
                        scans at the entry gate.</p>

                    <!-- TODO: Connect VehicleServlet -->
                    <!-- TODO: Validate data from SQL Server -->
                    <form action="vehicle" method="post" id="addVehicleServletForm">

                        <div class="form-group">
                            <label for="vehicleModel" class="form-group__label">Vehicle Model Name</label>
                            <div class="form-group__input-wrapper">
                                <i class="fa-solid fa-car-side form-group__icon"></i>
                                <input type="text" class="form-group__input" id="vehicleModel" name="vehicleModel"
                                       placeholder="e.g. Toyota Camry" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="licensePlate" class="form-group__label">License Plate Number</label>
                            <div class="form-group__input-wrapper">
                                <i class="fa-solid fa-fingerprint form-group__icon"></i>
                                <input type="text" class="form-group__input" id="licensePlate" name="licensePlate"
                                       placeholder="e.g. 51K-999.99" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="vehicleType" class="form-group__label">Vehicle Classification</label>
                            <div class="form-group__input-wrapper">
                                <i class="fa-solid fa-truck-pickup form-group__icon"></i>
                                <select id="vehicleType" name="vehicleType" class="form-group__input" required>
                                    <option value="" disabled selected>Select vehicle type</option>
                                    <option value="Sedan">Sedan</option>
                                    <option value="SUV">SUV</option>
                                    <option value="Truck">Truck</option>
                                    <option value="Van">Van / Minivan</option>
                                </select>
                            </div>
                        </div>

                        <button type="submit" class="btn btn--primary" id="submitAddVehicleBtn">
                            Register Vehicle
                        </button>
                    </form>
                </div>
            </div>
        </div>

        <!-- ==========================================================================
           DASHBOARD MODAL: BOOK CAR WASH
           ========================================================================== -->
        <div class="modal-overlay" id="bookingModalOverlay">
            <div class="modal-card" id="bookingModalCard" role="dialog" aria-modal="true" aria-labelledby="bookingTitle">
                <div class="modal-card__header">
                    <h2 class="modal-card__title" id="bookingTitle">Book Car Wash</h2>
                    <button type="button" class="modal-card__close" aria-label="Close Modal" id="closeBookingBtn">
                        <i class="fa-solid fa-xmark"></i>
                    </button>
                </div>

                <div class="modal-card__body">
                    <p class="modal-card__lead">Schedule a wash slot for any of your registered vehicles with priority lanes
                        active.</p>

                    <!-- TODO: Connect BookingServlet -->
                    <!-- TODO: Validate data from SQL Server -->
                    <form action="booking" method="post" id="bookingServletForm">

                        <div class="form-group">
                            <label for="bookingVehicle" class="form-group__label">Select Vehicle</label>
                            <div class="form-group__input-wrapper">
                                <i class="fa-solid fa-car form-group__icon"></i>
                                <select id="bookingVehicle" name="bookingVehicle" class="form-group__input" required>
                                    <option value="" disabled selected>Choose a vehicle</option>
                                    <option value="51K-123.45">Tesla Model 3 (51K-123.45)</option>
                                    <option value="30H-987.65">Ford F-150 (30H-987.65)</option>
                                    <option value="43A-555.22">Honda CR-V (43A-555.22)</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="washPackage" class="form-group__label">Wash Package Tier</label>
                            <div class="form-group__input-wrapper">
                                <i class="fa-solid fa-box form-group__icon"></i>
                                <select id="washPackage" name="washPackage" class="form-group__input" required>
                                    <option value="" disabled selected>Choose a package</option>
                                    <option value="Basic Express">Basic Express ($15.00)</option>
                                    <option value="Deluxe Wash">Deluxe Wash ($25.00)</option>
                                    <option value="Platinum Polish">Platinum Polish ($45.00)</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="bookingDate" class="form-group__label">Wash Date</label>
                            <div class="form-group__input-wrapper">
                                <i class="fa-solid fa-calendar form-group__icon"></i>
                                <input type="date" class="form-group__input" id="bookingDate" name="bookingDate" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="bookingTimeSlot" class="form-group__label">Time Slot</label>
                            <div class="form-group__input-wrapper">
                                <i class="fa-solid fa-clock form-group__icon"></i>
                                <select id="bookingTimeSlot" name="timeSlot" class="form-group__input" required>
                                    <option value="" disabled selected>Select slot</option>
                                    <option value="08:00 AM - 09:30 AM">08:00 AM - 09:30 AM</option>
                                    <option value="09:30 AM - 11:00 AM">09:30 AM - 11:00 AM</option>
                                    <option value="11:00 AM - 12:30 PM">11:00 AM - 12:30 PM</option>
                                    <option value="01:30 PM - 03:00 PM">01:30 PM - 03:00 PM</option>
                                    <option value="03:00 PM - 04:30 PM">03:00 PM - 04:30 PM</option>
                                    <option value="04:30 PM - 06:00 PM">04:30 PM - 06:00 PM</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="bookingLane" class="form-group__label">Gate Lane Preference</label>
                            <div class="form-group__input-wrapper">
                                <i class="fa-solid fa-bolt form-group__icon"></i>
                                <select id="bookingLane" name="lanePreference" class="form-group__input" required>
                                    <option value="Standard">Standard Lane</option>
                                    <option value="Priority">Priority Lane (Gold/Platinum only)</option>
                                </select>
                            </div>
                        </div>

                        <button type="submit" class="btn btn--primary" id="submitBookingBtn">
                            Confirm Wash Booking
                        </button>
                    </form>
                </div>
            </div>
        </div>

    </body>

</html>