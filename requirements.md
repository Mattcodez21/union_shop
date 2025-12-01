# Union Shop - Feature Requirements

## Project Overview

The Union Shop is a Flutter-based e-commerce application that recreates the Portsmouth Student Union's online merchandise store. This application provides students with a mobile-first shopping experience for university-branded products, including apparel, accessories, and gifts.

---

## 1. Static Homepage

### 1.1. Feature Description and Purpose

The Static Homepage serves as the entry point to the Union Shop application. It provides users with an engaging visual introduction to the shop through a hero banner section and showcases featured products to encourage browsing. The homepage establishes the visual identity and navigation structure for the entire application, using hardcoded content to demonstrate the layout and user interface design.

### 1.2. User Stories

**Visual Welcome Experience:**
- As a user, I want to see an attractive hero banner when I open the app, so I immediately understand what the shop offers.
- As a user, I want to see the shop's branding and university colors, so I feel confident I'm in the official university shop.

**Product Discovery:**
- As a user, I want to see featured products on the homepage, so I can quickly browse popular items without navigating elsewhere.
- As a user, I want to see product names and prices clearly, so I can make informed decisions about what interests me.

**Navigation:**
- As a user, I want to access search, account, and cart functions from the header, so I can quickly perform common actions.
- As a user, I want to see footer information with links, so I can find additional information and contact details.

### 1.3. Acceptance Criteria

**Header Section:**
- Purple branded banner displays welcome message at the top
- University logo is visible and clickable (returns to homepage)
- Search, account, cart, and menu icons are present in the header
- Header remains visible when scrolling

**Hero Banner:**
- Hero section displays with background image and text overlay
- Hero text overlays the image with appropriate contrast for readability
- "Browse Products" call-to-action button is visible and styled
- Hero section is at least 300-400px tall on mobile view

**Featured Products Section:**
- Section displays "FEATURED PRODUCTS" heading
- Grid layout shows 4 featured products
- Each product card shows: image, product name, and price
- Product cards are tappable and navigate to product detail page
- Grid is responsive (adjusts columns based on screen width)

**Footer Section:**
- Footer displays shop name or branding
- Basic placeholder text for links is present
- Footer spans full width of the page
- Footer uses contrasting background color

**General Requirements:**
- Page is scrollable on mobile view
- All hardcoded content displays correctly
- No errors or warnings in console
- Layout works on mobile view (primary focus)

### 1.4. Implementation Tasks

1. Update header banner text with welcoming message
2. Update hero section title and description
3. Change "PRODUCTS SECTION" to "FEATURED PRODUCTS"
4. Update product card names and prices to realistic values
5. Test mobile responsiveness and scrolling

---

## 2. About Us Page

### 2.1. Feature Description and Purpose

The About Us page provides information about the Union Shop, its mission, and contact details. This static page serves to build trust with users by explaining the shop's purpose and establishing credibility. It is implemented as a separate route from the homepage to maintain clean navigation structure.

### 2.2. User Stories

**Company Information:**
- As a user, I want to learn about the Union Shop's mission, so I understand what the shop stands for.
- As a user, I want to see contact information, so I know how to reach the shop if I have questions.

**Navigation:**
- As a user, I want to easily navigate to the About page from the homepage, so I can learn more about the shop.
- As a user, I want a clear way to return to shopping, so I can continue browsing after reading about the shop.

### 2.3. Acceptance Criteria

**Page Structure:**
- About Us page accessible via `/about` route
- Page has app bar with "About" title and back button
- "About us" heading displays centered at top of content

**Content:**
- "Welcome to the Union Shop!" greeting displays
- Company description explains the shop's purpose
- Mission or values statement is included
- Contact email (hello@upsu.net) is visible
- Professional sign-off ("The Union Shop & Reception Team") appears at bottom

**Navigation:**
- Page accessible from homepage footer link
- Back button in app bar returns to previous page
- All text displays with proper spacing and formatting

### 2.4. Implementation Tasks

1. Create pages/about_page.dart with basic structure
2. Add app bar with "About" title and back button
3. Add "About us" heading centred at the top
4. Add About Us text content
5. Add '/about' route to main.dart
6. Add navigation link from homepage footer
7. Test everything displays correctly

---

## 3. Footer

### 3.1. Feature Description and Purpose

The Footer widget provides consistent navigation links, contact information, and branding across the application. It serves as a secondary navigation tool and displays important information such as opening hours, policies, and social media links. The footer is implemented as a reusable widget that can be included on multiple pages.

### 3.2. User Stories

**Information Access:**
- As a user, I want to see opening hours in the footer, so I know when the physical shop is open.
- As a user, I want to access policy links from the footer, so I can review terms and privacy information.
- As a user, I want to see social media links, so I can follow the shop on social platforms.

**Newsletter Signup:**
- As a user, I want to subscribe to newsletters from the footer, so I can receive updates about sales and new products.

**Consistent Navigation:**
- As a user, I want the footer to appear on all pages, so I always have access to important links and information.

### 3.3. Acceptance Criteria

**Layout:**
- Footer displays in three-column layout on desktop
- Footer stacks vertically on mobile (< 600px)
- Footer spans full width of page
- Footer has dark background with light text for contrast

**Opening Hours Section:**
- Displays "Opening Hours" heading
- Shows winter break closure notice with dates
- Lists term time hours (Monday - Friday)
- Lists outside term time hours
- Displays "Purchase online 24/7" message

**Help and Information Section:**
- Displays "Help and Information" heading
- Shows "Search" link
- Shows "Terms & Conditions of Sale Policy" link

**Latest Offers Section:**
- Displays "Latest Offers" heading
- Contains email input field with placeholder
- Contains "Subscribe" button
- Button styled with university purple color

**Bottom Section:**
- Social media icons (Facebook, Twitter) display
- Copyright text displays (e.g., "© 2025, upsu-store")
- "Powered by Shopify" credit displays

**Responsive Behavior:**
- Three columns on screens > 600px wide
- Single column on screens < 600px wide
- All text remains readable at all sizes
- Touch targets adequate for mobile

### 3.4. Implementation Tasks

