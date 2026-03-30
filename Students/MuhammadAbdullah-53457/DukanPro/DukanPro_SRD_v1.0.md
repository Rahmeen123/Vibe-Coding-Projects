# DukanPro / دکان پرو — Software Requirements Document

**Version:** 1.0.0-DRAFT  
**Date:** March 17, 2026  
**Author:** [Project Lead — TBD]  
**Status:** Draft — Awaiting Stakeholder Review  
**Document Type:** Software Requirements Document (SRD)  
**Classification:** Confidential — Internal Use Only

---

## Table of Contents

1. Executive Summary & Goals
2. Target Audience & User Personas
3. MVP Features (v1.0 Scope)
4. Functional Requirements
5. Non-Functional Requirements
6. Tech Stack & Architecture
7. API Endpoints
8. UI/UX Wireframe Descriptions
9. Data Models & Database Schema
10. Milestones & Timeline
11. Risks & Mitigations
12. Glossary

---

## 1. Executive Summary & Goals

### 1.1 Brand Name

**English:** DukanPro  
**Urdu:** دکان پرو  
**Tagline (English):** "Your Shop, Smarter."  
**Tagline (Urdu):** "آپ کی دکان، ذہین طریقے سے"

The brand communicates simplicity, trust, and professionalism — qualities that resonate with Pakistani small business owners who want modern tools without complexity.

### 1.2 Problem Statement

Millions of small and medium retail shop owners across Pakistan (kiryana stores, general stores, electronics shops, cloth merchants, medical stores) continue to manage their business operations using manual paper registers, mental calculations, and informal credit (udhar) notes. This leads to:

- Revenue leakage from untracked sales and uncollected credit
- Inability to generate accurate daily/monthly profit reports
- No inventory visibility — overstocking or running out of key items
- No audit trail for cash or digital payments
- Complete data loss risk (fire, theft, damage to paper records)
- No scalability — cannot support multiple employees or a second branch

Existing POS solutions in Pakistan are either too expensive, require constant internet connectivity, are in English only, or are too complex for a shop owner with basic smartphone literacy.

### 1.3 Vision

DukanPro will be the most trusted, offline-first, bilingual (Urdu/English) POS and business management platform for Pakistani retail shop owners. It will run reliably on low-cost Windows computers, support Pakistani payment methods natively, and be simple enough for a shop owner who has never used software before.

### 1.4 Success Metrics

| Metric | Target (End of Year 1) |
|--------|------------------------|
| Registered Users | 5,000 |
| Paid License Conversions | 35% of trial users |
| Daily Active Users | 60% of registered base |
| Average Session Duration | 45+ minutes/day |
| Offline Usage Rate | 70%+ sessions fully offline |
| NPS Score | 50+ |
| Churn Rate (monthly) | Less than 5% |
| Sync Failure Rate | Less than 0.5% |

---

## 2. Target Audience & User Personas

### Persona 1: Rashid, the Kiryana Shop Owner

**Age:** 42 | **Location:** Lahore, Punjab | **Education:** Matric (Grade 10)  
**Tech Literacy:** Uses WhatsApp and basic smartphone features. Has a Windows laptop at home.  
**Shop Type:** Neighborhood grocery store (kiryana). 80–150 daily customers. One employee (his teenage son).  
**Current Method:** Paper khata (ledger) for udhar, mental math for daily totals.  
**Pain Points:** Loses 5,000–15,000 PKR monthly to uncollected udhar. Cannot tell if he is profitable. Runs out of stock without warning.  
**Goals:** Track udhar, see daily profit, get low-stock alerts.  
**Language Preference:** Urdu  
**Device:** Windows 10 laptop, Android phone  
**Willingness to Pay:** 500–1,000 PKR/month if the software saves him more than that.

### Persona 2: Sana, the Electronics Shop Manager

**Age:** 28 | **Location:** Karachi, Sindh | **Education:** Bachelor's in Commerce  
**Tech Literacy:** Comfortable with Excel and web apps. Manages 2 employees.  
**Shop Type:** Mid-size electronics and accessories shop. 40–80 daily customers. Higher-value transactions.  
**Current Method:** Excel sheets for inventory, manual receipts on paper.  
**Pain Points:** No barcode scanning — manual entry takes too long. Cannot generate professional receipts. No analytics on best-selling products.  
**Goals:** Barcode scanning, professional printed receipts, monthly sales reports.  
**Language Preference:** English  
**Device:** Windows 11 desktop, iPhone  
**Willingness to Pay:** Up to 2,500 PKR/month for a reliable, professional solution.

### Persona 3: Bilal, the Multi-Branch General Store Owner

**Age:** 52 | **Location:** Faisalabad, Punjab | **Education:** Intermediate (Grade 12)  
**Tech Literacy:** Uses Facebook and mobile banking. Has a trusted manager who handles records.  
**Shop Type:** Two general stores. Employs 4–6 staff total. High-volume daily transactions.  
**Current Method:** Trusts his manager's daily report. No centralized system.  
**Pain Points:** Cannot verify his manager's records remotely. Inventory goes missing. Different payment methods (cash, Easypaisa, JazzCash) are tracked separately in different places.  
**Goals:** Real-time visibility into both shops, role-based access (owner vs manager), consolidated reporting.  
**Language Preference:** Urdu + English mix (Roman Urdu acceptable)  
**Device:** Windows 10 desktop (at each shop), Android phone  
**Willingness to Pay:** 3,000–5,000 PKR/month for a multi-branch solution.

---

## 3. MVP Features (v1.0 Scope)

### In Scope — v1.0 (MVP)

| # | Feature | Priority |
|---|---------|----------|
| 1 | User Registration & Device Fingerprinting (requires internet once) | Critical |
| 2 | License Key Activation & 14-day Trial | Critical |
| 3 | Offline-First Operation with Cloud Sync | Critical |
| 4 | POS / Sales Screen with Barcode Scanner Support | Critical |
| 5 | Manual Product Entry (without barcode) | Critical |
| 6 | Cash & Digital Payment Recording (Easypaisa, JazzCash, Bank, Cash) | Critical |
| 7 | Receipt Generation (on-screen + print) | Critical |
| 8 | Basic Inventory Management (add/edit/delete products) | Critical |
| 9 | Low Stock Alerts | High |
| 10 | Daily Sales Summary Report | High |
| 11 | Urdu / English UI Language Switcher | High |
| 12 | Admin SaaS Dashboard (user & license management) | High |
| 13 | Basic Reporting (daily, weekly, monthly) | High |
| 14 | Camera-based Receipt Scanning (via mobile companion app) | Medium |

### Out of Scope — Future Versions

| Feature | Target Version |
|---------|---------------|
| Multi-branch support | v1.5 |
| Udhar (Credit) Ledger / Khata | v1.5 |
| Customer loyalty program | v2.0 |
| Employee payroll management | v2.0 |
| WhatsApp receipt sharing | v1.5 |
| Full mobile app (iOS + Android POS) | v2.0 |
| Tax/FBR invoicing compliance | v2.0 |
| Supplier management & purchase orders | v2.0 |
| E-commerce integration | v3.0 |

---

## 4. Functional Requirements

### 4.1 User Registration & Onboarding

#### 4.1.1 First Launch Behavior

- On first launch, the app MUST detect internet connectivity.
- If no internet is detected, the app displays a full-screen message: "Please connect to the internet to activate DukanPro for the first time. / پہلی بار ڈاؤن لوڈ کرنے کے لیے انٹرنیٹ کنیکشن ضروری ہے۔"
- The app must NOT allow any functionality until registration is complete.
- Internet check must be performed against the DukanPro backend endpoint (not just DNS check).

#### 4.1.2 Registration Form Fields

| Field | Type | Validation | Required |
|-------|------|-----------|---------|
| Full Name | Text | 3–60 characters, letters + spaces only | Yes |
| Mobile Number | Text | Pakistani format: 03XX-XXXXXXX or 03XXXXXXXXX, 11 digits | Yes |
| Shop Name | Text | 2–80 characters | Yes |
| City | Dropdown | Predefined list of 100+ Pakistani cities | Yes |
| Shop Type | Dropdown | Kiryana, Electronics, Cloth, Medical, General, Other | Yes |
| Email Address | Email | Valid email format, optional but recommended | No |
| Password | Password | Minimum 6 characters; no complexity requirement for low-literacy users | Yes |
| Confirm Password | Password | Must match Password field | Yes |

#### 4.1.3 OTP Verification

- After form submission, an OTP (6-digit numeric) is sent via SMS to the registered mobile number.
- OTP expires in 5 minutes.
- User has 3 attempts before a 30-minute cooldown is triggered.
- OTP screen shows countdown timer.
- Resend OTP button appears after 60 seconds.
- SMS provider: Jazz/Telenor SMS gateway or Twilio fallback.

#### 4.1.4 Device Fingerprinting

- On successful registration, the backend generates a device fingerprint hash from: MAC address + CPU ID + Windows Product ID + install path hash.
- Fingerprint is stored server-side against the user account.
- License is tied to this fingerprint. Max 2 simultaneous device activations per license.
- If the user installs on a 3rd device, they must deactivate one existing device via the app settings or admin dashboard.

#### 4.1.5 Post-Registration

- On successful OTP verification, a Welcome screen is shown with the shop name.
- A 14-day trial is automatically activated.
- App downloads initial data (city list, product categories, etc.) and stores locally in SQLite.
- User is taken to the Main Dashboard.

