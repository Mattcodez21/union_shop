# Union Shop Flutter Application - Implementation Tasks

## 1. Purpose

This document outlines all implementation tasks for the Union Shop Flutter coursework. Each task represents one small commit to demonstrate incremental development and proper version control practices.

## Progress Summary
**Overall Progress**:
- Basic Features: 3/9 (10% of 40%)
- Intermediate Features: 0/7 (0% of 35%)
- Advanced Features: 0/3 (0% of 25%)

---

## 2. Basic Features (40% of Application Marks)

### 2.1. Static Homepage (5%)
**Implementation Tasks**
- [x]Update header banner text with welcoming message
- [x]Update hero section title and description
- [x]Update product card names and prices to realistic values
- [x]Test mobile responsiveness and scrolling

**Tests**
- [x] Homepage renders without errors
- [x] Hero section displays with background image and overlay text
- [x] Product grid displays 4 hardcoded products
- [x] Layout is readable on mobile view (< 600px width)
- [x] Page scrolls smoothly

### 2.2. About Us Page (5%)
**Implementation Tasks**
- [x]Create pages/about_page.dart with basic structure
- [x]Add app bar with "About" title and back button
- [x]Add "About Us" heading centred at the top
- [x]Add About Us text
- [x]Add '/about' route to main.dart
- [x]Add navigation link from homepage
- [x]Test everything displays correctly

**Tests**
**Tests to Verify:**
- [x] About Us page accessible via `/about` route
- [x] Page displays company information text & contact email
- [x] Content is formatted with proper spacing
- [x] Navigation from homepage footer works
- [x] Back button returns to homepage
### 2.3. Footer (4%)
**Implementation Tasks**
- [x] Create lib/widgets/footer.dart with Footer widget class
- [x] Add three-column layout (Opening Hours, Help and Information, Latest Offers)
- [x] Add "Opening Hours" section with winter break closure notice and term times
- [x] Add "Help and Information" section with Search and Terms & Conditions links
- [x] Add "Latest Offers" section with email subscription input and button
- [x] Add social media icons row (Facebook, Twitter)
- [x] Add copyright text and "Powered by Shopify" at bottom
- [x] Replace homepage footer placeholder with Footer widget
- [x] Test footer displays correctly and is responsive

**Tests**
- [x] Footer displays on at least one page
- [x] Footer includes three columns on desktop
- [x] Footer stacks vertically on mobile (< 600px)
- [x] Opening hours section shows all information
- [x] Help links are visible (non-functional acceptable)
- [x] Email subscription form exists
- [x] Social media icons (Facebook, Twitter) display
- [x] Copyright text includes "© 2025" and Shopify credit
- [x] Footer is responsive and readable at all widths

### 2.4. Dummy Collections Page (5%)
**Implementaion Tasks**
- [x] Create pages/collections_page.dart with basic structure
- [x] Create hardcoded list of collection data (names and image URLs)
- [x] Implement GridView for collections with 2 columns on mobile
- [x] Create collection card widget with image, title, and item count
- [x] Add GestureDetector for navigation to individual collection page
- [x] Add '/collections' route in main.dart
- [x] Add navigation link from homepage/navbar to collections
- [ ] Test collections page displays and navigation works

**Tests**
- [x] Collections page accessible via `/collections` route
- [x] Page displays at least 4-6 collections
- [ ] Each collection shows title and image
- [ ] Each collection shows product count (e.g., "12 items")
- [ ] Collections are clickable
- [ ] Grid layout shows 2 columns on mobile (< 600px)
- [ ] Grid layout shows 3-4 columns on desktop (> 600px)
- [ ] Navigation from navbar/homepage works

### 2.5. Dummy Collection Page (5%)
**Implementation Tasks**
- [ ] Create pages/collection_page.dart accepting collectionName parameter
- [ ] Add app bar with dynamic collection name as title
- [ ] Add collection description text below title
- [ ] Add filter and sort dropdowns row (FILTER BY and SORT BY)
- [ ] Add product count text (e.g., "10 products")
- [ ] Create hardcoded list of products with images, names, and prices
- [ ] Implement GridView for products (3 columns on desktop, 2 on mobile)
- [ ] Create product card widget showing image, name, and price
- [ ] Add GestureDetector to navigate to product page when card tapped
- [ ] Add route with parameter in main.dart
- [ ] Update collections page to pass collection name on navigation
- [ ] Test collection page displays correctly with filters visible

**Tests**
- [ ] Collection page accessible with parameter (e.g., `/collection/hoodies`)
- [ ] Page displays collection name dynamically in app bar
- [ ] Collection description text appears
- [ ] Filter dropdown visible (FILTER BY: All products)
- [ ] Sort dropdown visible (SORT BY: Featured)
- [ ] Product count displays (e.g., "10 products")
- [ ] At least 6-10 products display in grid
- [ ] Products show image, name, and price
- [ ] Product cards are clickable
- [ ] Grid is responsive (2 cols mobile, 3 cols desktop)
- [ ] Dropdowns are visible but non-functional (acceptable)

### 2.6. Dummy Product Page (4%)
**Implementation Tasks**
- [ ] Open existing pages/product_page.dart and enhance structure
- [ ] Add large product image on left side (with image carousel thumbnails below)
- [ ] Add product title, price, and "Tax included" text on right side
- [ ] Add Color dropdown with options (Black, Purple, Green, Grey)
- [ ] Add Size dropdown with options (S, M, L, XL)
- [ ] Add Quantity number input field
- [ ] Add "ADD TO CART" button (non-functional for now)
- [ ] Add "Buy with Shop Pay" button placeholder
- [ ] Add product description text ("Bringing to you, our best selling...")
- [ ] Add product details text ("Soft, comfortable, 50% cotton...")
- [ ] Add social share buttons (SHARE, TWEET, PIN IT - non-functional)
- [ ] Add size guide table below images
- [ ] Add "BACK TO [COLLECTION]" button at bottom
- [ ] Style page with proper layout and spacing
- [ ] Test product page displays correctly on mobile and desktop

