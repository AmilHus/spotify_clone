Spotify Clone 🎧
The Spotify Clone is a Flutter application that replicates some core features of the Spotify music streaming service. This project demonstrates how to integrate external APIs and services with Flutter and manage application state using Bloc with dependency injection via Get It.

Features
🎶 Music Streaming: Streams high-quality music using the Just Audio package.
🔍 Search Songs: Allows users to search for songs stored in Firebase Firestore.
🔥 Firestore Integration: Fetches song data (artist, album, cover art, and more) from Cloud Firestore.
🎨 Dark/Light Theme: Users can switch between dark and light modes.
🛠 State Management with Bloc: Manages app state efficiently using the Bloc library, ensuring smooth UI updates and data handling.
📂 Get It for Dependency Injection: Uses Get It for dependency injection, making the code more modular and easier to manage.
📅 Persist State with Hydrated Bloc: Keeps track of user preferences and recently played songs even after app restarts.
Technologies Used
Flutter: Framework for building cross-platform apps.
Cloud Firestore: NoSQL database for storing song metadata and cover art.
Just Audio: Package for streaming and controlling music playback.
Bloc: State management solution that makes it easy to manage application state.
Get It: Simple service locator for dependency injection.
Hydrated Bloc: Persist and restore the app's state.
Firebase: Backend services for user authentication, data storage, and real-time data handling.