### 4.2 License Key Activation & Trial Period

#### 4.2.1 Trial Period Rules

- Duration: 14 calendar days from registration date.
- Trial is fully functional — no feature restrictions during trial.
- Trial countdown is displayed in the app header: "Trial: X days remaining / ٹرائل: X دن باقی"
- On day 10, 12, and 13: in-app notifications remind user to purchase a license.
- On day 14 (expiry): app enters Restricted Mode (see 4.2.4).

#### 4.2.2 License Key Format

- Format: XXXX-XXXX-XXXX-XXXX (16 alphanumeric characters, uppercase, grouped in 4s)
- Keys are generated server-side and are unique per user account + device fingerprint.
- Keys are single-use and invalidate after first activation.
- License types: Monthly, 6-Month, Annual.

#### 4.2.3 License Activation Flow

1. User clicks "Activate License" button.
2. User enters their license key in the input field.
3. App sends key + device fingerprint to backend for validation.
4. Backend responds with: success + expiry date, or error (invalid key, already used, wrong device).
5. On success: app unlocks fully, displays "Licensed until [date]."
6. Activation requires internet. If offline, user sees message: "Please connect to internet to activate license."

#### 4.2.4 Restricted Mode (Post-Trial / Post-Expiry)

- User can VIEW existing data (read-only).
- User CANNOT: add new sales, add/edit products, generate reports, use camera scanner.
- A full-screen overlay appears on any restricted action, prompting license purchase.
- Restricted Mode does NOT delete any data.
- Admin can grant 3-day grace period extensions from the SaaS dashboard.

#### 4.2.5 Anti-Piracy Rules

- License key is encrypted using AES-256 before storage on device.
- Device fingerprint is validated on every app startup (requires internet once per 7 days for license re-validation ping).
- If the license ping fails for more than 7 days (no internet), app enters a soft warning mode (still functional, shows warning banner).
- If license ping fails for more than 30 days, app enters Restricted Mode until re-validated.
- Any attempt to modify the local license database triggers a tamper detection flag and requires fresh activation.
- The app binary is code-signed using a valid code signing certificate.

### 4.3 Offline-First Operation & Sync

#### 4.3.1 Offline Capability

- After initial registration, ALL core functions work without internet.
- Local SQLite database is the source of truth while offline.
- App detects connectivity state on startup and every 60 seconds.
- Status indicator in app header shows: Online (green dot) / Offline (orange dot).

#### 4.3.2 Data That Syncs to Cloud

| Data Type | Sync Direction | Priority |
|-----------|---------------|---------|
| Sales transactions | Device → Cloud | Critical |
| Inventory changes | Device → Cloud | Critical |
| Product catalog | Bidirectional | High |
| Payment records | Device → Cloud | Critical |
| User settings | Bidirectional | Medium |
| Reports cache | Device → Cloud | Low |
| License status | Cloud → Device | Critical |

#### 4.3.3 Sync Frequency

- When online: sync runs every 5 minutes in the background.
- On app startup: immediate sync attempt.
- On app close: final sync attempt.
- User can manually trigger sync from Settings > Sync Now.

#### 4.3.4 Conflict Resolution Rules

| Scenario | Resolution |
|----------|-----------|
| Same product edited on device and cloud simultaneously | Last-write-wins based on timestamp |
| Sale recorded offline, same sale ID conflict on cloud | Device transaction wins; cloud duplicate is flagged for admin review |
| Product deleted on cloud while device has pending sale | Sale is preserved; product marked as [Deleted] in transaction history |
| Inventory quantity conflict | Sum both changes (additive merge) |
| License status conflict | Cloud record always wins |

#### 4.3.5 Sync Failure Handling

- If sync fails, all local changes are queued in a SyncQueue table with timestamp and retry count.
- Retry with exponential backoff: 1 min, 5 min, 15 min, 30 min.
- Maximum retry: 48 hours. After that, user is notified and data is flagged for manual review.
- Sync errors are logged to a local error log accessible from Settings > Diagnostics.

### 4.4 POS / Sales Screen

#### 4.4.1 Screen Layout

The POS screen is the primary screen. It has three panels:
- Left Panel: Product search / barcode input
- Center Panel: Cart (current transaction items)
- Right Panel: Payment & checkout

#### 4.4.2 Adding Products to Cart

**Method 1 — Barcode Scanner:**
- Focus is auto-set to the barcode input field on screen load.
- User scans a barcode; the app looks up the product in local DB.
- If found: product is added to cart with quantity 1. Price is auto-filled.
- If not found: dialog prompts "Product not found. Add new product?" with Yes/No options.
- Scanning same barcode again increments quantity by 1.

**Method 2 — Manual Search:**
- Search field supports: product name (partial match, minimum 2 characters), barcode number, or product code.
- Results appear in real-time dropdown (max 10 results shown).
- User clicks a result to add to cart.

**Method 3 — Category Browse:**
- User can browse by category tab (Grocery, Electronics, etc.) and click products.

#### 4.4.3 Cart Rules

| Rule | Detail |
|------|--------|
| Maximum items per cart | 200 line items |
| Quantity editing | Tap quantity field to edit; must be >= 1 and <= available stock |
| Price override | Manager/Owner role can override price; requires PIN confirmation |
| Discount | Percentage or flat amount; applied per item or per cart total |
| Cart hold | User can hold current cart and start a new one (max 5 held carts) |
| Delete item | Swipe left or click X; requires confirmation if item qty > 5 |

#### 4.4.4 Payment Processing

**Supported Payment Methods:**
- Cash
- Easypaisa
- JazzCash
- Bank Transfer (manual reference entry)
- Split Payment (e.g., part cash + part Easypaisa)

**Payment Flow:**
1. User clicks "Checkout / ادائیگی".
2. Total amount is displayed prominently in large font.
3. User selects payment method.
4. For Cash: user enters amount received → app shows change due.
5. For Easypaisa/JazzCash: user enters transaction ID (optional but encouraged).
6. For Bank Transfer: user enters bank reference number.
7. For Split: user allocates amounts across methods; must sum to total.
8. User confirms payment.
9. Sale is saved to local DB immediately.
10. Receipt screen appears.

#### 4.4.5 Receipt Generation

- Receipt displays: shop name, shop address (from settings), date/time, sale ID, itemized list, subtotal, discount, total, payment method, amount paid, change due.
- Receipt available in two sizes: 58mm thermal (for receipt printers) and A4.
- User can: Print (if printer connected), Save as PDF, or skip.
- Receipt is also stored in transaction history indefinitely.
- If Urdu mode is active, receipt headers are in Urdu; product names remain in the language they were entered.

#### 4.4.6 Edge Cases

| Scenario | Handling |
|----------|---------|
| Barcode scanner disconnects mid-transaction | Cart is preserved; manual input fallback |
| Power failure mid-transaction | On restart, app detects incomplete transaction and asks user to confirm/discard |
| Product price is 0 | Warning shown; user must confirm before adding to cart |
| Cart total is 0 PKR | Checkout is blocked with message |
| Stock goes negative | Warning shown; user can override with confirmation (managers only) |
| Duplicate sale ID on sync | Server assigns new ID; original device ID stored as reference |

### 4.5 Inventory & Stock Management

#### 4.5.1 Product Fields

| Field | Type | Validation | Required |
|-------|------|-----------|---------|
| Product Name | Text | 2–120 chars | Yes |
| Barcode / SKU | Text | Unique; auto-generated if not scanned | No |
| Category | Dropdown | Predefined + custom | Yes |
| Purchase Price | Decimal | >= 0; max 9,999,999 PKR | Yes |
| Selling Price | Decimal | >= 0; must be >= purchase price (warning if not) | Yes |
| Current Stock | Integer | >= 0 | Yes |
| Low Stock Threshold | Integer | >= 1; default: 5 | Yes |
| Unit of Measure | Dropdown | Piece, Kg, Gram, Liter, Dozen, Box, Packet | Yes |
| Supplier Name | Text | Optional; 2–80 chars | No |
| Product Image | Image | JPG/PNG; max 2MB; optional | No |
| Expiry Date | Date | Optional; must be future date | No |
| Notes | Text | Optional; max 500 chars | No |

#### 4.5.2 Stock Management Operations

- **Add Stock:** Increase quantity with optional purchase price update and supplier note.
- **Remove Stock:** Decrease quantity with reason (Sold, Damaged, Expired, Adjustment).
- **Stock Audit:** Full count mode — user enters current physical count; system calculates variance.
- **Bulk Import:** CSV import supported (template downloadable from settings).
- **Barcode Generation:** App can generate and print barcode labels for products without a barcode.

#### 4.5.3 Low Stock Alerts

- Alerts appear in the Notification Center (bell icon in header).
- Alert fires when stock falls at or below the Low Stock Threshold.
- Alerts are also shown as a badge count on the Inventory menu item.
- User can configure alert delivery: in-app only, or in-app + Windows notification.

### 4.6 Receipt & Invoice Scanning via Camera

#### 4.6.1 Mobile Camera Bridge

The desktop app connects to a user's smartphone camera for scanning purposes (receipt images, product barcodes on physical invoices).