1. Create lib/widgets/footer.dart with Footer widget class
2. Add three-column layout (Opening Hours, Help and Information, Latest Offers)
3. Add "Opening Hours" section with winter break closure notice and term times
4. Add "Help and Information" section with Search and Terms & Conditions links
5. Add "Latest Offers" section with email subscription input and button
6. Add social media icons row (Facebook, Twitter)
7. Add copyright text and "Powered by Shopify" at bottom
8. Replace homepage footer placeholder with Footer widget
9. Test footer displays correctly and is responsive

---

## 4. Dummy Collections Page

### 4.1. Feature Description and Purpose

The Dummy Collections Page displays various product collections (e.g., Hoodies, T-Shirts, Accessories) in a grid layout. This page serves as a category browser, allowing users to explore different types of products available in the shop. The page uses hardcoded collection data to demonstrate the layout and navigation structure.

### 4.2. User Stories

**Collection Browsing:**
- As a user, I want to see all available product collections, so I can choose a category that interests me.
- As a user, I want to see images for each collection, so I can visually identify the type of products.
- As a user, I want to see how many products are in each collection, so I know which collections are well-stocked.

**Navigation:**
- As a user, I want to tap on a collection to see all products in that category, so I can browse specific types of items.

### 4.3. Acceptance Criteria

**Page Structure:**
- Collections page accessible via `/collections` route
- App bar displays "Collections" title
- Page accessible from navigation menu/navbar

**Collection Display:**
- Grid displays at least 4-6 different collections
- Each collection card shows:
  - Collection image
  - Collection name (e.g., "Hoodies", "T-Shirts")
  - Product count (e.g., "12 items")
- Collections are displayed in grid layout

**Responsive Layout:**
- Grid shows 2 columns on mobile (< 600px)
- Grid shows 3-4 columns on desktop (> 600px)
- Cards maintain consistent size and spacing
- Images scale appropriately

**Interaction:**
- Each collection card is tappable
- Tapping navigates to collection detail page
- Visual feedback on tap (e.g., ripple effect)

### 4.4. Implementation Tasks

1. Create pages/collections_page.dart with basic structure
2. Add app bar with "Collections" title
3. Create hardcoded list of collection data (names and image URLs)
4. Implement GridView for collections with 2 columns on mobile
5. Create collection card widget with image, title, and item count
6. Add GestureDetector for navigation to individual collection page
7. Add '/collections' route in main.dart
8. Add navigation link from homepage/navbar to collections
9. Test collections page displays and navigation works

---

## 5. Dummy Collection Page

### 5.1. Feature Description and Purpose

The Dummy Collection Page displays all products within a specific collection (e.g., all hoodies or all t-shirts). It includes filter and sort dropdown menus to demonstrate how users will eventually be able to refine their product search. At this stage, the dropdowns are visual only and do not need to be functional. This page uses hardcoded product data.

### 5.2. User Stories

**Product Viewing:**
- As a user, I want to see all products in a collection, so I can browse available items in my chosen category.
- As a user, I want to see product images, names, and prices, so I can make informed purchasing decisions.

**Filtering and Sorting (Visual Only):**
- As a user, I want to see filter options, so I understand I'll be able to narrow down products by attributes like size or color.
- As a user, I want to see sort options, so I know I'll be able to organize products by price or popularity.

**Product Count:**
- As a user, I want to see how many products are in the collection, so I understand the selection available.

### 5.3. Acceptance Criteria

**Page Structure:**
- Collection page accessible with collection name parameter
- App bar displays collection name dynamically
- Collection description text appears below title

**Filter and Sort Section:**
- "FILTER BY" dropdown displays (showing "All products")
- "SORT BY" dropdown displays (showing "Featured" or similar)
- Product count displays (e.g., "10 products")
- Dropdowns are visible but non-functional (acceptable for dummy version)

**Product Grid:**
- At least 6-10 products display in grid
- Each product card shows:
  - Product image
  - Product name
  - Product price
- Grid layout: 2 columns on mobile, 3 columns on desktop
- Products are tappable and navigate to product detail page

**Navigation:**
- Page receives collection name from previous page
- Tapping product navigates to product detail page
- All products display correctly

### 5.4. Implementation Tasks

1. Create pages/collection_page.dart accepting collectionName parameter
2. Add app bar with dynamic collection name as title
3. Add collection description text below title
4. Add filter and sort dropdowns row (FILTER BY and SORT BY)
5. Add product count text (e.g., "10 products")
6. Create hardcoded list of products with images, names, and prices
7. Implement GridView for products (3 columns on desktop, 2 on mobile)
8. Create product card widget showing image, name, and price
9. Add GestureDetector to navigate to product page when card tapped
10. Add route with parameter in main.dart
11. Update collections page to pass collection name on navigation
12. Test collection page displays correctly with filters visible

---

## 6. Dummy Product Page

### 6.1. Feature Description and Purpose

The Dummy Product Page displays detailed information about a single product. It showcases product images, pricing, descriptions, and interactive elements like size/color selection dropdowns and quantity controls. At this stage, the interactive elements are visual only and do not need to be fully functional. This page demonstrates the complete product detail interface that will later be connected to cart functionality.

### 6.2. User Stories

**Product Information:**
- As a user, I want to see large, clear product images, so I can examine the product closely.
- As a user, I want to see the product name and price prominently, so I immediately know what I'm looking at and what it costs.
- As a user, I want to read a product description, so I can learn about the product's features and benefits.
- As a user, I want to see material and care information, so I know how to maintain the product.

**Product Customization (Visual):**
- As a user, I want to see options for selecting size, so I know the product comes in different sizes.
- As a user, I want to see options for selecting color, so I know what color choices are available.
- As a user, I want to adjust quantity, so I can potentially order multiple items.

**Purchase Actions (Visual):**
- As a user, I want to see an "Add to Cart" button, so I understand how I'll purchase the item.
- As a user, I want to see alternative payment options like Shop Pay, so I know what payment methods might be available.

**Additional Information:**
- As a user, I want to see a size guide, so I can choose the correct size for my needs.
- As a user, I want to share the product on social media, so I can show it to friends or save it for later.

### 6.3. Acceptance Criteria

