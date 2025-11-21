# Union Shop Flutter Application - Implementation Tasks

## 1. Purpose

This document outlines all implementation tasks for the Union Shop Flutter coursework. Each task represents one small commit to demonstrate incremental development and proper version control practices.

---

## 2. Basic Features (40% of Application Marks)

### 2.1. Static Homepage (5%)

- [x]Update header banner text with welcoming message
- [x]Update hero section title and description
- [x]Update product card names and prices to realistic values
- [x]Test mobile responsiveness and scrolling

### 2.2. About Us Page (5%)

- [ ]Create pages/about_page.dart with basic structure
- [ ]Add app bar with "About" title and back button
- [ ]Add "About Us" heading centred at the top
- [ ]Add About Us text
- [ ]Add '/about' route to main.dart
- [ ]Add navigation link from homepage
- [ ]Test everything displays correctly

### 2.3. Footer (4%)

- [ ] Create lib/widgets/footer.dart with Footer widget class
- [ ] Add three-column layout (Opening Hours, Help and Information, Latest Offers)
- [ ] Add "Opening Hours" section with winter break closure notice and term times
- [ ] Add "Help and Information" section with Search and Terms & Conditions links
- [ ] Add "Latest Offers" section with email subscription input and button
- [ ] Add social media icons row (Facebook, Twitter)
- [ ] Add copyright text and "Powered by Shopify" at bottom
- [ ] Replace homepage footer placeholder with Footer widget
- [ ] Test footer displays correctly and is responsive

### 2.4. Dummy Collections Page (5%)

- [ ] Create pages/collections_page.dart with basic structure
- [ ] Add app bar with "Collections" title
- [ ] Create hardcoded list of collection data (names and image URLs)
- [ ] Implement GridView for collections with 2 columns on mobile
- [ ] Create collection card widget with image, title, and item count
- [ ] Add GestureDetector for navigation to individual collection page
- [ ] Add '/collections' route in main.dart
- [ ] Add navigation link from homepage/navbar to collections
- [ ] Test collections page displays and navigation works

### 2.5. Dummy Collection Page (5%)

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

### 2.6. Dummy Product Page (4%)

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

### 2.7. Sale Collection (4%)

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

### 2.8. Authentication UI (3%)

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

### 2.9. Static Navbar (5%)

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

---