**Connection Method — Local Network QR:**
1. On the desktop app, user navigates to Settings > Camera > Connect Phone.
2. Desktop app generates a temporary QR code (contains local IP + port + session token).
3. User opens the DukanPro Companion App (or mobile browser URL) on their smartphone.
4. User scans the QR code with their phone's native camera.
5. A peer-to-peer WebSocket connection is established over the local WiFi network.
6. The phone's camera feed streams to the desktop app in real-time.
7. Session expires after 30 minutes of inactivity or when desktop app is closed.

**Fallback — USB/Hotspot:**
- If no shared WiFi, user can enable mobile hotspot and connect desktop to it.
- Same QR-based flow applies.

#### 4.6.2 Receipt / Invoice Scanning Flow

1. Live camera view is shown on desktop.
2. User positions the receipt/invoice in the camera frame.
3. App captures image on user click or auto-captures on stable image detection.
4. Image is processed using OCR (Tesseract + custom model for Urdu/English).
5. Extracted fields: vendor name, date, items, amounts.
6. Extracted data is shown in an editable review form.
7. User confirms or corrects the data.
8. Confirmed data is saved as an expense record or purchase invoice.

### 4.7 Cash & Digital Payment Tracking

#### 4.7.1 Daily Cash Register

- A virtual cash register tracks the opening balance, all cash inflows (sales), outflows (expenses, refunds), and closing balance.
- Opening balance is entered by the user each morning.
- Closing balance is auto-calculated but user can confirm with a physical count.
- Variance (if any) is logged with a note.

#### 4.7.2 Digital Payment Reconciliation

- All Easypaisa/JazzCash/Bank transactions recorded at POS are listed in the Digital Payments section.
- User can mark each as "Reconciled" after verifying against their mobile wallet/bank statement.
- Unreconciled transactions are highlighted in orange.
- Daily digital payment total is shown separately from cash total.

#### 4.7.3 Expense Recording

- User can record business expenses (not sales): rent, electricity, supplier payments, etc.
- Expense fields: date, category, amount, payment method, description, receipt (optional image).
- Expenses are deducted from profit calculations in reports.

### 4.8 Reporting & Analytics Dashboard

#### 4.8.1 Available Reports

| Report | Frequency Options | Key Metrics |
|--------|------------------|-------------|
| Sales Summary | Daily, Weekly, Monthly, Custom range | Total sales, number of transactions, average sale value |
| Profit & Loss | Daily, Weekly, Monthly | Revenue, cost of goods, gross profit, expenses, net profit |
| Top Products | Weekly, Monthly | Best-selling by quantity and by revenue |
| Payment Method Breakdown | Daily, Monthly | Cash vs Easypaisa vs JazzCash vs Bank split |
| Inventory Valuation | On-demand | Total stock value at purchase price and selling price |
| Low Stock Report | On-demand | All products at or below threshold |
| Sales by Category | Monthly | Revenue breakdown by product category |

#### 4.8.2 Report Display

- All reports include charts (bar, line, pie) where appropriate.
- Charts are rendered using a .NET charting library (LiveCharts2).
- Reports can be exported as: PDF, Excel (.xlsx), or printed directly.
- Reports are generated from local SQLite data (no internet required).

#### 4.8.3 Dashboard Overview (Home Screen)

The main dashboard always shows:
- Today's total sales (PKR)
- Today's number of transactions
- Today's net profit estimate
- Low stock alerts count
- Last sync time
- Quick-action buttons: New Sale, Add Product, View Reports, Sync Now

### 4.9 Urdu / English UI Language Switcher

#### 4.9.1 Language Toggle

- Language switch button is always visible in the top navigation bar.
- Toggle between English and اردو.
- Switch applies immediately with no app restart required.
- Language preference is saved to local settings and synced to cloud.

#### 4.9.2 RTL Support

- When Urdu is selected, the entire UI flips to Right-to-Left layout.
- WPF FlowDirection property is set to RightToLeft on the root window.
- All margins, paddings, and icon positions are mirrored.
- Urdu font: Noto Nastaliq Urdu or Jameel Noori Nastaleeq.
- Font size increases by 1.2x multiplier for Urdu text (Nastaliq requires more space).

#### 4.9.3 Fallback Behavior

- If a string translation is missing in Urdu, the English string is displayed (no blank fields).
- Product names, custom category names, and user-entered data remain in the language they were entered — they are NOT auto-translated.
- Number formatting in Urdu mode: uses Arabic-Indic numerals (٠١٢٣...) — configurable in settings.

### 4.10 Admin SaaS Dashboard

#### 4.10.1 Access

- Web-based dashboard at admin.dukanpro.pk
- Accessible only to DukanPro internal staff (super-admin) and assigned regional agents.
- Authentication: email + password + TOTP 2FA.

#### 4.10.2 Features

**User Management:**
- Search and view all registered users.
- View user details: name, shop, city, device fingerprint, registration date, last active.
- Manually activate, deactivate, or extend a user's trial.
- Reset user password (sends reset link via SMS).
- Block/unblock a user account.
- View all licenses tied to a user.

**License Management:**
- Generate single or bulk license keys (specify type: monthly/6-month/annual).
- View license status: active, expired, revoked, unused.
- Revoke a license (immediately locks the associated device).
- Transfer a license to a different device.
- View license revenue summary.

**Analytics:**
- Total registered users, active users (last 7/30 days), trial users, paid users.
- Conversion rate (trial to paid).
- Geographic distribution by city.
- Sync activity monitoring (which users have not synced in 7+ days).

---

## 5. Non-Functional Requirements

### 5.1 Performance

| Requirement | Target |
|-------------|--------|
| App startup time (cold) | Less than 4 seconds on low-end hardware |
| POS screen load time | Less than 1 second |
| Product search response | Less than 300ms for 10,000 products |
| Barcode lookup | Less than 200ms |
| Report generation (monthly) | Less than 5 seconds for 10,000 transactions |
| Sync operation (background) | Does not block UI; runs on background thread |
| Receipt print time | Less than 2 seconds after confirmation |

**Minimum Hardware Target:**
- CPU: Intel Core i3 or equivalent (4th gen+)
- RAM: 4GB
- Storage: 500MB free disk space
- OS: Windows 10 (64-bit) or later

### 5.2 Security

- All API communication uses HTTPS with TLS 1.2 minimum.
- Local SQLite database is encrypted using SQLCipher with a device-unique key.
- License key stored using AES-256 encryption in the Windows Credential Store.
- Sensitive fields (passwords, API tokens) are never stored in plain text.
- API authentication uses JWT tokens with 24-hour expiry and refresh token rotation.
- Admin dashboard enforces TOTP 2FA for all accounts.
- All user data is stored in Pakistan/UAE region cloud servers for latency and legal compliance.

### 5.3 Scalability

- Backend designed for 50,000 concurrent registered devices.
- Database uses PostgreSQL with read replicas for reporting queries.
- API is stateless and horizontally scalable behind a load balancer.
- Cloud storage for receipts and images uses an S3-compatible object store.

### 5.4 Accessibility

- All interactive elements have keyboard shortcuts documented in the Help section.
- Font sizes are configurable (Small, Medium, Large) from Settings.
- High-contrast mode available for users with visual impairment.
- All icons include text labels (no icon-only buttons) — critical for low-literacy users.
- Error messages are written in plain language (no technical jargon) in both Urdu and English.

### 5.5 Offline Resilience

- App maintains full functionality for 30 days without internet (except license validation ping).
- Local database has WAL (Write-Ahead Logging) mode enabled to prevent corruption on sudden power loss.
- App performs automatic local backup of SQLite DB every 24 hours, retaining last 7 backups.
- Backup files stored at: C:\Users\[User]\AppData\Local\DukanPro\Backups\

---

## 6. Tech Stack & Architecture

### 6.1 Technology Decisions

| Layer | Technology | Rationale |
|-------|-----------|-----------|
| Desktop UI | C# / WPF (.NET 8) | Rich UI controls, RTL support, wide Windows adoption |
| Cross-platform fallback | .NET MAUI | For macOS/Linux future support |
| Local Database | SQLite (with SQLCipher) | Offline-first, zero configuration, encrypted |
| Cloud Database | PostgreSQL 15 (AWS RDS) | ACID compliance, strong ecosystem |
| Backend API | ASP.NET Core 8 Web API | Same ecosystem as desktop, performant |
| API Hosting | AWS EC2 / ECS (Docker) | Scalable, familiar |
| Cloud Storage | AWS S3 (Wasabi fallback) | Receipt images, backups |
| Auth | JWT + Refresh Tokens | Stateless, scalable |
| SMS OTP | Jazz SMS Gateway / Twilio | Pakistani network coverage |
| OCR | Tesseract 5 + custom fine-tuned model | Urdu/English receipt parsing |
| Charts | LiveCharts2 (WPF) | Native .NET charting |
| Camera Bridge | WebSocket server (built into desktop app) | P2P over LAN, no cloud relay needed |
| Admin Dashboard | ASP.NET Core Razor Pages or React | Web-based, separate deployment |
| CI/CD | GitHub Actions | Automated build, test, and deployment |

### 6.2 System Architecture Overview

```
[ Desktop App (WPF) ]
       |
       |-- Local SQLite DB (encrypted, offline data store)
       |-- Sync Service (background thread, 5-min interval)
       |-- Camera Bridge WebSocket Server (local LAN)
       |
       v
[ DukanPro Backend API (ASP.NET Core on AWS) ]
       |
       |-- PostgreSQL (primary data store)
       |-- Redis (cache: license validation, session tokens)
       |-- S3 (receipt images, CSV exports)
       |-- SMS Gateway (OTP delivery)
       |
[ Admin SaaS Dashboard (Web) ]
       |
       |-- Reads/writes via Internal Admin API
```