**Page Layout:**
- Product page accessible via route with product parameter
- Two-column layout on desktop (image left, details right)
- Stacked layout on mobile (image top, details below)

**Product Images:**
- Main product image displays prominently
- Image carousel/thumbnails visible below main image (multiple product views)
- Images are appropriately sized for mobile and desktop

**Product Information:**
- Product name displays in large, bold text
- Price displays prominently
- "Tax included" text appears near price
- Product description paragraph visible
- Material/care details paragraph visible

**Interactive Elements (Visual Only):**
- Color dropdown shows color options (e.g., Black, Purple, Green, Grey)
- Size dropdown shows size options (S, M, L, XL)
- Quantity number input field displays (default value: 1)
- "ADD TO CART" button visible and styled (purple)
- "Buy with Shop Pay" button visible

**Additional Features:**
- Social share buttons display (SHARE, TWEET, PIN IT) - non-functional acceptable
- Size guide table visible below images
- "BACK TO [COLLECTION]" button at bottom
- All elements properly spaced and styled

**Responsive Behavior:**
- Mobile: Single column, stacked layout
- Desktop: Two-column layout (60/40 split image/details)
- All text remains readable
- Images scale appropriately

### 6.4. Implementation Tasks

1. Open existing pages/product_page.dart and enhance structure
2. Add large product image on left side (with image carousel thumbnails below)
3. Add product title, price, and "Tax included" text on right side
4. Add Color dropdown with options (Black, Purple, Green, Grey)
5. Add Size dropdown with options (S, M, L, XL)
6. Add Quantity number input field
7. Add "ADD TO CART" button (non-functional for now)
8. Add "Buy with Shop Pay" button placeholder
9. Add product description text
10. Add product details text (materials, care instructions)
11. Add social share buttons (SHARE, TWEET, PIN IT - non-functional)
12. Add size guide table below images
13. Add "BACK TO [COLLECTION]" button at bottom
14. Style page with proper layout and spacing
15. Test product page displays correctly on mobile and desktop

---

## 7. Sale Collection

### 7.1. Feature Description and Purpose

The Sale Collection page displays products that are currently on sale with discounted pricing. It includes promotional messaging to create urgency and showcases the price reduction through strikethrough original prices and highlighted sale prices. This page encourages users to take advantage of limited-time offers and special deals. The page uses hardcoded sale product data.

### 7.2. User Stories

**Sale Discovery:**
- As a user, I want to see all products currently on sale, so I can take advantage of discounts.
- As a user, I want to see both original and sale prices, so I understand how much I'm saving.
- As a user, I want to see promotional messaging, so I'm motivated to purchase before the sale ends.

**Price Visibility:**
- As a user, I want sale items to be clearly marked, so I can easily identify discounted products.
- As a user, I want to see the discount amount or percentage, so I know the value of the deal.

**Product Filtering:**
- As a user, I want to filter and sort sale items (visual elements), so I can find the best deals in my size or preferred category.

### 7.3. Acceptance Criteria

**Page Structure:**
- Sale page accessible via `/sale` route
- "SALE" heading displays prominently at top
- Promotional message displays: "Don't miss out! Get yours before they're all gone!"
- Discount notice displays: "All prices shown are inclusive of the discount"

**Product Display:**
- At least 6-10 sale products display in grid
- Grid layout: 2 columns on mobile, 3 columns on desktop
- Each product card shows:
  - Product image
  - Product name
  - Original price with strikethrough (e.g., ~~£17.00~~)
  - Sale price in contrasting color (e.g., £10.99 in red/orange)
- Some products show "SALE" badge overlay (red stamp)

**Filter and Sort (Visual):**
- "FILTER BY" dropdown displays (showing "All products")
- "SORT BY" dropdown displays (showing "Best selling" or similar)
- Product count displays (e.g., "14 products")
- Dropdowns visible but non-functional (acceptable for dummy version)

**Styling:**
- Sale prices styled prominently (red, orange, or accent color)
- Original prices clearly struck through
- "SALE" badges visible and eye-catching
- Page conveys sense of urgency and value

**Navigation:**
- Products are tappable
- Tapping navigates to product detail page
- Sale page accessible from navbar

### 7.4. Implementation Tasks

1. Create pages/sale_page.dart with basic structure
2. Add app bar with "SALE" title
3. Add promotional message "Don't miss out! Get yours before they're all gone!"
4. Add discount notice text "All prices shown are inclusive of the discount"
5. Add filter and sort dropdowns row (FILTER BY and SORT BY)
6. Add product count text (e.g., "14 products")
7. Create hardcoded list of sale products with original and sale prices
8. Implement GridView for sale products (3 columns on desktop, 2 on mobile)
9. Create sale product card showing image, name, strikethrough original price, and sale price
10. Add "SALE" badge overlay on products with discount
11. Add '/sale' route in main.dart
12. Add navigation link from navbar to sale page
13. Test sale page displays with correct pricing format

---

## 8. Authentication UI

### 8.1. Feature Description and Purpose

The Authentication UI provides the interface for users to sign in to their accounts. This page displays the login form with email input and alternative sign-in options. At this stage, the form elements are visual only and do not need to be connected to a functional authentication system. The page demonstrates the user interface for the authentication flow that will later be implemented in the advanced features.

### 8.2. User Stories

**Account Access:**
- As a user, I want to see a clear sign-in interface, so I understand how to access my account.
- As a user, I want multiple sign-in options, so I can choose my preferred authentication method.

**Form Clarity:**
- As a user, I want clear labels and placeholders, so I know what information to enter.
- As a user, I want a professional, trustworthy design, so I feel confident entering my information.

### 8.3. Acceptance Criteria

**Page Structure:**
- Auth page accessible via `/auth` route
- Union logo displays at top center
- "Sign in" heading displays prominently
- Subtitle text: "Choose how you'd like to sign in"
- Page has centered card layout on light background

**Sign-in Options:**
- "Sign in with shop" button displays (purple, full width)
- Button styled consistently with app theme
- "or" divider text displays between options

**Email Form:**
- Email input field displays with border
- Email field has placeholder text ("Email")
- Email field appropriately sized and styled
- "Continue" button displays below email field (grey)

