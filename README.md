# UPSU Shop Recreation – Student Coursework Project

A responsive Flutter web prototype recreating the University of Portsmouth Students’ Union online shop for coursework (Modules: Programming Applications and Programming Languages — M30235; User Experience Design and Implementation — M32605).

[![Flutter Tests](https://github.com/MattCodez21/union_shop/actions/workflows/flutter_test.yml/badge.svg)](https://github.com/MattCodez21/union_shop/actions/workflows/flutter_test.yml)

---

## Table of Contents

- [Overview](#overview)
- [Purpose & Scope](#purpose--scope)
- [Key Features Implemented](#key-features-implemented)
- [Installation & Local Development](#installation--local-development)
- [Design & UX Considerations](#design--ux-considerations)
- [External Services](#external-services)
- [Project Structure](#project-structure)
- [Testing & CI](#testing--ci)
- [Limitations & Future Work](#limitations--future-work)
- [Development Notes](#development-notes)
- [Acknowledgements & License](#acknowledgements--license)

---

## Overview

This repository contains a Flutter web application that reproduces the visual layout and interactions of the UPSU online shop (https://shop.upsu.net/) as an educational prototype. It is not a production e-commerce system — it is a demonstration for learning responsive UI, component structure, and basic app flows.

---

## Purpose & Scope

Purpose:
- Learn and demonstrate responsive design, component-based architecture, UX patterns, state management, and automated testing/CI.

Scope (implemented from the public site visuals and flows):
- Homepage with hero/promo banner
- Collections and collection pages with product grids
- Product pages with image gallery, description, sizes/colors, and add-to-cart UI
- Sale collection and sale badges
- Cart UI (mocked / persisted via demo service)
- Print Shack personalisation UI (character limits, pricing tiers)
- Navigation (desktop & mobile), search UI, account and auth screens (Firebase UI integrated)
- Footer with opening hours, help links and subscription form

Important: This is a demo/prototype only — no real payment processing, no live production backend unless you configure Firebase.

---

## Key Features Implemented

- Responsive navigation (desktop + mobile hamburger)
- Product grid with adaptive columns
- Product detail pages, image fallbacks and truncation for long text
- Sort and filter UI on collection pages
- Cart functionality (add/remove/update) and mock persistence
- Print Shack customisation form (one/two line pricing)
- Authentication UI using Firebase Auth (email/password & Google)
- Search delegate (client-side)
- Tests covering data, models, widgets and pages
- CI via GitHub Actions running tests and static analysis

---

## Installation & Local Development

Prerequisites:
- Flutter SDK (3.0.0+ recommended)
- Git
- Chrome (for web run)

Quick start:
```bash
git clone https://github.com/MattCodez21/union_shop.git
cd union_shop
flutter pub get
flutter run -d chrome
```

Run tests:
```bash
# run all tests
flutter test

# run tests with coverage
flutter test --coverage

# run a single test file
flutter test test/widget_tests/navbar_test.dart
```

Notes:
- Firebase configuration files are not included. To enable Firebase features, add your own configuration (e.g. `firebase_options.dart`) and credentials.

---

## Design & UX Considerations

- Approach: Mobile-first responsive layouts using `LayoutBuilder` and `MediaQuery`.
- Breakpoints: mobile < 600px, desktop >= 600px (adjustable).
- Accessibility: semantic widget choices, readable contrast, focusable controls, image fallbacks and alt semantics via error builders.
- Branding: UPSU purple used (`#4d2963`) and light accent backgrounds approximating the original site.
- Usability: snackbars for actions, compact form controls on mobile, truncated text with ellipses to prevent overflow.

---

## External Services

- Firebase Authentication — optional (email/password, Google Sign-In).
- Cloud Firestore — optional demo persistence for cart/orders.
- These integrations require user-supplied Firebase configuration. All Firebase configs are ignored in the repo.

---

## Project Structure

```
lib/
├─ main.dart
├─ data/
│  ├─ products_data.dart
│  └─ collections_data.dart
├─ models/
│  ├─ product.dart
│  ├─ cart_item.dart
│  ├─ collection.dart
│  └─ order.dart
├─ pages/
│  ├─ home_page.dart
│  ├─ collection_page.dart
│  ├─ product_page.dart
│  ├─ sale_page.dart
│  ├─ print_shack_page.dart
│  ├─ print_shack_about_page.dart
│  └─ ...
├─ services/
│  ├─ cart_service.dart
│  └─ order_service.dart
└─ widgets/
   ├─ navbar.dart
   ├─ header.dart
   ├─ footer.dart
   └─ cart_item_card.dart

test/
assets/images/
pubspec.yaml
README.md
```

---

## Testing & CI

- Tests: unit tests for models/services, widget tests for key UI components, page tests for major flows.
- CI: GitHub Actions pipeline runs `flutter test`, `flutter analyze`, and publishes test badges/coverage on each push/PR.
- The CI badge at the top links to the workflow results.

---

## Limitations & Future Improvements

Limitations:
- No live payment gateway (checkout is simulated).
- Product data is static (local data files) unless you integrate a backend.
- No admin CMS — product edits require code changes.
- Search & filtering are client-side only.

Planned/Recommended improvements:
- Connect a backend (REST/GraphQL) or CMS for dynamic products
- Integrate Stripe/PayPal for payments (if converting to production)
- Add server-side search, pagination, and inventory tracking
- Improve accessibility audits and semantic labeling
- Add end-to-end tests and visual regression testing

---

## Development Notes

- Follow conventional commits (`feat:`, `fix:`, `docs:`, `test:`).
- Format with `flutter format` and run `flutter analyze` before committing.
- CI requires tests to pass; coverage threshold enforced in pipeline.

---

## Acknowledgements & License

Original design and inspiration: University of Portsmouth Students’ Union — https://shop.upsu.net/.

This repository is a student coursework submission. All rights reserved for academic submission.

Author: Matthew Wards — up2213766  
Submission date: 05/12/2025  
Repository: https://github.com/MattCodez21/union_shop