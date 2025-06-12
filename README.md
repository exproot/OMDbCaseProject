# OMDbCaseProject

A small iOS application built with **UIKit** and **Clean Architecture** showcasing movie search and details fetching using the [OMDb API](http://omdbapi.com/). The project integrates **Firebase Remote Config**, **Firebase Analytics**, and **Firebase Cloud Messaging** to demonstrate real-time configuration, event logging, and push notifications.

---

## Demo

<p align="center">
  <a> 
    <img src= /repo-assets/demo.gif width="200">
  </a>
</p>

---

## Features

- Splash screen with dynamic title fetched via Firebase Remote Config
- Movie search with live API requests to OMDb
- Movie detail view with rich information and poster images
- Firebase Analytics integration to log movie detail views
- Push notifications via Firebase Cloud Messaging
- Clean Architecture with Data, Domain, and Presentation layers
- Dependency Injection implemented via Service Locator pattern
- Programmatic UI built with UIKit (no Storyboards)

---

## Architecture

The project is structured according to **Clean Architecture** principles:

- **Data Layer:** API DTOs, Mappers, Repository Implementations
- **Domain Layer:** Business Models, Repository Protocols, Use Cases
- **Presentation Layer:** Coordinators, ViewModels, and UIKit ViewControllers

---

## Dependencies

- [Firebase](https://firebase.google.com/) (Core, Remote Config, Analytics, Messaging)
- [Kingfisher](https://github.com/onevcat/Kingfisher) (Image downloading and caching)
- [DependencyContainer](https://github.com/exproot/DependencyContainer) (Custom Dependency Manager using Service Locator design pattern)

---

## Setup Instructions

1. Clone the repository
2. Obtain your OMDb API key
3. Create a `Secrets.xcconfig` file (not committed to version control) and add your OMDb API key:
   ```xcconfig
   OMDB_API_KEY = your_api_key_here
4. Add the Secrets.xcconfig file to your Xcode project and include it in your build configurations
5. In the project's Info.plist, add a new key OMDB_API_KEY with the value set to ${OMDB_API_KEY} (this references the value from the xcconfig file)
6. Configure Firebase:
   - Add your `GoogleService-Info.plist` to the project  
   - Setup Firebase Remote Config, Analytics, and Cloud Messaging as per Firebase Console  
   - Upload your APNs Authentication Key for push notifications
7. Build and run on a **real device** (push notifications do not work on simulator)  

---

## Usage

- Launch the app; the splash screen shows a configurable title from Firebase Remote Config  
- Search movies by title on the home screen  
- Tap a movie to see detailed info and trigger Firebase Analytics event  
- Receive push notifications sent from Firebase Console  

---

## Notes

- Dependency Injection is handled centrally using a Service Locator for modularity and testability  
- UIKit is used programmatically for UI components to maintain full control  
- Firebase SDK manages lifecycle and analytics automatically  
- Push notifications require proper APNs configuration and testing on a real device  

---