**Styling:**
- Page centered on screen
- White card/container for form elements
- Light grey background
- Proper spacing between elements
- Professional, clean design
- Mobile-responsive layout

**Navigation:**
- Auth page accessible from navbar account icon
- Page displays correctly on mobile and desktop

### 8.4. Implementation Tasks

1. Create pages/auth_page.dart with basic structure
2. Add Union logo at top center
3. Add "Sign in" heading and subtitle "Choose how you'd like to sign in"
4. Add "Sign in with shop" button (purple, non-functional)
5. Add "or" divider text
6. Add email TextFormField with border styling
7. Add "Continue" button (grey, non-functional)
8. Style page with centered card layout and white background
9. Add '/auth' route in main.dart
10. Add navigation from account icon in navbar
11. Test auth page displays correctly centered on screen

---

## 9. Static Navbar

### 9.1. Feature Description and Purpose

The Static Navbar provides consistent top-level navigation across the entire application. On desktop, it displays as a horizontal menu bar with links to all major sections. On mobile, it collapses into a hamburger menu to save screen space. The navbar includes the shop logo, navigation links, and quick access icons for search, account, and shopping cart. At this stage, the navbar provides visual navigation structure; full functionality will be implemented in intermediate features.

### 9.2. User Stories

**Navigation Access:**
- As a user, I want to see navigation options at the top of every page, so I can easily move between sections.
- As a user, I want the navbar to work consistently across all pages, so I have a predictable navigation experience.

**Responsive Design:**
- As a user on mobile, I want the navigation to collapse into a menu button, so it doesn't take up too much screen space.
- As a user on desktop, I want to see all navigation links displayed horizontally, so I can quickly click where I want to go.

**Quick Actions:**
- As a user, I want quick access to search, my account, and my shopping cart, so I can perform common actions from any page.
- As a user, I want to see how many items are in my cart at a glance, so I know my cart status without navigating to it.

**Branding:**
- As a user, I want to see the shop logo prominently, so I'm always aware I'm in the official university shop.
- As a user, I want the logo to be clickable to return home, so I have a consistent way to return to the start.

### 9.3. Acceptance Criteria

**Desktop View (> 600px):**
- Full navbar displays horizontally
- Union logo visible on left side
- Navigation links displayed: Home, Shop, The Print Shack, SALE!, About, UPSU.net
- "Shop" and "The Print Shack" have dropdown arrow indicators (∨)
- Right side shows search, account, and cart icons
- Cart icon displays badge with item count

**Mobile View (< 600px):**
- Navbar shows condensed version
- Union logo visible on left
- Hamburger menu icon (☰) displays on right
- Search, account, and cart icons display
- Full navigation links hidden

**Drawer Menu (Mobile):**
- Tapping hamburger icon opens side drawer
- Drawer contains all navigation links vertically
- Drawer includes: Home, Collections, Sale, About, Print Shack, Account
- Drawer closes when item selected or outside tap

**Logo:**
- Union logo clickable
- Logo navigation returns to homepage
- Logo consistent size and positioning

**Icons:**
- Search icon displays and is tappable
- Account icon displays and is tappable
- Cart icon displays with badge number
- Icons appropriately sized (touch-friendly on mobile)

**Consistency:**
- Navbar appears on all pages
- Navbar maintains consistent styling
- Active page highlighted or indicated

**Responsive Breakpoint:**
- Navbar switches from desktop to mobile view at 600px width
- Transition is smooth and does not break layout

### 9.4. Implementation Tasks

1. Create widgets/navbar.dart file
2. Add Union logo on the left side (clickable, links to home)
3. Add desktop navigation links (Home, Shop, The Print Shack, SALE!, About, UPSU.net)
4. Add dropdown arrow indicators for Shop and The Print Shack links
5. Add right-side icons (Search, Account, Cart with badge)
6. Add LayoutBuilder to detect screen width (>600px = desktop)
7. Create mobile version with hamburger menu icon
8. Create Drawer widget for mobile navigation menu
9. Add all navigation items to drawer
10. Replace existing AppBar on all pages with custom navbar
11. Test navbar displays correctly on desktop and mobile views
12. Test navbar collapses to hamburger menu on mobile

---

---

## 10. Dynamic Collections Page

### 10.1. Feature Description and Purpose

The Dynamic Collections Page enhances the dummy collections page by populating it with data from structured models and services rather than hardcoded arrays. It implements functional sorting and filtering widgets that allow users to organize collections by various criteria. This feature demonstrates data modeling, state management, and dynamic UI updates based on user interaction.

### 10.2. User Stories

**Data-Driven Display:**
- As a user, I want collections to be loaded from a data source, so the page can easily be updated with new collections without code changes.
- As a user, I want to see collections organized logically, so I can find the category I'm looking for quickly.

**Sorting Functionality:**
- As a user, I want to sort collections alphabetically (A-Z or Z-A), so I can find collections by name easily.
- As a user, I want to sort by popularity or item count, so I can see which collections have the most products.

**Filtering:**
- As a user, I want to filter collections by type or category, so I can narrow down my options.

### 10.3. Acceptance Criteria

**Data Structure:**
- Collections loaded from `Collection` model class
- Data stored in separate data file (not hardcoded in widget)
- Each collection has: id, name, description, imageUrl, product count

**Functional Sorting:**
- Sort dropdown displays options: "A-Z", "Z-A", "Most Products", "Featured"
- Selecting sort option reorders collections immediately
- UI updates without page reload
- Current sort selection persists while on page

**Functional Filtering:**
- Filter options available (e.g., by category: Apparel, Accessories, Gifts)
- Selecting filter shows only matching collections
- Filter can be cleared to show all collections
- Collections count updates to reflect filtered results

**State Management:**
- Uses `StatefulWidget` with `setState` for UI updates
- Sort and filter state maintained correctly
- No errors when changing sort/filter rapidly

**UI Updates:**
- Grid updates immediately when sort/filter changes
- Smooth transitions when collections reorder
- Loading indicator if needed (for future API calls)
- "No results" message if filter returns empty

### 10.4. Implementation Tasks