### 6.3 Sync Architecture Detail

- Desktop app uses a **SyncQueue** table in SQLite.
- Every data-modifying operation inserts a record into SyncQueue with: table_name, record_id, operation (INSERT/UPDATE/DELETE), payload (JSON), created_at, synced_at, retry_count.
- Background SyncService processes the queue and sends batched HTTP POST requests to /api/sync/push.
- Backend processes each item, resolves conflicts, and returns a sync receipt.
- Desktop marks items as synced and updates local records with server-assigned IDs where applicable.

---

## 7. API Endpoints

### 7.1 Authentication

| Method | Endpoint | Description | Auth Required |
|--------|----------|-------------|--------------|
| POST | /api/auth/register | New user registration | No |
| POST | /api/auth/verify-otp | OTP verification | No |
| POST | /api/auth/login | User login (returns JWT) | No |
| POST | /api/auth/refresh | Refresh JWT token | Refresh Token |
| POST | /api/auth/logout | Invalidate session | Yes |
| POST | /api/auth/forgot-password | Send password reset SMS | No |
| POST | /api/auth/reset-password | Reset password with token | No |

**POST /api/auth/register — Request:**
```json
{
  "fullName": "Rashid Ahmed",
  "mobileNumber": "03001234567",
  "shopName": "Ahmed Kiryana Store",
  "city": "Lahore",
  "shopType": "Kiryana",
  "email": "rashid@example.com",
  "password": "mypassword",
  "deviceFingerprint": "abc123hashvalue"
}
```

**POST /api/auth/register — Response (201):**
```json
{
  "success": true,
  "message": "OTP sent to 03001234567",
  "userId": "usr_abc123",
  "otpExpiry": "2026-03-17T10:05:00Z"
}
```

**Error Codes:**
| Code | Meaning |
|------|---------|
| 400 | Validation error (field details in errors array) |
| 409 | Mobile number already registered |
| 429 | Too many registration attempts |
| 500 | Server error |

### 7.2 License Management

| Method | Endpoint | Description | Auth Required |
|--------|----------|-------------|--------------|
| POST | /api/license/activate | Activate a license key | Yes |
| GET | /api/license/status | Get current license status | Yes |
| POST | /api/license/ping | Periodic license validation ping | Yes |
| POST | /api/license/deactivate | Deactivate on current device | Yes |

**POST /api/license/activate — Request:**
```json
{
  "licenseKey": "ABCD-1234-EFGH-5678",
  "deviceFingerprint": "abc123hashvalue"
}
```

**GET /api/license/status — Response (200):**
```json
{
  "status": "active",
  "type": "monthly",
  "activatedAt": "2026-03-01T00:00:00Z",
  "expiresAt": "2026-04-01T00:00:00Z",
  "daysRemaining": 15,
  "deviceCount": 1,
  "maxDevices": 2
}
```

### 7.3 Sync

| Method | Endpoint | Description | Auth Required |
|--------|----------|-------------|--------------|
| POST | /api/sync/push | Push local changes to cloud | Yes |
| GET | /api/sync/pull | Pull cloud changes to device | Yes |
| GET | /api/sync/status | Get last sync metadata | Yes |

**POST /api/sync/push — Request:**
```json
{
  "deviceId": "dev_xyz789",
  "lastSyncAt": "2026-03-17T09:00:00Z",
  "changes": [
    {
      "table": "sales",
      "operation": "INSERT",
      "recordId": "local_sale_001",
      "payload": { "total": 1500, "paymentMethod": "cash", "items": [] },
      "timestamp": "2026-03-17T09:30:00Z"
    }
  ]
}
```

### 7.4 Products / Inventory

| Method | Endpoint | Description | Auth Required |
|--------|----------|-------------|--------------|
| GET | /api/products | List all products (paginated) | Yes |
| POST | /api/products | Create new product | Yes |
| GET | /api/products/{id} | Get product by ID | Yes |
| PUT | /api/products/{id} | Update product | Yes |
| DELETE | /api/products/{id} | Soft delete product | Yes |
| GET | /api/products/barcode/{barcode} | Lookup by barcode | Yes |
| POST | /api/products/bulk-import | Bulk CSV import | Yes |
| GET | /api/products/low-stock | Get low stock items | Yes |

### 7.5 Sales

| Method | Endpoint | Description | Auth Required |
|--------|----------|-------------|--------------|
| POST | /api/sales | Create new sale | Yes |
| GET | /api/sales | List sales (paginated, filterable) | Yes |
| GET | /api/sales/{id} | Get sale detail | Yes |
| POST | /api/sales/{id}/refund | Process refund | Yes |
| GET | /api/sales/{id}/receipt | Get receipt data | Yes |

### 7.6 Reports

| Method | Endpoint | Description | Auth Required |
|--------|----------|-------------|--------------|
| GET | /api/reports/sales-summary | Sales summary report | Yes |
| GET | /api/reports/profit-loss | Profit & loss report | Yes |
| GET | /api/reports/top-products | Top products report | Yes |
| GET | /api/reports/payment-breakdown | Payment method breakdown | Yes |
| GET | /api/reports/inventory-valuation | Inventory value report | Yes |
| POST | /api/reports/export | Export report as PDF/Excel | Yes |

**All report endpoints accept query params:** `?from=2026-03-01&to=2026-03-17&format=json`

### 7.7 Admin API

| Method | Endpoint | Description | Auth Required |
|--------|----------|-------------|--------------|
| GET | /api/admin/users | List all users (paginated) | Admin |
| GET | /api/admin/users/{id} | Get user detail | Admin |
| PATCH | /api/admin/users/{id}/block | Block/unblock user | Admin |
| POST | /api/admin/licenses/generate | Generate license keys | Admin |
| GET | /api/admin/licenses | List all licenses | Admin |
| PATCH | /api/admin/licenses/{id}/revoke | Revoke a license | Admin |
| GET | /api/admin/analytics | Platform analytics | Admin |
| POST | /api/admin/users/{id}/extend-trial | Extend trial by N days | Admin |

---

## 8. UI/UX Wireframe Descriptions

### 8.1 Splash / Loading Screen

```
+------------------------------------------+
|                                          |
|           [DukanPro Logo]                |
|           دکان پرو                        |
|                                          |
|       [Loading bar animation]            |
|     "Loading your shop data..."          |
|     "آپ کی دکان کا ڈیٹا لوڈ ہو رہا ہے"   |
|                                          |
|         v1.0.0  |  Powered by DukanPro  |
+------------------------------------------+
```

### 8.2 Registration Screen

```
+------------------------------------------+
| [DukanPro Logo]              [EN | اردو] |
|                                          |
|   Welcome / خوش آمدید                    |
|   Register your shop to get started      |
|                                          |
|   Full Name / پورا نام                   |
|   [________________________]             |
|                                          |
|   Mobile Number / موبائل نمبر            |
|   [03XX-XXXXXXX           ]             |
|                                          |
|   Shop Name / دکان کا نام                |
|   [________________________]             |
|                                          |
|   City / شہر        Shop Type / دکان قسم |
|   [Dropdown v]      [Dropdown v]         |
|                                          |
|   Password / پاس ورڈ                     |
|   [________________________] [eye icon]  |
|                                          |
|   [      Register / رجسٹر کریں      ]   |
|                                          |
|   Already registered? Login / لاگ ان    |
+------------------------------------------+
```

### 8.3 OTP Verification Screen

```
+------------------------------------------+
|  [Back]                      [EN | اردو] |
|                                          |
|   Enter Verification Code                |
|   کوڈ درج کریں                            |
|                                          |
|   We sent a 6-digit code to              |
|   0300-1234567                           |
|                                          |
|   [ _ ] [ _ ] [ _ ] [ _ ] [ _ ] [ _ ]  |
|                                          |
|   Code expires in: 4:32                  |
|                                          |
|   [      Verify / تصدیق کریں       ]    |
|                                          |
|   Didn't receive? Resend in 45s          |
+------------------------------------------+
```

### 8.4 Main Dashboard (Home)

```
+------------------------------------------+
| [≡] DukanPro    [🔔 3] [Sync ✓] [EN|اردو]|
+------------------------------------------+
| [POS] [Inventory] [Reports] [Settings]   |
+------------------------------------------+
|  Good morning, Rashid!  آج کی دکان       |
|                                          |
|  ┌──────────┐  ┌──────────┐             |
|  │ Today's  │  │ Trans-   │             |
|  │ Sales    │  │ actions  │             |
|  │ ₨ 45,200 │  │   38     │             |
|  └──────────┘  └──────────┘             |
|  ┌──────────┐  ┌──────────┐             |
|  │ Net      │  │ Low Stock│             |
|  │ Profit   │  │ Alerts   │             |
|  │ ₨ 8,300  │  │   5 ⚠️   │             |
|  └──────────┘  └──────────┘             |
|                                          |
|  [+ New Sale]  [+ Add Product]           |
|  [📊 Reports]  [🔄 Sync Now]            |
|                                          |
|  Last sync: 2 minutes ago               |
+------------------------------------------+
```

### 8.5 POS / Sales Screen

