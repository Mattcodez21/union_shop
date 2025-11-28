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