1. Create lib/models/ folder
2. Create models/collection.dart with Collection class (id, name, description, imageUrl, productCount)
3. Create lib/data/ folder
4. Create data/collections_data.dart with list of 6-8 collections
5. Convert CollectionsPage to StatefulWidget
6. Add state variables for sortBy and filterBy
7. Replace hardcoded collections with data from collections_data.dart
8. Implement sort dropdown with options (A-Z, Z-A, Most Products)
9. Add onChanged handler for sort dropdown
10. Implement sorting logic (alphabetical, by product count)
11. Add filter dropdown with category options
12. Implement filter logic to show matching collections
13. Update GridView to use filtered and sorted collections
14. Test all sort options work correctly
15. Test all filter options work correctly

---

## 11. Dynamic Collection Page

### 11.1. Feature Description and Purpose

The Dynamic Collection Page displays products within a specific collection, loaded from a data model rather than hardcoded. It implements functional sorting (by price, name, popularity) and filtering (by size, color, availability) that actually modify what products are displayed. This feature demonstrates advanced state management, data filtering algorithms, and dynamic list manipulation.

### 11.2. User Stories

**Product Browsing:**
- As a user, I want to see all products in a collection loaded dynamically, so new products appear automatically when added to the data.
- As a user, I want to see accurate product counts, so I know how many items match my criteria.

**Sorting Products:**
- As a user, I want to sort by price (low to high, high to low), so I can find products in my budget.
- As a user, I want to sort by name (A-Z), so I can find specific products alphabetically.
- As a user, I want to sort by newest/featured, so I can see the latest additions.

**Filtering Products:**
- As a user, I want to filter by size (S, M, L, XL), so I only see products available in my size.
- As a user, I want to filter by color, so I only see products in colors I like.
- As a user, I want to filter by price range, so I can stay within my budget.
- As a user, I want to combine multiple filters, so I can narrow down to exactly what I want.

**Pagination (Optional):**
- As a user, I want to see a limited number of products per page, so the page loads quickly and isn't overwhelming.
- As a user, I want to navigate between pages or load more products, so I can browse the full collection.

### 11.3. Acceptance Criteria

**Data Model:**
- Products loaded from `Product` model class
- Product model includes: id, name, description, price, category, sizes, colors, images
- Products stored in data/products_data.dart (15-20 products minimum)
- Products filtered by collection parameter from route

**Functional Sorting:**
- Sort dropdown with options: "Featured", "Price: Low to High", "Price: High to Low", "Name: A-Z"
- Selecting sort option reorders products immediately
- Products display in correct order after sort
- Sort persists during filtering

**Functional Filtering:**
- Size filter shows available sizes (S, M, L, XL)
- Color filter shows available colors
- Price range filter (optional: slider or dropdown)
- Multiple filters can be applied simultaneously
- Filters show only products matching ALL selected criteria
- Clear filters button resets to show all products

**Product Display:**
- Product count updates dynamically (e.g., "Showing 8 of 12 products")
- Grid displays filtered products
- "No products found" message when filters return empty
- Grid remains responsive (2 cols mobile, 3 cols desktop)

**State Management:**
- Uses `StatefulWidget` with proper state management
- UI updates immediately when sort/filter changes
- No duplicate products or rendering errors
- Smooth performance with 20+ products

### 11.4. Implementation Tasks

1. Create models/product.dart with Product class
2. Add properties: id, name, description, price, category, sizes[], colors[], imageUrls[]
3. Create data/products_data.dart with 15-20 diverse products
4. Include products across multiple categories (Hoodies, T-Shirts, Accessories, etc.)
5. Ensure products have varied sizes, colors, and prices for filtering
6. Convert CollectionPage to StatefulWidget
7. Add state variables: selectedSort, selectedSize, selectedColor, priceRange
8. Create method to get products by collection from data
9. Implement sort dropdown with all sort options
10. Create sorting logic method (sortProducts) handling all cases
11. Implement size filter dropdown
12. Implement color filter dropdown
13. Create filtering logic method (filterProducts) that combines all filters
14. Update product count text dynamically based on filtered results
15. Connect GridView to display filtered and sorted products
16. Add "Clear Filters" button that resets all filters
17. Test sort functionality with all options
18. Test each filter individually
19. Test multiple filters combined
20. Test edge cases (no results, all filters applied)

---

## 12. Functional Product Pages

### 12.1. Feature Description and Purpose

The Functional Product Page loads product data dynamically based on a product ID parameter and implements working interactive elements. Users can select size, color, and quantity, with the UI updating to reflect their choices. This feature demonstrates route parameters, state management for user selections, and preparing for cart functionality (though "Add to Cart" implementation comes later).

### 12.2. User Stories

**Product Information:**
- As a user, I want to see the correct product details when I select a product, so I know I'm viewing what I clicked on.
- As a user, I want to see all available options for this specific product, so I know what choices I have.

**Size Selection:**
- As a user, I want to select my size from a dropdown, so I can ensure the product will fit.
- As a user, I want to see only sizes available for this product, so I don't select unavailable options.
- As a user, I want my size selection to be highlighted, so I know what I've chosen.

**Color Selection:**
- As a user, I want to select my preferred color, so I get the product in the color I like.
- As a user, I want to see all available colors for this product.

**Quantity Adjustment:**
- As a user, I want to increase the quantity with a + button, so I can order multiple items.
- As a user, I want to decrease the quantity with a - button, so I can correct mistakes.
- As a user, I want the quantity to not go below 1, so I always have at least one item selected.
- As a user, I want to see the quantity number update immediately, so I know how many I'm ordering.

**Visual Feedback:**
- As a user, I want to see my selections reflected in the UI, so I'm confident in what I'm ordering.
- As a user, I want the page to be responsive to my actions, so I have a smooth experience.

### 12.3. Acceptance Criteria

**Dynamic Data Loading:**
- Product page accepts product ID as route parameter
- Product loaded from products_data.dart using ID
- If product not found, show error message or redirect
- All product data displays correctly (name, price, description, images)

**Size Selection:**
- Size dropdown populated with product's available sizes
- Dropdown shows currently selected size
- Selecting size updates state immediately
- Default size pre-selected (e.g., first available or "M")
- Dropdown disabled if product has only one size