```
+----------------------------------------------------------+
| [≡]  POS / فروخت          [Hold Cart] [🛒 3] [EN|اردو]  |
+----------------------------------------------------------+
| 🔍 Search or scan barcode...                             |
| [_______________________________________] [📷 Scan]      |
+------------------+--------------------+-----------------+
| CATEGORIES       |    CART            | CHECKOUT        |
|                  |                    |                 |
| [All]            | Sunsilk Shampoo    | Subtotal        |
| [Grocery]        | 2 x ₨150 = ₨300   | ₨ 1,450         |
| [Electronics]    | ──────────────     |                 |
| [Beverages]      | Lipton Tea 200g    | Discount        |
| [Other]          | 1 x ₨850 = ₨850   | [0%] [₨ 0  ]   |
|                  | ──────────────     |                 |
|                  | Coca Cola 1.5L     | TOTAL           |
|                  | 3 x ₨100 = ₨300   | ₨ 1,450         |
|                  |                    |                 |
|                  | [Clear Cart]       | [💵 Cash]       |
|                  |                    | [📱 Easypaisa]  |
|                  |                    | [📱 JazzCash]   |
|                  |                    | [🏦 Bank]       |
|                  |                    |                 |
|                  |                    | [✅ CHECKOUT]   |
+------------------+--------------------+-----------------+
```

### 8.6 Inventory Management Screen

```
+------------------------------------------+
| [≡] Inventory / انوینٹری    [+ Add] [Import]|
+------------------------------------------+
| 🔍 Search products...    [Filter▼] [Sort▼]|
+------------------------------------------+
| ⚠️ 5 products below low stock threshold   |
+------------------------------------------+
| Product        | Stock  | Price  | Action |
|----------------|--------|--------|--------|
| Sunsilk 200ml  |  45    | ₨150   | [Edit] |
| Lipton 200g    |  3 ⚠️  | ₨850   | [Edit] |
| Coca Cola 1.5L |  0 ❌  | ₨100   | [Edit] |
| Dettol 500ml   |  22    | ₨320   | [Edit] |
+------------------------------------------+
| Showing 1-20 of 248    [< Prev] [Next >]  |
+------------------------------------------+
```

### 8.7 Reports Dashboard Screen

```
+------------------------------------------+
| [≡] Reports / رپورٹس           [EN|اردو] |
+------------------------------------------+
| [Daily] [Weekly] [Monthly] [Custom Range] |
| From: [01/03/2026]  To: [17/03/2026]     |
+------------------------------------------+
|  Total Sales     |  Net Profit           |
|  ₨ 4,85,200      |  ₨ 89,300            |
|                                          |
|  [Bar Chart: Daily Sales for March]      |
|  ██░░░██████░░████████████░░             |
|                                          |
|  Payment Breakdown                       |
|  [Pie Chart: Cash 65% | Easypaisa 20%   |
|   JazzCash 10% | Bank 5%]               |
|                                          |
|  [📥 Export PDF]  [📥 Export Excel]     |
+------------------------------------------+
```

### 8.8 Settings Screen

```
+------------------------------------------+
| [≡] Settings / ترتیبات                   |
+------------------------------------------+
| ACCOUNT                                  |
|  Shop Name: Ahmed Kiryana Store      [✎] |
|  Mobile: 0300-1234567                    |
|  City: Lahore                        [✎] |
|                                          |
| LICENSE                                  |
|  Status: ✅ Active — expires 01 Apr 2026 |
|  [Enter New License Key]                 |
|  [Deactivate This Device]                |
|                                          |
| DISPLAY                                  |
|  Language: [English ▼]                  |
|  Font Size: [Medium ▼]                  |
|  Theme: [Light ▼]                       |
|                                          |
| SYNC                                     |
|  Last Sync: 5 minutes ago               |
|  [🔄 Sync Now]    [View Sync Log]        |
|                                          |
| PRINTER                                  |
|  Receipt Size: [58mm Thermal ▼]         |
|  [Test Print]                            |
|                                          |
| CAMERA                                   |
|  [📷 Connect Phone Camera]               |
|                                          |
| [🗑️ Clear Cache]  [📁 View Backups]      |
| [Diagnostics]    [About DukanPro]        |
+------------------------------------------+
```

### 8.9 Admin SaaS Dashboard (Web)

```
+----------------------------------------------------------+
| DukanPro Admin          [Super Admin ▼]  [Logout]        |
+----------------------------------------------------------+
| [Dashboard] [Users] [Licenses] [Analytics] [Settings]   |
+----------------------------------------------------------+
| PLATFORM OVERVIEW                                        |
|  ┌─────────┐ ┌─────────┐ ┌─────────┐ ┌─────────┐       |
|  │ Total   │ │ Active  │ │ Trial   │ │Conversion│      |
|  │ Users   │ │ (30d)   │ │ Users   │ │  Rate   │       |
|  │  4,821  │ │  3,104  │ │   892   │ │  34.2%  │       |
|  └─────────┘ └─────────┘ └─────────┘ └─────────┘       |
|                                                          |
| RECENT REGISTRATIONS                                     |
| Name          | City     | Date       | Status | Action  |
| Rashid Ahmed  | Lahore   | 17/03/2026 | Trial  | [View]  |
| Sana Malik    | Karachi  | 16/03/2026 | Paid   | [View]  |
|                                                          |
| [Generate License Keys]  [Export User List]              |
+----------------------------------------------------------+
```

---

## 9. Data Models & Database Schema

### 9.1 Users Table

| Field | Type | Description | Constraints |
|-------|------|-------------|-------------|
| id | UUID | Primary key | PK, NOT NULL |
| full_name | VARCHAR(60) | User's full name | NOT NULL |
| mobile_number | VARCHAR(15) | Pakistani mobile number | UNIQUE, NOT NULL |
| shop_name | VARCHAR(80) | Name of shop | NOT NULL |
| city | VARCHAR(50) | City from predefined list | NOT NULL |
| shop_type | VARCHAR(30) | Shop category | NOT NULL |
| email | VARCHAR(120) | Optional email | UNIQUE, NULL |
| password_hash | VARCHAR(256) | bcrypt hash | NOT NULL |
| language | CHAR(2) | 'en' or 'ur' | DEFAULT 'ur' |
| is_active | BOOLEAN | Account status | DEFAULT true |
| is_blocked | BOOLEAN | Admin block flag | DEFAULT false |
| created_at | TIMESTAMP | Registration time | NOT NULL |
| last_login_at | TIMESTAMP | Last login | NULL |

### 9.2 Devices Table

| Field | Type | Description | Constraints |
|-------|------|-------------|-------------|
| id | UUID | Primary key | PK |
| user_id | UUID | FK to Users | NOT NULL |
| fingerprint_hash | VARCHAR(256) | Device fingerprint | NOT NULL |
| device_name | VARCHAR(100) | Windows machine name | NULL |
| os_version | VARCHAR(50) | Windows version | NULL |
| is_active | BOOLEAN | Is device active | DEFAULT true |
| activated_at | TIMESTAMP | When device was registered | NOT NULL |
| last_seen_at | TIMESTAMP | Last license ping | NULL |

### 9.3 Licenses Table

| Field | Type | Description | Constraints |
|-------|------|-------------|-------------|
| id | UUID | Primary key | PK |
| license_key | VARCHAR(20) | XXXX-XXXX-XXXX-XXXX | UNIQUE, NOT NULL |
| user_id | UUID | FK to Users (NULL if unassigned) | NULL |
| device_id | UUID | FK to Devices | NULL |
| type | VARCHAR(20) | monthly / 6month / annual | NOT NULL |
| status | VARCHAR(20) | active/expired/revoked/unused | NOT NULL |
| trial_end_date | TIMESTAMP | Trial expiry | NULL |
| activated_at | TIMESTAMP | When key was activated | NULL |
| expires_at | TIMESTAMP | License expiry | NULL |
| created_by | UUID | Admin who generated key | NOT NULL |
| created_at | TIMESTAMP | Creation time | NOT NULL |

### 9.4 Products Table (Local + Cloud)

| Field | Type | Description | Constraints |
|-------|------|-------------|-------------|
| id | UUID | Primary key | PK |
| user_id | UUID | Owner | NOT NULL |
| name | VARCHAR(120) | Product name | NOT NULL |
| barcode | VARCHAR(50) | Barcode / SKU | UNIQUE per user |
| category | VARCHAR(50) | Product category | NOT NULL |
| purchase_price | DECIMAL(10,2) | Cost price | >= 0 |
| selling_price | DECIMAL(10,2) | Sale price | >= 0 |
| current_stock | INTEGER | Quantity in stock | DEFAULT 0 |
| low_stock_threshold | INTEGER | Alert trigger level | DEFAULT 5 |
| unit | VARCHAR(20) | Piece/Kg/etc. | NOT NULL |
| supplier_name | VARCHAR(80) | Supplier name | NULL |
| image_url | VARCHAR(500) | S3 image URL | NULL |
| expiry_date | DATE | Optional expiry | NULL |
| notes | TEXT | Optional notes | NULL |
| is_deleted | BOOLEAN | Soft delete flag | DEFAULT false |
| created_at | TIMESTAMP | Creation time | NOT NULL |
| updated_at | TIMESTAMP | Last update | NOT NULL |
| synced_at | TIMESTAMP | Last sync to cloud | NULL |

### 9.5 Sales Table

