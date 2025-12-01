# Union Shop Flutter Application - Implementation Tasks

## 1. Purpose

This document outlines all implementation tasks for the Union Shop Flutter coursework. Each task represents one small commit to demonstrate incremental development and proper version control practices.

## Progress Summary
**Overall Progress**:
- Basic Features: 9/9 (40% of 40%)
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
- [x] Test collections page displays and navigation works

**Tests**
- [x] Collections page accessible via `/collections` route
- [x] Page displays at least 4-6 collections
- [x] Each collection shows title and image
- [x] Each collection shows product count (e.g., "12 items")
- [x] Collections are clickable
- [x] Grid layout shows 2 columns on mobile (< 600px)
- [x] Grid layout shows 3-4 columns on desktop (> 600px)
- [x] Navigation from navbar/homepage works

### 2.5. Dummy Collection Page (5%)
**Implementation Tasks**
- [x] Create pages/collection_page.dart accepting collectionName parameter
- [x] Add app bar with dynamic collection name as title
- [x] Add collection description text below title
- [x] Add filter and sort dropdowns row (FILTER BY and SORT BY)
- [x] Add product count text (e.g., "10 products")
- [x] Create hardcoded list of products with images, names, and prices
- [x] Implement GridView for products (3 columns on desktop, 2 on mobile)
- [x] Create product card widget showing image, name, and price
- [x] Add GestureDetector to navigate to product page when card tapped
- [x] Add route with parameter in main.dart
- [x] Update collections page to pass collection name on navigation
- [x] Test collection page displays correctly with filters visible

**Tests**
- [x] Collection page accessible with parameter (e.g., `/collection/hoodies`)
- [x] Page displays collection name dynamically in app bar
- [x] Collection description text appears
- [x] Filter dropdown visible (FILTER BY: All products)
- [x] Sort dropdown visible (SORT BY: Featured)
- [ ] Product count displays (e.g., "10 products")
- [ ] At least 6-10 products display in grid
- [x] Products show image, name, and price
- [x] Product cards are clickable
- [x] Grid is responsive (2 cols mobile, 3 cols desktop)

### 2.6. Dummy Product Page (4%)
**Implementation Tasks**
- [x] Open existing pages/product_page.dart and enhance structure
- [x] Add large product image on left side (with image carousel thumbnails below)
- [x] Add product title, price, and "Tax included" text on right side
- [x] Add Color dropdown with options (Black, Purple, Green, Grey)
- [x] Add Size dropdown with options (S, M, L, XL)
- [x] Add Quantity number input field
- [x] Add "ADD TO CART" button (non-functional for now)
- [x] Add "Buy with Shop Pay" button placeholder
- [x] Add product description text ("Bringing to you, our best selling...")
- [x] Add product details text ("Soft, comfortable, 50% cotton...")
- [x] Add social share buttons (SHARE, TWEET, PIN IT - non-functional)
- [x] Add "BACK TO [COLLECTION]" button at bottom
- [x] Style page with proper layout and spacing
- [x] Test product page displays correctly on mobile and desktop

**Tests**
- [x] Product page accessible via route
- [x] Main product image displays
- [x] Image carousel/thumbnails visible below main image
- [x] Product name displays prominently
- [x] Price displays with "Tax included" text
- [x] Color dropdown shows options
- [x] Size dropdown shows options (S, M, L, XL)
- [x] Quantity field displays (default 1)
- [x] "ADD TO CART" button visible
- [x] "Buy with Shop Pay" button visible
- [x] Product description paragraph visible
- [ ] Material/care details visible
- [ ] Social share buttons display
- [x] Back button navigates to previous page
- [ ] Layout works on mobile (stacked) and desktop (two-column)