**Color Selection:**
- Color dropdown populated with product's available colors
- Dropdown shows currently selected color
- Selecting color updates state immediately
- Default color pre-selected
- Dropdown disabled if product has only one color

**Quantity Controls:**
- Quantity displays with current value (default: 1)
- Plus (+) button increments quantity by 1
- Minus (-) button decrements quantity by 1
- Quantity cannot go below 1 (minus button disabled at 1)
- Quantity updates immediately when buttons pressed
- Large quantities (20+) are allowed

**State Management:**
- Uses `StatefulWidget` for interactive elements
- State variables: selectedSize, selectedColor, quantity
- `setState` called appropriately for UI updates
- State persists during page session
- No errors when rapidly clicking buttons

**Add to Cart Button:**
- Button displays prominently
- Button shows current selection summary (optional)
- Button can be tapped (functionality in next feature)
- For now, button can show snackbar: "Add to cart functionality coming soon"

**Product Images:**
- Main product image displays
- Image carousel/thumbnails show multiple views (if available)
- Images relate to selected color (optional enhancement)

### 12.4. Implementation Tasks

1. Update ProductPage to accept product ID parameter (String id)
2. Create method to fetch product by ID from products_data.dart
3. Handle case where product is not found (show error or redirect)
4. Convert ProductPage to StatefulWidget
5. Add state variables: selectedSize, selectedColor, quantity
6. Initialize state with default values (first size, first color, quantity: 1)
7. Create size dropdown using DropdownButton widget
8. Populate dropdown items from product.sizes list
9. Add onChanged handler for size dropdown
10. Update selectedSize state when dropdown changes
11. Create color dropdown using DropdownButton widget
12. Populate dropdown items from product.colors list
13. Add onChanged handler for color dropdown
14. Update selectedColor state when dropdown changes
15. Create quantity counter UI (Row with -, number, + buttons)
16. Implement increment quantity method (quantity++)
17. Implement decrement quantity method (if quantity > 1, quantity--)
18. Connect + button to increment method
19. Connect - button to decrement method
20. Disable - button when quantity is 1
21. Update "Add to Cart" button to show temporary snackbar
22. Test navigation from collection page with different product IDs
23. Test all dropdowns update correctly
24. Test quantity controls (increment, decrement, boundary at 1)
25. Verify UI updates immediately for all interactions

---

## 13. Shopping Cart

### 13.1. Feature Description and Purpose

The Shopping Cart feature enables users to add products to a cart, view their cart contents, and complete a basic checkout process. This feature introduces more complex state management, data persistence within the session, and demonstrates a multi-step user flow from product selection to order placement. The checkout process places orders without real payment processing.

### 13.2. User Stories

**Adding to Cart:**
- As a user, I want to add a product to my cart from the product page, so I can purchase it later.
- As a user, I want to see confirmation when an item is added, so I know my action succeeded.
- As a user, I want to see my cart item count update, so I know how many items I have.

**Viewing Cart:**
- As a user, I want to access my cart from any page, so I can review what I'm purchasing.
- As a user, I want to see all items I've added with their details, so I can verify my selections.
- As a user, I want to see the total price, so I know how much I'll pay.

**Cart Management (Basic):**
- As a user, I want to see the quantity and size/color I selected, so I can confirm my choices.
- As a user, I want to see individual item prices and subtotals, so I understand the cost breakdown.

**Checkout:**
- As a user, I want to proceed to checkout, so I can complete my purchase.
- As a user, I want to see an order confirmation, so I know my order was placed successfully.
- As a user, I want my cart to clear after checkout, so I can start a new order.

### 13.3. Acceptance Criteria

**Cart Data Model:**
- CartItem model created with: product, selectedSize, selectedColor, quantity
- Cart state managed in app (Provider, InheritedWidget, or simple state management)
- Cart data persists during app session

**Add to Cart Functionality:**
- "Add to Cart" button on product page actually adds item
- CartItem created with current selectedSize, selectedColor, quantity
- Snackbar shows "Added to cart" confirmation
- Cart icon badge updates with item count
- User can add multiple different products
- User can add same product with different size/color (creates separate cart items)

**Cart Page:**
- Cart page accessible via route (/cart)
- Navigation to cart from cart icon in navbar
- Page displays all cart items in list
- Each cart item shows:
  - Product image
  - Product name
  - Selected size and color
  - Quantity
  - Individual price
  - Subtotal (price × quantity)

**Cart Calculations:**
- Subtotal calculates correctly for each item
- Total cart price calculates correctly (sum of all subtotals)
- Prices update if quantities change (in advanced feature)
- Tax included note (if applicable)

**Checkout Process:**
- "Proceed to Checkout" or "Place Order" button visible
- Button enabled when cart has items
- Button disabled when cart is empty
- Clicking button "places order" (no real payment)
- Success message or confirmation page displays
- Cart clears after successful checkout

**Empty Cart State:**
- When cart is empty, show appropriate message
- Message suggests continuing shopping
- Link back to collections or homepage
- Checkout button disabled or hidden

**Cart Icon Badge:**
- Cart icon in navbar shows number of items
- Badge updates when items added
- Badge shows total quantity (sum of all item quantities)
- Badge disappears when cart empty

### 13.4. Implementation Tasks

1. Create models/cart_item.dart
2. Add properties: product (Product), selectedSize, selectedColor, quantity
3. Create services/cart_service.dart (or use simple state management)
4. Implement cart state (List<CartItem>)
5. Create addToCart(CartItem item) method
6. Create getCartItems() method
7. Create getTotalPrice() method
8. Create clearCart() method
9. Update ProductPage "Add to Cart" button
10. Create CartItem from current state (product, selectedSize, selectedColor, quantity)
11. Call cartService.addToCart(cartItem)
12. Show snackbar confirmation "Added to cart"
13. Update cart icon badge to show item count
14. Create pages/cart_page.dart
15. Add route for cart page (/cart)
16. Connect cart icon navigation to cart page
17. Display list of all cart items using ListView
18. Create cart item card widget showing all details
19. Calculate and display subtotal for each item
20. Calculate and display total cart price
21. Add "Place Order" or "Checkout" button
22. Implement checkout function (show confirmation, clear cart)
23. Show order confirmation page or snackbar
24. Handle empty cart state with message
25. Test adding single product to cart
26. Test adding multiple products to cart
27. Test adding same product with different options
28. Test cart icon badge updates correctly
29. Test total price calculates correctly
30. Test checkout clears cart and shows confirmation