**Tests**
- [ ] Product page accessible via route
- [ ] Main product image displays
- [ ] Image carousel/thumbnails visible below main image
- [ ] Product name displays prominently
- [ ] Price displays with "Tax included" text
- [ ] Color dropdown shows options
- [ ] Size dropdown shows options (S, M, L, XL)
- [ ] Quantity field displays (default 1)
- [ ] "ADD TO CART" button visible
- [ ] "Buy with Shop Pay" button visible
- [ ] Product description paragraph visible
- [ ] Material/care details visible
- [ ] Social share buttons display
- [ ] Size guide table visible
- [ ] Back button navigates to previous page
- [ ] Layout works on mobile (stacked) and desktop (two-column)

### 2.7. Sale Collection (4%)
**Implementation Tasks**
- [ ] Create pages/sale_page.dart with basic structure
- [ ] Add app bar with "SALE" title
- [ ] Add promotional message "Don't miss out! Get yours before they're all gone!"
- [ ] Add discount notice text "All prices shown are inclusive of the discount"
- [ ] Add filter and sort dropdowns row (FILTER BY and SORT BY)
- [ ] Add product count text (e.g., "14 products")
- [ ] Create hardcoded list of sale products with original and sale prices
- [ ] Implement GridView for sale products (3 columns on desktop, 2 on mobile)
- [ ] Create sale product card showing image, name, strikethrough original price, and sale price
- [ ] Add "SALE" badge overlay on product with sale (optional, some don't have it)
- [ ] Add '/sale' route in main.dart
- [ ] Add navigation link from navbar to sale page
- [ ] Test sale page displays with correct pricing format

**Tests**
- [ ] Sale page accessible via `/sale` route
- [ ] "SALE" heading displays prominently
- [ ] Promotional message appears below title
- [ ] Discount notice visible
- [ ] Filter and sort dropdowns present (non-functional acceptable)
- [ ] Product count displays
- [ ] At least 6 sale products display
- [ ] Products show images and names
- [ ] Original price shows with strikethrough (e.g., ~~£17.00~~)
- [ ] Sale price shows prominently in different color (e.g., £10.99)
- [ ] Some products show "SALE" badge overlay
- [ ] Grid is responsive (2 cols mobile, 3 cols desktop)
- [ ] Navigation from navbar works

### 2.8. Authentication UI (3%)
**Implementation Tasks**
- [ ] Create pages/auth_page.dart with basic structure
- [ ] Add Union logo at top center
- [ ] Add "Sign in" heading and subtitle "Choose how you'd like to sign in"
- [ ] Add "Sign in with shop" button (purple, non-functional)
- [ ] Add "or" divider text
- [ ] Add email TextFormField with border styling
- [ ] Add "Continue" button (grey, non-functional)
- [ ] Style page with centered card layout and white background
- [ ] Add '/auth' route in main.dart
- [ ] Add navigation from account icon in navbar
- [ ] Test auth page displays correctly centered on screen

**Tests**
- [ ] Auth page accessible via `/auth` route
- [ ] Union logo displays at top
- [ ] "Sign in" heading displays
- [ ] Subtitle text visible
- [ ] "Sign in with shop" button displays (purple)
- [ ] "or" divider text visible
- [ ] Email input field displays with proper styling
- [ ] Email field has placeholder text
- [ ] "Continue" button displays (grey)
- [ ] Page is centered on screen with white card
- [ ] Layout works on mobile and desktop
- [ ] Navigation from navbar account icon works
- [ ] Buttons are non-functional (acceptable for basic feature)

### 2.9. Static Navbar (5%)
**Implementation Tasks**
- [ ] Create widgets/navbar.dart file
- [ ] Add Union logo on the left side (clickable, links to home)
- [ ] Add desktop navigation links (Home, Shop, The Print Shack, SALE!, About, UPSU.net)
- [ ] Add dropdown arrow indicators for Shop and The Print Shack links
- [ ] Add right-side icons (Search, Account, Cart with badge)
- [ ] Add LayoutBuilder to detect screen width (>600px = desktop)
- [ ] Create mobile version with hamburger menu icon
- [ ] Create Drawer widget for mobile navigation menu
- [ ] Add all navigation items to drawer
- [ ] Replace existing AppBar on all pages with custom navbar
- [ ] Test navbar displays correctly on desktop and mobile views
- [ ] Test navbar collapses to hamburger menu on mobile

**Tests**
- [ ] Navbar displays on all pages
- [ ] Union logo visible on left and clickable
- [ ] Logo navigation returns to homepage
- [ ] Desktop shows all links horizontally (Home, Shop, Print Shack, SALE!, About, UPSU.net)
- [ ] Shop link shows dropdown arrow indicator (∨)
- [ ] The Print Shack link shows dropdown arrow
- [ ] Search icon displays on right
- [ ] Account icon displays on right
- [ ] Cart icon displays with badge number
- [ ] At width > 600px, full navbar displays
- [ ] At width < 600px, navbar shows hamburger menu icon
- [ ] Hamburger menu opens drawer on tap
- [ ] Drawer contains all navigation links
- [ ] Drawer closes after selecting item
- [ ] Navbar consistent across all pages


---