<p align="center">
  <img width="100%" alt="food-Delivery" src="https://github.com/user-attachments/assets/2d1d6da9-ea56-493b-8e8c-d4a6eb1242ea" />
</p>


<h1 align="center"> Food Delivery  — توصيل الطعام </h1>
<h3 align="center">Modern Multi-Role Food Ordering & Delivery Platform</h3>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-3.x-blue?logo=flutter"/>
  <img src="https://img.shields.io/badge/Firebase-Backend-orange?logo=firebase"/>
  <img src="https://img.shields.io/badge/BLoC%20%2F%20Cubit-State%20Management-purple"/>
  <img src="https://img.shields.io/badge/Platform-Android%20%7C%20iOS-lightgrey"/>
  <img src="https://img.shields.io/badge/Architecture-MVVM-orange"/>
</p>

---

## About

**Food Delivery (توصيل الطعام)** is a premium, comprehensive food ordering and restaurant management mobile application built with Flutter. It connects food lovers with local chefs and restaurants, offering a seamless and beautiful multi-role ordering and dashboard experience.

> "Your Favorite Dishes, Delivered Fresh."

The app features a dual-role dynamic interface: **User Interfaces (40+ screens)** for onboarding, finding dishes, managing cards, and tracking orders, and **Chef Interfaces (10+ screens)** for dashboard sales analytics, managing menus, and fulfilling client requests.

---

## Features

### 👤 User (Client)
- Browse restaurants, menus, and food categories (Burgers, Pizza, Dessert, etc.)
- View meal details, ingredients, calorie info, and ratings
- Add items to cart with dynamic quantities and options
- Live order tracking with interactive Google Maps integration
- Saved favorites and ratings/reviews for recipes
- Secure multi-address and card management (Visa, MasterCard, PayPal, Cash)
- Beautiful floating Bottom Navigation Bar with tap scale animations
- Bilingual support (Arabic 🇪🇬 / English 🇬🇧)

### 👨‍🍳 Chef (Restaurant Owner)
- Manage restaurant menu and dishes (Add/Edit/Delete food items)
- View active and pending orders with real-time updates
- Track sales and analytics on the chef dashboard
- Share cooking notes and updates with customers
- Manage profile, payment history, and reviews

### 🔐 Auth
- Role-based registration and onboarding (User / Chef)
- Verification code verification (OTP via Pinput)
- Secure Firebase Authentication (Email/Password, Google Sign-In, Facebook Sign-In)
- Secure forgot-password email reset flow

---

## Tech Stack

| Layer | Technology |
|---|---|
| Frontend | Flutter (Dart) |
| Backend | Firebase (Auth + Firestore) |
| State Management | BLoC & Cubit |
| Local Storage | SharedPreferences |
| Animations | Animate Do & Flutter Animate |
| Network Client | Dio |
| Maps | Google Maps Flutter & Geolocator |
| Architecture | Feature-based MVVM |

---

## Project Structure

```
lib/
├── firebase_options.dart              # Firebase configuration
├── main.dart                          # App entry point
├── core/                              # Shared utilities & config
│   ├── common/
│   ├── constants/
│   ├── data/
│   ├── dialogs/
│   ├── model/
│   ├── routes/
│   ├── storage_helper/
│   └── utils/
│
└── features/                          # Feature modules (MVVM + Cubit)
    ├── app_section/                   # Main layout & floating Bottom Navigation Bar
    ├── auth/                          # Login, register, verification & password reset
    ├── cart/                          # Cart items & checkout management
    ├── category_meals/                # Meal lists by food category
    ├── favorite/                      # Favorite items list
    ├── food_burgers/                  # Burgers feature views
    ├── food_details/                  # Detailed food items view
    ├── home/                          # Custom app bar, search bar, categories & recipes
    ├── meal_details/                  # Recipe detail view, rating, ingredients & cart add
    ├── my_orders/                     # Active, ongoing, and past order history
    ├── onboarding/                    # Premium onboarding walkthrough screens
    ├── payment/                       # Payment options, card adding, success transitions
    ├── profile/                       # Edit profile, personal info, address management
    ├── restaurant_view/               # Restaurant details and menu views
    ├── splash/                        # App splash loader screen
    └── tracking_order/                # Live map delivery tracking and progress
```

---

## Database Schema (Firestore Collections)

| Collection | Description |
|---|---|
| `Users` | User profiles containing roles (User / Chef), email, personal details, addresses, and timestamps |
| `restaurants` | Restaurant data, menu items, rating reviews, and owner reference |
| `meals` | Food recipes/dishes, ingredients list, price, calories, ratings, and category type |
| `orders` | Placed orders containing client/chef IDs, ordered meals, payment details, order status, and tracking coordinates |
| `carts` | Cart state for users with quantities, specific restaurant IDs, and total price |

---

## Getting Started

### Prerequisites
- Flutter SDK 3.x
- Dart SDK
- Android Studio or VS Code
- Firebase Project setup

### Installation

```bash
git clone https://github.com/MARCO-Develper/Food.git
cd food
flutter pub get
flutter run
```

---

## Developer

| Name | Role | Contact |
|---|---|---|
| **Marco Mina** | Flutter Developer | [GitHub](https://github.com/MARCO-Develper) \| [LinkedIn](https://www.linkedin.com/in/marco-mina-515369262) |

---

<p align="center">Made with ❤️ by Marco Mina — 2026</p>