---

## 14. Print Shack

### 14.1. Feature Description and Purpose

The Print Shack feature provides a text personalization tool where users can customize products with their own text. The form dynamically updates a preview based on user selections for text content, font, and color. This feature demonstrates dynamic form handling, real-time preview updates, and conditional UI rendering based on form state.

### 14.2. User Stories

**Text Customization:**
- As a user, I want to enter custom text for my product, so I can personalize it.
- As a user, I want to see my text in real-time as I type, so I can visualize the final product.

**Font Selection:**
- As a user, I want to choose from different fonts, so my text matches my style.
- As a user, I want the preview to update when I change fonts, so I can compare options.

**Color Selection:**
- As a user, I want to select a text color, so my personalization stands out.
- As a user, I want to see the color applied in the preview, so I know how it will look.

**Product Information:**
- As a user, I want to learn about the Print Shack service, so I understand what's available and any limitations.

### 14.3. Acceptance Criteria

**Print Shack Page:**
- Page accessible via route (/print-shack)
- Page includes text input field
- Font selection dropdown (3+ font options)
- Color selection dropdown (3+ color options)
- Live preview area showing customized text

**Dynamic Preview:**
- Preview displays text as user types (real-time update)
- Preview font changes when font dropdown changes
- Preview color changes when color dropdown changes
- Preview updates smoothly without lag
- Default preview shows placeholder text

**Form Fields:**
- Text input accepts all characters
- Text input has character limit (e.g., 20 characters) with counter
- Font dropdown shows font names
- Color dropdown shows color names (bonus: color swatches)
- All fields have clear labels

**About Print Shack Page:**
- Separate about/info page for Print Shack
- Explains personalization service
- Shows examples or guidelines
- Navigation between print shack and about page works

**State Management:**
- Uses StatefulWidget
- State variables: customText, selectedFont, selectedColor
- setState triggers preview updates
- No errors with empty or special character input

### 14.4. Implementation Tasks

1. Create pages/print_shack_page.dart
2. Create StatefulWidget for Print Shack page
3. Add state variables: customText, selectedFont, selectedColor
4. Add text input field with label
5. Add onChanged handler to update customText state
6. Add character counter showing current/max characters
7. Create font dropdown with options (e.g., Arial, Roboto, Courier)
8. Add onChanged handler to update selectedFont state
9. Create color dropdown with options (e.g., Black, Red, Blue, Purple)
10. Add onChanged handler to update selectedColor state
11. Create preview widget (Container with Text)
12. Bind preview text to customText state
13. Apply selectedFont to preview text style
14. Apply selectedColor to preview text color
15. Add default placeholder text for empty state
16. Create pages/print_shack_about_page.dart
17. Add Print Shack service information and guidelines
18. Add navigation link from Print Shack page to About page
19. Add navigation link from About page back to Print Shack
20. Add route for both Print Shack pages in main.dart
21. Add Print Shack link to navbar
22. Test preview updates as text is typed
23. Test preview updates when font changes
24. Test preview updates when color changes
25. Test character limit enforcement
26. Test navigation between Print Shack pages

---

## 15. Navigation

### 15.1. Feature Description and Purpose

Full navigation ensures that users can move seamlessly between all pages in the application using multiple methods: navbar links, buttons, direct URL entry, and browser back/forward buttons. This feature verifies that the complete navigation structure works cohesively and that all routes are properly configured and accessible.

### 15.2. User Stories

**Navigation Methods:**
- As a user, I want to navigate using the navbar, so I can quickly access main sections.
- As a user, I want to use buttons on pages to navigate, so I have context-specific navigation.
- As a user, I want to type URLs directly, so I can bookmark or share specific pages.
- As a user, I want browser back/forward buttons to work, so I can navigate naturally.

**Complete Coverage:**
- As a user, I want every page to be reachable, so I'm never stuck.
- As a user, I want clear navigation from every location, so I always know how to get where I need.

### 15.3. Acceptance Criteria

**Navbar Navigation:**
- All navbar links work on all pages
- Home, Collections, Sale, Print Shack, About links functional
- Logo returns to homepage from any page
- Account and Cart icons navigate correctly
- Mobile drawer menu works on all pages

**Button Navigation:**
- Product cards navigate to product pages
- Collection cards navigate to collection pages
- "Back" buttons return to previous pages
- "Continue Shopping" links work
- All call-to-action buttons navigate correctly

**URL Navigation:**
- All routes defined in main.dart
- Direct URL entry works for all pages:
  - `/` → Homepage
  - `/about` → About page
  - `/collections` → Collections page
  - `/collection/:name` → Specific collection
  - `/product/:id` → Specific product
  - `/sale` → Sale page
  - `/cart` → Cart page
  - `/auth` → Auth page
  - `/print-shack` → Print Shack
- Invalid URLs show 404 or redirect to home

**Browser Navigation:**
- Back button returns to previous page correctly
- Forward button works after going back
- Navigation history maintained properly
- No broken navigation loops

**Deep Linking:**
- Direct links to products work (e.g., `/product/hoodie-1`)
- Direct links to collections work (e.g., `/collection/hoodies`)
- Parameters passed correctly in URLs

**State Preservation:**
- Filters/sorts don't reset when navigating back
- Cart persists across navigation
- User doesn't lose data navigating between pages

### 15.4. Implementation Tasks

1. Audit all navbar links on all pages
2. Verify Home link works from every page
3. Verify Collections link works from every page
4. Verify Sale link works from every page
5. Verify About link works from every page
6. Verify Print Shack link works from every page
7. Test logo navigation to home from all pages
8. Test account icon navigation from all pages
9. Test cart icon navigation from all pages
10. Audit all button navigation throughout app
11. Test product card navigation from all locations
12. Test collection card navigation
13. Test "Back" buttons on all pages
14. Verify all routes defined in main.dart routes map
15. Test direct URL entry for each route
16. Test parameterized routes (collection/:name, product/:id)
17. Test browser back button from each page
18. Test browser forward button
19. Create 404 error page or redirect handler
20. Test invalid URL handling
21. Document all available routes in README
22. Create navigation flow diagram (optional)
23. Test complete user journeys (home → collection → product → cart)
24. Verify no navigation dead-ends exist
25. Test navigation on mobile and desktop views

