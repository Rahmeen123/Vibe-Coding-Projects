# Smaart Queue System for Health Care — Requirements Document

## Project Overview
A lightweight, easy-to-use queue management system for hospitals and clinics that reduces waiting time, increases transparency, and prioritizes emergencies. Built as a simple Flask + Python web app with no database (in-memory state and optional file persistence).

---

## Problem Statement
- Patients wait in long physical queues without knowing when they’ll be served.
- Waiting rooms become overcrowded, increasing stress and infection risk.
- Emergency cases have no automatic priority and can be delayed behind regular patients.
- Clinics lack a simple digital system to manage patient flow and communicate turn status.

---

## Target Users
- **Patients**
  - Walk-ins and appointment holders
  - Need a quick way to register, see status, and get notified when it’s their turn
- **Receptionists / Front Desk Staff**
  - Create tokens, manage queue order, and mark patients as served
- **Doctors / Clinicians**
  - See the next patient, manage consultation flow, and keep track of the queue
- **Clinic/Hospital Administrators**
  - Observe queue metrics and adjust settings (e.g., average service time)

---

## Functional Requirements
- Create and issue online tokens for patients
- Display live queue status (current token, waiting list)
- Provide estimated waiting time based on a fixed per-patient service time
- Allow marking a patient as “emergency” to prioritize them
- Doctor dashboard to:
  - Call next patient
  - Mark patient as complete
  - View upcoming queue
- Patient view to:
  - Lookup token status
  - See position in queue and estimated wait
- Simple notification mechanism (UI-based or simulated SMS) when turn is near

---

## Non-Functional Requirements
- **Simplicity:** Easy to deploy and use; no complex setup.
- **Performance:** Fast response for queue operations (in-memory data).
- **Reliability:** Keeps correct queue order and handles emergency priority correctly.
- **Scalability (basic):** Works for small clinic size (tens of patients), not intended for high-volume enterprise.
- **No external DB:** Uses in-memory structures and/or optional file persistence.
- **Usability:** Clear UI for patients, doctors, and receptionists.
- **Security (basic):** Prevent basic tampering (e.g., simple token-based access to doctor dashboard).

---

## System Features
- Token generation and assignment
- Live queue display (current and next tokens)
- Estimated wait time calculator
- Priority insertion for emergencies
- Doctor dashboard for moving the queue
- Patient token status lookup
- Optional persistence via a file (JSON/text) to survive restarts

---

## Possible Technologies
- **Backend:** Python + Flask
- **Frontend:** HTML + CSS (optionally Bootstrap) + lightweight JavaScript (polling or fetch)
- **Persistence (optional):** File-based JSON storage
- **Deployment:** Local server, Docker (optional), simple hosting (Heroku/Gunicorn)

---

## Future Enhancements
- Real SMS/WhatsApp notifications via third-party API (Twilio, etc.)
- Authentication & role-based access (doctor/receptionist/admin)
- Multi-department or multi-doctor queues
- Mobile-friendly UI and progressive web app (PWA) support
- Analytics dashboard (average wait time, throughput, peak load)
- Support for appointments (scheduled tokens) alongside walk-ins