### 2.7. Sale Collection (4%)
**Implementation Tasks**
- [x] Create pages/sale_page.dart with basic structure
- [x] Add promotional message "Don't miss out! Get yours before they're all gone!"
- [x] Add discount notice text "All prices shown are inclusive of the discount"
- [x] Add filter and sort dropdowns row (FILTER BY and SORT BY)
- [x] Add product count text (e.g., "14 products")
- [x] Create hardcoded list of sale products with original and sale prices
- [x] Implement GridView for sale products (3 columns on desktop, 2 on mobile)
- [x] Create sale product card showing image, name, strikethrough original price, and sale price
- [x] Add "SALE" badge overlay on product with sale (optional, some don't have it)
- [x] Add '/sale' route in main.dart
- [ ] Add navigation link from navbar to sale page
- [x] Test sale page displays with correct pricing format

**Tests**
- [x] Sale page accessible via `/sale` route
- [x] "SALE" heading displays prominently
- [x] Promotional message appears below title
- [x] Discount notice visible
- [x] Filter and sort dropdowns present (non-functional acceptable)
- [x] Product count displays
- [x] Products show images and names
- [x] Original price shows with strikethrough (e.g., ~~£17.00~~)
- [x] Some products show "SALE" badge overlay
- [ ] Grid is responsive (2 cols mobile, 3 cols desktop)
- [x] Navigation from navbar works

### 2.8. Authentication UI (3%)
**Implementation Tasks**
- [x] Create pages/auth_page.dart with basic structure
- [x] Add Union logo at top center
- [x] Add "Sign in" heading and subtitle "Choose how you'd like to sign in"
- [x] Add "Sign in with shop" button (purple, non-functional)
- [x] Add "or" divider text
- [x] Add email TextFormField with border styling
- [x] Add "Continue" button (grey, non-functional)
- [x] Style page with centered card layout and white background
- [x] Add '/auth' route in main.dart
- [x] Add navigation from account icon in navbar
- [ ] Test auth page displays correctly centered on screen

**Tests**
- [x] Auth page accessible via `/auth` route
- [x] Union logo displays at top
- [x] "Sign in" heading displays
- [x] Subtitle text visible
- [x] "Sign in with shop" button displays 
- [ ] Email input field displays with proper styling
- [x] "Continue" button displays (grey)
- [x] Layout works on mobile and desktop
- [x] Navigation from navbar account icon works
- [x] Buttons are non-functional (acceptable for basic feature)

### 2.9. Static Navbar (5%)
**Implementation Tasks**
- [x] Create widgets/navbar.dart file
- [x] Add Union logo on the left side (clickable, links to home)
- [x] Add desktop navigation links (Home, Shop, The Print Shack, SALE!, About, UPSU.net)
- [x] Add dropdown arrow indicators for Shop and The Print Shack links
- [x] Add right-side icons (Search, Account, Cart with badge)
- [x] Add LayoutBuilder to detect screen width (>600px = desktop)
- [x] Create mobile version with hamburger menu icon
- [x] Create Drawer widget for mobile navigation menu
- [x] Add all navigation items to drawer
- [x] Replace existing AppBar on all pages with custom navbar
- [ ] Test navbar displays correctly on desktop and mobile views
- [ ] Test navbar collapses to hamburger menu on mobile

**Tests**
- [x] Navbar displays on all pages
- [ ] Union logo visible on left and clickable
- [ ] Logo navigation returns to homepage
- [ ] Desktop shows all links horizontally (Home, Shop, Print Shack, SALE!, About, UPSU.net)
- [ ] Shop link shows dropdown arrow indicator (∨)
- [ ] The Print Shack link shows dropdown arrow
- [x] Search icon displays on right
- [x] Account icon displays on right
- [ ] Cart icon displays with badge number
- [ ] At width > 600px, full navbar displays
- [ ] At width < 600px, navbar shows hamburger menu icon
- [ ] Hamburger menu opens drawer on tap
- [ ] Drawer contains all navigation links
- [ ] Drawer closes after selecting item
- [ ] Navbar consistent across all pages


---

## 3. Intermediate Features (35% of Application Marks)

### 3.1. Dynamic Collections Page (6%)

**Implementation Tasks:**
- [x] Create lib/models/ folder
- [x] Create models/collection.dart with Collection class (id, name, description, imageUrl, productCount)
- [x] Create lib/data/ folder
- [x] Create data/collections_data.dart with list of 6-8 collections (use AI to generate)
- [x] Update CollectionsPage to use Collection model
- [x] Replace hardcoded collections with data from collections_data.dart
- [x] Update collection cards to display data from model
- [x] Ensure each collection shows: image, name, product count
- [x] Test collections display correctly from data source
- [ ] Verify navigation to collection detail page works with collection parameter

**Tests:**
- [ ] Collections loaded from data model (not hardcoded)
- [ ] All collection data displays correctly
- [ ] Collection images load properly
- [ ] Product counts display for each collection
- [ ] Navigation to collection pages works
- [ ] Grid layout remains responsive

---

### 3.2. Dynamic Collection Page (6%)

**Implementation Tasks:**
- [x] Create models/product.dart with Product class
- [x] Add properties: id, name, description, price, category, sizes[], colors[], imageUrls[]
- [x] Create data/products_data.dart with 15-20 products (use AI to generate)
- [x] Ensure products have varied categories, sizes, colors for filtering
- [x] Convert CollectionPage to StatefulWidget
- [x] Add state variables: selectedSort, selectedSize, selectedColor
- [x] Create method to get products by collection from data
- [x] Implement sort dropdown with all sort options (Featured, Price Low-High, Price High-Low, A-Z)
- [x] Create sorting logic method handling price and name sorts
- [x] Implement size filter dropdown
- [x] Implement color filter dropdown
- [ ] Create filtering logic method combining all active filters
- [ ] Update product count text dynamically
- [ ] Connect GridView to display filtered and sorted products
- [ ] Add "Clear Filters" button (optional)
- [ ] Test all sort options
- [ ] Test each filter individually
- [ ] Test multiple filters combined

**Tests:**
- [ ] Products loaded from data model using collection parameter
- [ ] Sort dropdown changes product order correctly
- [ ] Price sort (low-high, high-low) works
- [ ] Name sort (A-Z) works
- [ ] Size filter shows only matching products
- [ ] Color filter works correctly
- [ ] Multiple filters combine correctly (AND logic)
- [ ] Product count updates with filters
- [ ] Clear filters button resets view (if implemented)
- [ ] No errors with empty filter results

---

### 3.3. Functional Product Pages (6%)

**Implementation Tasks:**
- [ ] Update ProductPage to accept product ID parameter
- [ ] Create method to fetch product by ID from products_data.dart
- [ ] Handle product not found error (redirect or error message)
- [ ] Convert ProductPage to StatefulWidget
- [ ] Add state variables: selectedSize, selectedColor, quantity
- [ ] Initialize state with default values (first size/color, quantity: 1)
- [ ] Create size dropdown using DropdownButton
- [ ] Populate size dropdown from product.sizes
- [ ] Add onChanged handler for size dropdown
- [ ] Create color dropdown using DropdownButton
- [ ] Populate color dropdown from product.colors
- [ ] Add onChanged handler for color dropdown
- [ ] Create quantity counter UI (Row with -, number, +)
- [ ] Implement increment quantity method
- [ ] Implement decrement quantity method (min 1)
- [ ] Connect + button to increment method
- [ ] Connect - button to decrement method
- [ ] Disable - button when quantity is 1
- [ ] Update "Add to Cart" button with temporary snackbar
- [ ] Test navigation with different product IDs
- [ ] Test dropdown updates
- [ ] Test quantity controls

**Tests:**
- [ ] Product loads from data using ID parameter
- [ ] Size dropdown displays available sizes
- [ ] Size dropdown updates on selection
- [ ] Color dropdown displays available colors
- [ ] Color dropdown updates on selection
- [ ] Quantity displays default value of 1
- [ ] Plus button increments quantity
- [ ] Minus button decrements quantity
- [ ] Quantity cannot go below 1
- [ ] UI updates immediately for all interactions
- [ ] Add to Cart button shows feedback

---

### 3.4. Shopping Cart (6%)

**Implementation Tasks:**
- [ ] Create models/cart_item.dart
- [ ] Add properties: product, selectedSize, selectedColor, quantity
- [ ] Create services/cart_service.dart
- [ ] Implement cart state (List<CartItem>)
- [ ] Create addToCart method
- [ ] Create getCartItems method
- [ ] Create getTotalPrice method
- [ ] Create clearCart method
- [ ] Update ProductPage "Add to Cart" button functionality
- [ ] Create CartItem from current product state
- [ ] Call cartService.addToCart
- [ ] Show snackbar confirmation
- [ ] Update cart icon badge with item count
- [ ] Create pages/cart_page.dart
- [ ] Add cart route to main.dart
- [ ] Connect cart icon navigation
- [ ] Display list of cart items
- [ ] Create cart item card widget
- [ ] Calculate and display subtotals
- [ ] Calculate and display total price
- [ ] Add "Place Order" button
- [ ] Implement checkout (show confirmation, clear cart)
- [ ] Handle empty cart state
- [ ] Test adding products to cart
- [ ] Test cart icon badge updates
- [ ] Test total calculations
- [ ] Test checkout process

**Tests:**
- [ ] Add to Cart button adds item successfully
- [ ] Cart icon shows correct item count
- [ ] Cart page displays all items
- [ ] Item details show correctly (size, color, quantity)
- [ ] Subtotals calculate correctly
- [ ] Total price calculates correctly
- [ ] Checkout button places order
- [ ] Cart clears after checkout
- [ ] Confirmation displays after checkout
- [ ] Empty cart shows appropriate message

---

### 3.5. Print Shack (3%)

**Implementation Tasks:**
- [ ] Create pages/print_shack_page.dart
- [ ] Create StatefulWidget
- [ ] Add state variables: customText, selectedFont, selectedColor
- [ ] Add text input field
- [ ] Add onChanged handler for text input
- [ ] Add character counter (e.g., max 20 characters)
- [ ] Create font dropdown with 3+ options (e.g., Arial, Roboto, Courier)
- [ ] Add onChanged handler for font
- [ ] Create color dropdown with 3+ options (e.g., Black, Red, Blue, Purple)
- [ ] Add onChanged handler for color
- [ ] Create preview widget (Container with styled Text)
- [ ] Bind preview to customText state
- [ ] Apply selectedFont to preview text style
- [ ] Apply selectedColor to preview text color
- [ ] Add default placeholder text for empty state
- [ ] Create pages/print_shack_about_page.dart
- [ ] Add service information and guidelines
- [ ] Add navigation between Print Shack pages
- [ ] Add routes to main.dart
- [ ] Add Print Shack link to navbar
- [ ] Test preview updates as text typed
- [ ] Test preview updates with font changes
- [ ] Test preview updates with color changes

**Tests:**
- [ ] Print Shack page accessible via route
- [ ] Text input accepts characters
- [ ] Preview updates in real-time as user types
- [ ] Font dropdown changes preview font
- [ ] Color dropdown changes preview color
- [ ] Character limit enforced
- [ ] About page accessible
- [ ] Navigation between Print Shack pages works

---

### 3.6. Navigation (3%)

**Implementation Tasks:**
- [ ] Audit all navbar links on all pages
- [ ] Test Home link from every page
- [ ] Test Collections link from every page
- [ ] Test Sale link from every page
- [ ] Test About link from every page
- [ ] Test Print Shack link from every page
- [ ] Test logo navigation to home
- [ ] Test account icon navigation
- [ ] Test cart icon navigation
- [ ] Test product card navigation
- [ ] Test collection card navigation
- [ ] Test all "Back" buttons
- [ ] Verify all routes defined in main.dart
- [ ] Test direct URL entry for all routes
- [ ] Test parameterized routes (collection/:name, product/:id)
- [ ] Test browser back button
- [ ] Test browser forward button
- [ ] Create 404 handler or redirect
- [ ] Test invalid URLs
- [ ] Document all routes in README
- [ ] Test complete user journeys (home → collections → product → cart)

**Tests:**
- [ ] All navbar links work on all pages
- [ ] Logo returns to home from anywhere
- [ ] Button navigation works throughout app
- [ ] Direct URL entry works for all routes
- [ ] Browser back/forward buttons work correctly
- [ ] Parameterized routes pass data correctly
- [ ] No navigation dead-ends exist
- [ ] Deep linking works correctly

---

### 3.7. Responsiveness (5%)

**Implementation Tasks:**
- [ ] Test homepage on mobile (< 600px)
- [ ] Verify mobile hero section displays correctly
- [ ] Verify mobile product grid shows 2 columns
- [ ] Test homepage on tablet (600-900px)
- [ ] Test homepage on desktop (> 900px)
- [ ] Verify navbar expands on desktop
- [ ] Verify navbar collapses on mobile
- [ ] Test collections page at all breakpoints
- [ ] Adjust collection grid columns (2 mobile, 3-4 desktop)
- [ ] Test collection page at all breakpoints
- [ ] Adjust product grid for different sizes (2 mobile, 3 desktop)
- [ ] Test product page on mobile (stacked layout)
- [ ] Test product page on desktop (two-column: image | details)
- [ ] Test cart page at all sizes
- [ ] Test auth page centering at all sizes
- [ ] Test Print Shack at all sizes
- [ ] Verify text readability at all sizes (min 14px)
- [ ] Check touch targets on mobile (min 44x44px)
- [ ] Verify no horizontal scrolling on any page
- [ ] Test navbar collapse/expand at 600px breakpoint
- [ ] Test drawer menu on mobile
- [ ] Verify image scaling on all pages
- [ ] Test footer at all sizes
- [ ] Test sale page at all breakpoints
- [ ] Document responsive behavior in README
- [ ] Take screenshots of key pages at mobile/tablet/desktop for demo

**Tests:**
- [ ] All pages tested at mobile width (< 600px)
- [ ] All pages tested at tablet width (600-900px)
- [ ] All pages tested at desktop width (> 900px)
- [ ] Images scale appropriately
- [ ] Text remains readable at all sizes
- [ ] Buttons/links remain clickable and accessible
- [ ] No horizontal scrolling occurs
- [ ] Grid layouts adjust column count appropriately
- [ ] Touch targets adequate on mobile (44x44px minimum)
- [ ] Navbar responsive behavior works correctly

---