---

## 16. Responsiveness

### 16.1. Feature Description and Purpose

Responsiveness ensures the application adapts its layout and functionality across different screen sizes, from mobile phones to desktop monitors. The application should provide an optimal user experience regardless of device, with layouts that reflow appropriately, touch targets that are adequately sized, and content that remains readable and accessible at all breakpoints.

### 16.2. User Stories

**Mobile Experience:**
- As a mobile user, I want the app to work well on my phone, so I can shop on the go.
- As a mobile user, I want touch targets to be large enough, so I can easily tap buttons and links.
- As a mobile user, I want content to be readable without zooming, so I have a smooth experience.

**Tablet Experience:**
- As a tablet user, I want the layout to use the available space effectively, so I'm not seeing an oversized mobile layout.

**Desktop Experience:**
- As a desktop user, I want to see more content at once, so I can browse efficiently.
- As a desktop user, I want the full navbar visible, so I don't need to open menus.

**Consistent Experience:**
- As a user, I want all features to work regardless of screen size, so I'm not limited by my device.

### 16.3. Acceptance Criteria

**Breakpoints:**
- Mobile: < 600px width
- Tablet: 600px - 900px width
- Desktop: > 900px width
- Layouts adjust at appropriate breakpoints

**Mobile View (< 600px):**
- Single column layouts for content
- Product grids: 2 columns maximum
- Navbar collapses to hamburger menu
- Touch targets minimum 44x44 pixels
- Text remains readable (minimum 14px font)
- Images scale appropriately
- No horizontal scrolling
- Adequate spacing between interactive elements

**Tablet View (600px - 900px):**
- Product grids: 2-3 columns
- Navbar may show partial or full menu
- Content uses available width
- Images scale proportionally
- Text larger than mobile where appropriate

**Desktop View (> 900px):**
- Product grids: 3-4 columns
- Full navbar with all links visible
- Multi-column layouts where appropriate (e.g., product page: image left, details right)
- Maximum content width for readability (optional container)
- Hover states on interactive elements

**All Pages Responsive:**
- Homepage adapts to all sizes
- Collections page grids adjust
- Collection page grids adjust
- Product page layout stacks on mobile, side-by-side on desktop
- Cart page readable at all sizes
- Auth page centered and readable
- Print Shack functional at all sizes

**Images:**
- Images scale to container
- Maintain aspect ratio
- No stretched or distorted images
- Appropriate resolution for screen size

**No Layout Breaks:**
- No overlapping elements
- No cut-off content
- No horizontal scroll bars (unless intentional, like image carousel)
- Footer always at bottom
- Navbar always at top

### 16.4. Implementation Tasks

1. Test homepage on mobile (< 600px) in Chrome DevTools
2. Verify hero section displays correctly on mobile
3. Verify product grid shows 2 columns on mobile
4. Test homepage on tablet (600-900px)
5. Verify grid adjusts to 2-3 columns on tablet
6. Test homepage on desktop (> 900px)
7. Verify navbar expands fully on desktop
8. Verify grid shows 3-4 columns on desktop
9. Test collections page responsiveness at all breakpoints
10. Adjust collection grid columns based on screen width
11. Test collection page at all breakpoints
12. Adjust product grid columns for mobile/tablet/desktop
13. Test product page on mobile
14. Verify product page stacks vertically on mobile
15. Test product page on desktop
16. Verify product page shows two-column layout (image | details)
17. Test cart page at all breakpoints
18. Ensure cart items display readably at all sizes
19. Test auth page centering at all sizes
20. Test Print Shack page at all sizes
21. Verify all text remains readable (no text smaller than 14px)
22. Check touch target sizes on mobile (min 44x44px for buttons)
23. Verify no horizontal scrolling on any page
24. Test navbar collapse/expand at breakpoint
25. Test drawer menu on mobile
26. Check image scaling on all pages
27. Verify footer displays correctly at all sizes
28. Test all interactive elements are accessible on mobile
29. Document responsive behavior in README
30. Take screenshots of key pages at mobile/tablet/desktop for demo

---

## Summary of Intermediate Features

**Total Features:** 7  
**Total Marks:** 35%  
**Estimated Time:** 18-24 hours  
**Difficulty:** Medium - requires data modeling, state management, and dynamic UI updates

These features build upon the Basic Features foundation by adding:
- Data models and services
- Functional interactive elements (dropdowns, filters, buttons)
- State management with StatefulWidget and setState
- Complex user flows (shopping cart)
- Responsive design across devices

All features should be implemented with clean code, regular commits, and comprehensive testing.

## Summary

This requirements document outlines all **Basic Features** (40% of application marks) for the Union Shop Flutter application. Each feature is designed to be implemented with hardcoded data and non-functional UI elements where specified. These features establish the foundational user interface and navigation structure that will be enhanced with dynamic data and full functionality in the Intermediate and Advanced feature phases.

**Total Basic Features:** 9  
**Total Marks:** 40%  
**Implementation Approach:** Incremental development with small, meaningful commits for each subtask  
**Testing:** Automated testing via GitHub Actions CI/CD  
**Timeline:** Week 1-2 of development
```

---

## File 2: `tasks.md`

This will be your implementation checklist (the one you already have with all the checkboxes and commit-sized subtasks).

Keep the exact `tasks.md` file you already created with all the:
- [ ] 2.1.1, 2.1.2, etc. implementation subtasks
- Test checklists
- Progress tracking
- AI collaboration log
- Commit strategy

---

## Where to Put These Files:
```
union_shop/
├── requirements.md        ← Formal requirements document (NEW)
├── tasks.md              ← Your existing implementation checklist
├── README.md             ← Project overview and setup
├── lib/
├── test/
└── .github/