| Field | Type | Description | Constraints |
|-------|------|-------------|-------------|
| id | UUID | Primary key | PK |
| local_id | VARCHAR(50) | Device-generated ID | NOT NULL |
| user_id | UUID | FK to Users | NOT NULL |
| device_id | UUID | FK to Devices | NOT NULL |
| subtotal | DECIMAL(10,2) | Before discount | NOT NULL |
| discount_amount | DECIMAL(10,2) | Total discount | DEFAULT 0 |
| total | DECIMAL(10,2) | Final total | NOT NULL |
| is_refunded | BOOLEAN | Refund flag | DEFAULT false |
| notes | TEXT | Optional note | NULL |
| sold_at | TIMESTAMP | Sale timestamp | NOT NULL |
| created_at | TIMESTAMP | Record creation | NOT NULL |
| synced_at | TIMESTAMP | Cloud sync time | NULL |

### 9.6 Sale Items Table

| Field | Type | Description | Constraints |
|-------|------|-------------|-------------|
| id | UUID | Primary key | PK |
| sale_id | UUID | FK to Sales | NOT NULL |
| product_id | UUID | FK to Products | NOT NULL |
| product_name | VARCHAR(120) | Snapshot at time of sale | NOT NULL |
| quantity | INTEGER | Units sold | >= 1 |
| unit_price | DECIMAL(10,2) | Price at time of sale | NOT NULL |
| discount | DECIMAL(10,2) | Item-level discount | DEFAULT 0 |
| line_total | DECIMAL(10,2) | qty * unit_price - discount | NOT NULL |

### 9.7 Payments Table

| Field | Type | Description | Constraints |
|-------|------|-------------|-------------|
| id | UUID | Primary key | PK |
| sale_id | UUID | FK to Sales | NOT NULL |
| method | VARCHAR(20) | cash/easypaisa/jazzcash/bank | NOT NULL |
| amount | DECIMAL(10,2) | Amount for this method | NOT NULL |
| reference_number | VARCHAR(100) | Transaction reference | NULL |
| is_reconciled | BOOLEAN | Reconciliation status | DEFAULT false |
| recorded_at | TIMESTAMP | When payment was recorded | NOT NULL |

### 9.8 SyncQueue Table (Local SQLite Only)

| Field | Type | Description | Constraints |
|-------|------|-------------|-------------|
| id | INTEGER | Primary key | PK, AUTOINCREMENT |
| table_name | VARCHAR(50) | Target table | NOT NULL |
| record_id | VARCHAR(100) | Record identifier | NOT NULL |
| operation | VARCHAR(10) | INSERT/UPDATE/DELETE | NOT NULL |
| payload | TEXT | JSON payload | NOT NULL |
| created_at | TIMESTAMP | Queue entry time | NOT NULL |
| synced_at | TIMESTAMP | When synced | NULL |
| retry_count | INTEGER | Failed attempts | DEFAULT 0 |
| last_error | TEXT | Last error message | NULL |

---

## 10. Milestones & Timeline

---

### 🚀 Part A — 8-Week MVP Sprint

> **Goal:** Ship a working, installable, offline-capable POS that a real shop owner can use on Day 1.  
> **Scope:** Registration + Licensing + Core POS + Inventory + Payments + Basic Reporting  
> **Team Assumption:** 2 backend devs, 1 WPF frontend dev, 1 QA/DevOps

---

#### Week 1 — Foundation & Infrastructure

**Theme:** Get the skeleton standing before adding any flesh.

