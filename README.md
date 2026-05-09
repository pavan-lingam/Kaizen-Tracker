# 改善 Kaizen Tracker

A personal productivity and process management web app inspired by Japanese Kaizen philosophy — simple, focused, and accurate.

## Features

- **Dashboard** — live stats, recent processes, today's tasks, status chart
- **Processes** — track all your work processes with status, priority, progress, drag-and-drop reorder
- **Daily Tasks** — add tasks by category (Urgent / Important / Normal / Low), set time, track completion
- **Calendar** — monthly view, add events by type (Meeting / Deadline / Personal / Reminder)
- **Analytics** — live charts: process status, tasks by category, top processes, 7-day completion trend
- **Plans** — short / medium / long term planning with drag-and-drop between columns
- **Future Events** — track places to go and events to attend

## Tech

- Single HTML file — no build tools, no frameworks
- Firebase Auth (email + password login)
- Firebase Firestore (real-time sync across all devices)
- Pure Canvas charts (no chart libraries)
- localStorage fallback when offline

## Setup

1. Clone or download this repo
2. Go to [console.firebase.google.com](https://console.firebase.google.com)
3. Create a project → enable **Firestore** and **Authentication (Email/Password)**
4. Copy your Firebase config and paste it into `index.html` where it says `firebaseConfig`
5. Open `index.html` in a browser or deploy to [Netlify](https://app.netlify.com/drop)

## Deploy

Drag `index.html` to [netlify.com/drop](https://app.netlify.com/drop) — get a live URL instantly, accessible from any device.

## Password

Login is handled by Firebase Auth. Create your account on first use with any email and password.