| # | Task | Owner | Done When |
|---|------|-------|-----------|
| 1.1 | Set up GitHub repo, branching strategy (main / dev / feature/*) | DevOps | Repo live, branch rules enforced |
| 1.2 | Configure CI/CD pipeline (GitHub Actions → build + test on push) | DevOps | Pipeline runs green on empty project |
| 1.3 | Provision AWS environment: EC2 + RDS PostgreSQL + S3 bucket | Backend | All services reachable from dev machines |
| 1.4 | Define and migrate full PostgreSQL schema (Users, Devices, Licenses, Products, Sales, Payments) | Backend | All tables created with indexes |
| 1.5 | Set up local SQLite schema (mirrored tables + SyncQueue) | Backend | SQLite DB initializes on app first run |
| 1.6 | Scaffold ASP.NET Core 8 Web API project with folder structure | Backend | Project compiles; health check endpoint returns 200 |
| 1.7 | Scaffold WPF .NET 8 project with MVVM architecture, dependency injection | Frontend | App window opens; navigation shell works |
| 1.8 | Set up SMS OTP provider account (Jazz SMS Gateway + Twilio backup) | Backend | Test OTP delivered to Pakistani number |

**Week 1 Exit Criteria:** Dev environment fully operational. Both backend API and desktop app compile and run. Database schemas finalized.

---

#### Week 2 — Auth, Registration & Device Fingerprinting

**Theme:** A user can register, verify their identity, and be tied to their device.

| # | Task | Owner | Done When |
|---|------|-------|-----------|
| 2.1 | Build `POST /api/auth/register` endpoint with full validation | Backend | Returns 201 + OTP sent via SMS |
| 2.2 | Build `POST /api/auth/verify-otp` endpoint with 5-min expiry + 3-attempt lockout | Backend | OTP verified; user record activated |
| 2.3 | Build `POST /api/auth/login` and JWT + refresh token issuance | Backend | Returns access + refresh tokens |
| 2.4 | Implement device fingerprint generation on desktop (MAC + CPU ID + Windows Product ID) | Frontend | Fingerprint hash generated and stored |
| 2.5 | Build Registration screen in WPF (all fields, validation, city dropdown) | Frontend | Form submits; validation errors shown inline |
| 2.6 | Build OTP screen (6-digit input, countdown timer, resend button) | Frontend | OTP verified; app navigates to next step |
| 2.7 | Internet connectivity check on first launch (full-screen block if offline) | Frontend | No internet = locked screen with Urdu/English message |
| 2.8 | Store JWT securely in Windows Credential Store | Frontend | Token persists across app restarts |

**Week 2 Exit Criteria:** A new user can register with their Pakistani mobile number, receive an OTP, verify it, and be logged in with their device fingerprinted.

---

#### Week 3 — License System & Trial Logic

**Theme:** The business model is enforced. Trial starts. Keys can be activated.

| # | Task | Owner | Done When |
|---|------|-------|-----------|
| 3.1 | Build `POST /api/license/activate` endpoint (key validation + device binding) | Backend | Valid key activates; invalid key returns clear error |
| 3.2 | Build `GET /api/license/status` and `POST /api/license/ping` endpoints | Backend | Status returns trial/active/expired with days remaining |
| 3.3 | Implement 14-day trial auto-start on registration | Backend | Trial expiry stored; returned in license status |
| 3.4 | Build license activation screen in WPF (key input field + status display) | Frontend | User can enter key; success/failure shown clearly |
| 3.5 | Implement trial countdown banner in app header (days remaining) | Frontend | Banner visible from Day 1; disappears when licensed |
| 3.6 | Implement Restricted Mode UI overlay (post-trial expiry) | Frontend | Expired state = read-only; overlay on any write action |
| 3.7 | Build AES-256 encrypted license storage in Windows Credential Store | Frontend | License key not readable in plain text on disk |
| 3.8 | In-app reminder notifications on Days 10, 12, 13 of trial | Frontend | Notifications fire correctly on simulated dates |
| 3.9 | Build `POST /api/admin/licenses/generate` endpoint for key generation | Backend | Admin can generate keys with type (monthly/6mo/annual) |

**Week 3 Exit Criteria:** Trial activates on registration. License keys can be generated by admin and activated by users. Expired state locks the app correctly.

---

#### Week 4 — Core POS Screen

**Theme:** A shop owner can ring up a sale end-to-end in under 60 seconds.

| # | Task | Owner | Done When |
|---|------|-------|-----------|
| 4.1 | Build 3-panel POS layout (product search | cart | checkout) in WPF | Frontend | Layout renders correctly at 1366×768 and 1920×1080 |
| 4.2 | Implement barcode scanner input (auto-focus, scan = add to cart, re-scan = increment qty) | Frontend | USB barcode scanner adds products in under 200ms |
| 4.3 | Implement manual product search (real-time dropdown, partial name match, 2+ chars) | Frontend | Dropdown shows results under 300ms for 1,000 products |
| 4.4 | Build cart logic: add, remove, edit quantity, clear cart, hold cart (up to 5) | Frontend | All cart operations work; held carts persist across sessions |
| 4.5 | Implement discount logic (% and flat, per item and per cart) | Frontend | Discounts calculate correctly; edge cases handled |
| 4.6 | Build `POST /api/sales` endpoint with full transaction record | Backend | Sale saved to PostgreSQL with all items and payment |
| 4.7 | Save sale to local SQLite immediately (offline-safe) | Frontend | Sale saved locally even with no internet |
| 4.8 | Build checkout flow: payment method selection, amount entry, change calculation | Frontend | All 4 payment methods selectable; change displayed for cash |
| 4.9 | Build receipt screen: itemized list, totals, shop name, date/time, sale ID | Frontend | Receipt renders correctly; print button triggers Windows print dialog |

**Week 4 Exit Criteria:** Full POS transaction flow works end-to-end offline. Barcode scanning, manual entry, all payment methods, and receipt generation all functional.

---

#### Week 5 — Inventory Management

**Theme:** The shop owner knows exactly what they have and gets warned before they run out.

| # | Task | Owner | Done When |
|---|------|-------|-----------|
| 5.1 | Build Inventory list screen with search, sort, filter, pagination | Frontend | 10,000 products load and search under 300ms |
| 5.2 | Build Add Product form (all fields, barcode scan input, validation) | Frontend | Product saved to local SQLite and syncs to cloud |
| 5.3 | Build Edit Product screen (prefilled form, save/cancel) | Frontend | Changes saved; updated_at timestamp updated |
| 5.4 | Implement soft delete with confirmation dialog | Frontend | Deleted products hidden from POS; recoverable by admin |
| 5.5 | Implement low stock threshold logic + badge count on Inventory menu | Frontend | Badge shows count of products at or below threshold |
| 5.6 | Build in-app notification for low stock items (bell icon + list) | Frontend | Notifications appear when stock drops to threshold |
| 5.7 | Implement stock auto-decrement on sale completion | Backend | Stock reduces correctly per sale; validated post-sync |
| 5.8 | Build `GET /api/products/low-stock` and `DELETE /api/products/{id}` endpoints | Backend | Endpoints return correct data; soft delete confirmed |
| 5.9 | Build CSV bulk import for products (template download + upload + validation) | Frontend | 500-row CSV imports correctly; errors shown per row |

**Week 5 Exit Criteria:** Shop owner can add, edit, delete, and search products. Stock auto-decrements on sale. Low stock alerts fire correctly.

---

#### Week 6 — Offline Sync & Payment Tracking

**Theme:** Data never gets lost. Everything recorded offline safely reaches the cloud.

| # | Task | Owner | Done When |
|---|------|-------|-----------|
| 6.1 | Build SyncQueue table + SyncService background thread (5-min interval) | Backend/Frontend | Service runs silently; does not block UI |
| 6.2 | Implement sync push: batch changes from SyncQueue → `POST /api/sync/push` | Frontend | All offline transactions sync on reconnect |
| 6.3 | Implement sync pull: `GET /api/sync/pull` for cloud-to-device changes | Frontend | Product catalog updates from cloud applied locally |
| 6.4 | Implement conflict resolution rules (last-write-wins, additive merge for stock) | Backend | Conflict scenarios tested with automated tests |
| 6.5 | Implement sync retry with exponential backoff (1m, 5m, 15m, 30m) | Frontend | Failed syncs retry automatically; logged to error log |
| 6.6 | Online/Offline status indicator in app header (green/orange dot) | Frontend | Status updates within 60 seconds of connectivity change |
| 6.7 | Build daily cash register (opening balance, inflows, outflows, closing balance) | Frontend | Cash register balances match sale totals |
| 6.8 | Build digital payments reconciliation screen (unreconciled items in orange) | Frontend | Easypaisa/JazzCash/Bank transactions listable and markable |
| 6.9 | Build expense recording (category, amount, payment method, notes) | Frontend | Expenses saved and appear in profit calculations |
| 6.10 | Implement SQLite WAL mode + daily automatic local backup (retain 7) | Frontend | Backup files created at correct path each 24 hours |

**Week 6 Exit Criteria:** Offline sales sync reliably when internet returns. Cash and digital payments tracked. Local backups working.

---

#### Week 7 — Reporting, Urdu UI & Admin Dashboard

**Theme:** The owner can see their business at a glance — in their own language.

| # | Task | Owner | Done When |
|---|------|-------|-----------|
| 7.1 | Build Sales Summary report (daily/weekly/monthly/custom, bar chart) | Frontend | Report generates from SQLite in under 5s for 10k transactions |
| 7.2 | Build Profit & Loss report (revenue, COGS, expenses, net profit) | Frontend | P&L numbers match manual verification |
| 7.3 | Build Top Products report (by qty and by revenue, weekly/monthly) | Frontend | Top 10 products shown correctly |
| 7.4 | Build Payment Method Breakdown (pie chart, daily/monthly) | Frontend | Payment split adds up to 100% |
| 7.5 | Implement PDF and Excel export for all reports | Frontend | Exported files open correctly in Excel and PDF reader |
| 7.6 | Implement Urdu/English language toggle (top nav bar, instant switch) | Frontend | UI flips between LTR and RTL without app restart |
| 7.7 | Implement WPF RTL layout (FlowDirection, mirrored margins, Nastaliq font) | Frontend | All screens render correctly in Urdu mode |
| 7.8 | Add Urdu string translations for all UI labels, error messages, and notifications | Frontend | No missing strings; fallback to English if missing |
| 7.9 | Build Admin SaaS Dashboard (web): user list, license list, user detail view | Backend | Admin can search users, view details, block/unblock |
| 7.10 | Build Admin license management (generate, revoke, extend trial) | Backend | Admin can revoke a key and it locks the device within 7 days |

**Week 7 Exit Criteria:** All 4 core reports working with export. Urdu/English toggle works instantly. Admin dashboard can manage users and licenses.

---

#### Week 8 — QA, Bug Fixes & MVP Release Prep

**Theme:** Polish, test with real users, and ship.

| # | Task | Owner | Done When |
|---|------|-------|-----------|
| 8.1 | End-to-end regression testing of all flows (registration → sale → report) | QA | All critical paths pass with zero blockers |
| 8.2 | Performance testing: product search on 10k items, report on 10k transactions | QA | All under target benchmarks (see NFR section) |
| 8.3 | Offline scenario testing (disconnect mid-sale, restart after power cut, 7-day offline) | QA | All scenarios handled gracefully |
| 8.4 | UAT with 5 real shop owners in Lahore (1 kiryana, 1 electronics, 1 general) | QA | At least 3/5 can complete a full sale without assistance |
| 8.5 | Fix all critical and high-priority bugs from UAT | Dev team | Zero P0/P1 bugs open |
| 8.6 | Build Windows installer (.exe / .msi via Inno Setup or WiX) | DevOps | Installer works on clean Windows 10 machine |
| 8.7 | Code-sign the installer binary with valid certificate | DevOps | Windows SmartScreen does not block the installer |
| 8.8 | Record Urdu onboarding video (5–7 minutes, screen + voice) | Product | Video uploaded to YouTube; linked in app Help screen |
| 8.9 | Write user-facing FAQ in Urdu (PDF + in-app) | Product | FAQ covers top 20 questions from UAT |
| 8.10 | Final production deployment + smoke test all API endpoints | Backend | All endpoints return expected responses in production |

**Week 8 Exit Criteria:** MVP is installable, tested by real users, code-signed, and deployed to production. **v0.1 MVP is LIVE.**

---

### 📅 Part B — 16-Week Phased Delivery Timeline (v1.0 Full Release)

> **Starts:** Immediately after 8-week MVP launch  
> **Goal:** Harden the MVP, add remaining features, and ship v1.0 — a production-grade, fully featured product.

---

#### Weeks 9–10 — Stability & Feedback Loop (Post-MVP Hardening)

| Task | Detail |
|------|--------|
| Monitor production telemetry | Track crash reports, sync failure rates, API error rates |
| Address top bugs from MVP users | Fix issues reported by early adopters within 48 hours |
| Improve sync reliability | Optimize SyncQueue; fix any edge cases found in production |
| Add SMS OTP fallback (email OTP) | Reduces registration failures from SMS gateway issues |
| Improve error messages | Rewrite all error messages to plain Urdu/English based on user confusion from UAT |
| Add Settings > Diagnostics screen | Users can view sync log, error log, and last backup time |

**Exit Criteria:** Sync failure rate below 0.5%. No P0/P1 bugs open. Crash rate below 0.1%.

---

#### Weeks 11–12 — Camera Bridge & Receipt Scanning

| Task | Detail |
|------|--------|
| Build WebSocket server inside desktop app (local LAN) | Desktop listens on a local port for phone connections |
| Build DukanPro Companion mobile web page | Lightweight mobile browser page that streams camera feed |
| Implement QR code generation for pairing | QR contains IP + port + session token; refreshes every 30 min |
| Integrate Tesseract OCR for receipt parsing | Extract vendor, date, items, and amounts from receipt image |
| Build receipt review & edit form | User corrects OCR errors before saving as expense |
| Test on Android (Chrome) and iOS (Safari) | Both platforms stream camera successfully |
| Handle poor lighting / blurry image fallback | Prompt user to retake if image quality is too low |

**Exit Criteria:** A shop owner can connect their phone camera to the desktop app via QR code and scan a paper receipt in under 60 seconds.

---

#### Weeks 13–14 — Barcode Label Printing & Polish

| Task | Detail |
|------|--------|
| Implement barcode label generation for unbarred products | Generate Code128 or QR barcodes for any product |
| Build print template for 1x1 inch and 2x1 inch label sizes | Compatible with common thermal label printers in Pakistan |
| Add product image upload (JPEG/PNG, max 2MB, stored in S3) | Image shown in product detail and POS product card |
| Add 58mm thermal receipt printer support | Test with Xprinter XP-58 (most common in Pakistani shops) |
| Implement number formatting toggle (Arabic-Indic vs. Western) | Configurable per user in Settings |
| Add font size settings (Small / Medium / Large) | Increases all text sizes app-wide |
| Performance optimization pass | Profile and fix any UI jank; reduce cold start time |
| Add keyboard shortcuts documentation | Help screen lists all shortcuts; Urdu version included |

**Exit Criteria:** Shop owners with label printers can print product barcodes. Thermal receipt printing works on Xprinter XP-58.

---

#### Weeks 15–16 — Final QA, v1.0 Hardening & Launch

| Task | Detail |
|------|--------|
| Full regression test of all features (manual + automated) | All critical paths pass |
| Load testing: 500 concurrent API users | API responds under 500ms at load |
| Security audit: JWT, SQLCipher, license anti-tamper | No critical vulnerabilities found |
| UAT with 20 real shops across Lahore, Karachi, Faisalabad | Minimum 15/20 shops can operate independently |
| Update installer to v1.0 with auto-update mechanism | Future updates delivered silently via background updater |
| Finalize privacy policy + terms of service in Urdu and English | Published at dukanpro.pk/privacy and dukanpro.pk/terms |
| Set up WhatsApp Business support line | Users can send a message to get help |
| Public launch: website, social media, and installer download live | v1.0 available at dukanpro.pk/download |

**Exit Criteria:** v1.0 is publicly available. 20 beta shops actively using it. Auto-update mechanism works. Support channel live.

---

### 🗓️ Part C — Post-Launch Roadmap (Month 1 → Month 18)

---

#### Month 1–2 Post-Launch — Growth & Retention

| Initiative | Detail |
|-----------|--------|
| Onboarding improvement | In-app interactive tutorial for first-time users (5-step guided flow) |
| WhatsApp receipt sharing | Share receipt as image directly to customer's WhatsApp from receipt screen |
| Referral program | Existing users get 1 free month for every paying referral |
| Analytics dashboard improvement | Add week-over-week and month-over-month comparison charts |
| License pricing page | Self-serve purchase via JazzCash / Easypaisa at dukanpro.pk/pricing |

**KPI Target:** 500 registered users. 30% trial-to-paid conversion.

---

#### Month 3–4 — v1.1 Release

| Feature | Detail |
|---------|--------|
| Barcode label batch printing | Print labels for multiple products at once from inventory screen |
| Sales by employee tracking | Each sale tagged to logged-in cashier (foundation for role-based access) |
| Inventory history log | Full audit trail: who changed what, when, and by how much |
| Export inventory as CSV | Full product catalog exportable for backup or migration |
| Improved low-stock report | Email/WhatsApp summary of low-stock items every morning (configurable) |
| UI theme: Dark Mode | Optional dark mode for shops with low ambient lighting |

**KPI Target:** 1,500 registered users. 33% conversion rate.

---

#### Month 5–6 — v1.5 Release (Major)

| Feature | Detail |
|---------|--------|
| **Udhar / Khata Ledger** | Track credit extended to named customers; record payments; view outstanding balance per customer |
| Khata customer profiles | Name, mobile number, address, credit limit, running balance |
| Khata SMS reminders | Send automated SMS to customers with outstanding balance (opt-in) |
| **Multi-branch support (2 locations)** | Same license covers 2 physical locations; separate inventories; consolidated owner reports |
| Branch-level reporting | Owner sees each branch independently or combined in one view |
| Role-based access (Owner / Manager / Cashier) | Each role has defined permissions; PIN-protected role switch |

**KPI Target:** 3,000 registered users. 35% conversion. First enterprise customers (3+ branch shops).

---

#### Month 7–9 — v1.6 Stability & Scale

| Feature | Detail |
|---------|--------|
| Supplier management | Add suppliers; record purchase orders; track what was ordered vs. received |
| Purchase invoice recording | Record supplier bills; auto-update stock on receipt |
| FBR-compatible invoice option | Optional FBR invoice format for tax-filing users (toggleable) |
| Cloud data backup download | Users can download their entire data as CSV/JSON from the web portal |
| Multi-language: Roman Urdu | Third language option: Roman Urdu (Urdu written in English script) |
| Admin dashboard v2 | Revenue analytics, cohort analysis, geographic heatmap by city |

**KPI Target:** 4,500 registered users. Revenue positive on server costs.

---

#### Month 10–12 — v2.0 Release (Mobile)

| Feature | Detail |
|---------|--------|
| **Android Mobile POS App** | Full POS functionality on Android phone; syncs with desktop and cloud |
| Mobile barcode scanning (native camera) | Uses phone camera directly — no companion app needed |
| Mobile inventory view | Browse and edit stock from phone |
| Mobile reports | View today's sales and alerts from anywhere |
| Customer loyalty program | Points per purchase; redeem on next visit; shown on receipt |
| Bulk SMS marketing | Send promotional SMS to all customers (opt-in list) |
| iOS App (App Store) | Submit to App Store; camera + POS + inventory on iPhone |

**KPI Target:** 5,000 registered users. 35%+ paid conversion. App Store rating 4.2+.

---

#### Month 13–18 — v2.5 & Beyond

| Feature | Detail |
|---------|--------|
| E-commerce lite | Simple online product catalog page (sharable link) — no payment gateway needed initially |
| WhatsApp ordering bot | Customers order via WhatsApp; stock auto-reserved |
| Employee payroll module | Track employee salaries, advances, and attendance |
| Accounting integration | Export to accounting formats (compatible with QuickBooks Pakistan) |
| API for third-party integration | Public API for developers building on DukanPro |
| Franchise / Distributor tier | Reseller program for regional agents to sell DukanPro licenses |

**KPI Target:** 10,000+ registered users. Series A readiness metrics achieved.

---

### 📊 Timeline Summary

```
WEEK  1  2  3  4  5  6  7  8  |  9 10 11 12 13 14 15 16  |  POST-LAUNCH
      ───────────────────────  |  ─────────────────────── |  ────────────────────────────────────
MVP   [Foundation & Infra     ]|                          |
      [Auth & Registration    ]|                          |
      [License System         ]|                          |
      [Core POS               ]|                          |
      [Inventory              ]|                          |
      [Sync & Payments        ]|                          |
      [Reports & Urdu UI      ]|                          |
      [QA & Release Prep      ]|                          |
                               |  [Stability & Hardening ]|
                               |  [Camera Bridge         ]|
                               |  [Barcode Labels + Polish]|
                               |  [Full QA & v1.0 Launch ]|
                               |                          |  Month 1–2: Growth & Retention
                               |                          |  Month 3–4: v1.1 (Barcode labels, Roles)
                               |                          |  Month 5–6: v1.5 (Udhar, Multi-branch)
                               |                          |  Month 7–9: v1.6 (Suppliers, FBR)
                               |                          |  Month 10–12: v2.0 (Mobile App)
                               |                          |  Month 13–18: v2.5+ (E-commerce, API)
```

---

## 11. Risks & Mitigations

| Risk | Likelihood | Impact | Mitigation |
|------|-----------|--------|-----------|
| Low internet penetration in target market | High | Critical | Ensure all core features work 100% offline; minimize internet dependency to registration only |
| Power outages causing data corruption | High | High | WAL mode SQLite, daily local backups, UPS recommendation in onboarding |
| License piracy / key sharing | Medium | High | Device fingerprinting, online ping validation every 7 days, encrypted license storage |
| Low adoption due to tech literacy | High | High | Urdu UI, icon-first design, free onboarding video in Urdu, WhatsApp support line |
| Pakistani SMS OTP delivery failures | Medium | Medium | Dual SMS gateway (Jazz + Twilio), email OTP fallback |
| Competition from existing POS solutions | Medium | Medium | Price positioning (cheaper), offline-first differentiator, local language support |
| Data privacy concerns from users | Medium | Medium | Clear privacy policy in Urdu, local data storage, no data sold to third parties |
| OCR accuracy for Urdu receipts | High | Medium | Fine-tune Tesseract on Pakistani receipt dataset; allow manual correction |
| WPF cross-platform limitations (macOS/Linux) | Low | Low | Use .NET MAUI for non-Windows, maintain WPF as primary |
| Server costs exceeding revenue in Year 1 | Medium | High | Start with small AWS instance, auto-scale, monitor burn rate monthly |

---

## 12. Glossary

| English Term | Urdu Term | Definition |
|--------------|-----------|-----------|
| POS (Point of Sale) | فروخت کا مقام | The system where sales transactions are processed |
| Inventory | انوینٹری / مال | Stock of goods available for sale |
| License Key | لائسنس کی | A unique code that activates the software |
| Trial Period | آزمائشی مدت | Free usage period before purchase required |
| Sync | مطابقت | Transferring data between local device and cloud |
| Barcode | بارکوڈ | Machine-readable product identifier |
| Receipt | رسید | Proof of purchase document given to customer |
| Dashboard | ڈیش بورڈ | Main overview screen showing key metrics |
| Offline | آف لائن | Operating without internet connection |
| Cloud | کلاؤڈ | Remote internet-based data storage |
| Easypaisa | ایزی پیسہ | Pakistani mobile payment service by Telenor |
| JazzCash | جاز کیش | Pakistani mobile payment service by Jazz |
| Udhar | ادھار | Credit given to a customer (pay later) |
| Kiryana | کریانہ | Pakistani neighborhood grocery store |
| OTP | او ٹی پی | One-Time Password for verification |
| Fingerprint (Device) | ڈیوائس پہچان | Unique hardware-based device identifier |
| RTL | دائیں سے بائیں | Right-to-Left text direction (used for Urdu) |
| SKU | SKU | Stock Keeping Unit — internal product code |
| Reconciliation | مطابقت جانچ | Verifying recorded payments against actual transactions |
| SaaS | ساس | Software as a Service — cloud-based subscription software |

---

*Document prepared for DukanPro — دکان پرو | Version 1.0.0-DRAFT | March 2026*  
*All specifications subject to change based on stakeholder review and user testing.*
