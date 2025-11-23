# 🏀 Streetball

**The future of pick-up basketball around the world.**

Streetball is a mobile application that brings the addictive ranking systems of competitive video games to the world of basketball, creating a new competitive experience for millions of hoopers worldwide.

## 🎯 Vision

Streetball's vision is to create an easy-to-use network for hoopers to start and find pick-up games around the world. By combining social networking, geolocation, and competitive ranking systems, Streetball transforms casual pick-up basketball into an engaging, trackable, and competitive experience.

## ✨ Features

### 🎮 Core Functionality
- **Game Creation & Discovery**: Create and find pick-up basketball games in your area using interactive maps
- **Real-time Game Management**: Join games, track participants, and manage game settings on the fly
- **Competitive Ranking System**: Progress through multiple rank tiers from Unranked to Street Legend
- **Match History**: Track your basketball journey with detailed game history and statistics
- **Performance Analytics**: Visualize your progress with interactive charts and graphs

### 👥 Social Features
- **Friend System**: Connect with other hoopers and build your basketball network
- **Friend Requests**: Send and receive friend requests to grow your community
- **Player Profiles**: View detailed profiles including rank, stats, and match history
- **In-Game Communication**: Coordinate with teammates and opponents

### 🏆 Ranking System
Progress through competitive tiers:
- 🥉 **Unranked** - Starting point for all players
- 🥉 **Bronze** (3 levels) - Beginning your journey
- 🥈 **Silver** (3 levels) - Developing skills
- 🥇 **Gold** (3 levels) - Competitive player
- 💎 **Elite** (3 levels) - Top-tier hooper
- ⭐ **All Star** (3 levels) - Elite competition
- 🏆 **Hall of Fame** (3 levels) - Legendary status
- 👑 **Street Legend** - The pinnacle of streetball

### 📍 Location-Based Features
- **Google Maps Integration**: Find games near you with interactive map interface
- **Geolocation Services**: Automatic location detection for seamless game discovery
- **Location-based Game Creation**: Set up games at your favorite courts

### 🔐 Authentication & Security
- **Firebase Authentication**: Secure user authentication
- **Email/Password Login**: Traditional authentication method
- **Google Sign-In**: Quick authentication with Google accounts
- **Apple Sign-In**: Seamless authentication for iOS users
- **Password Recovery**: Easy password reset functionality

## 🛠️ Technology Stack

### Frontend Framework
- **Flutter** - Cross-platform mobile development framework
- **Dart** - Programming language (SDK >=3.0.0 <4.0.0)

### Backend & Database
- **Firebase Core** - Backend infrastructure
- **Cloud Firestore** - NoSQL cloud database for real-time data sync
- **Firebase Authentication** - User authentication and management
- **Firebase Performance** - App performance monitoring

### Key Dependencies
- **Google Maps Flutter** - Interactive map functionality
- **Geolocator** - Location services and geolocation
- **Go Router** - Advanced routing and navigation
- **Provider** - State management
- **FL Chart** - Data visualization and analytics
- **Google Fonts** - Custom typography
- **Cached Network Image** - Optimized image loading
- **Flutter Animate** - Smooth animations and transitions

### Platform Support
- ✅ Android
- ✅ iOS
- ✅ Web

## 📁 Project Structure

```
streetball/
├── lib/
│   ├── pages/
│   │   ├── on_boarding/          # Authentication flows
│   │   ├── main_pages/           # Core app pages (Home, Profile, Friends)
│   │   ├── create_game_pages/    # Game creation workflow
│   │   └── settings_pages/       # User settings and preferences
│   ├── components/               # Reusable UI components
│   ├── backend/
│   │   └── schema/              # Firestore data models
│   ├── auth/                    # Authentication logic
│   ├── flutter_flow/            # FlutterFlow utilities and widgets
│   └── main.dart               # Application entry point
├── assets/
│   ├── images/                 # Image assets and rank badges
│   ├── fonts/                  # Custom fonts
│   ├── videos/                 # Video assets
│   └── audios/                 # Audio assets
├── firebase/                   # Firebase configuration
│   ├── firestore.rules        # Firestore security rules
│   └── functions/             # Cloud functions
├── android/                   # Android-specific code
├── ios/                       # iOS-specific code
└── web/                       # Web-specific code
```

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.0.0 or higher)
- Dart SDK (3.0.0 or higher)
- Firebase account and project setup
- Android Studio / Xcode (for mobile development)
- Google Maps API key
- Firebase configuration files

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/streetball.git
   cd streetball
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Firebase Setup**
   - Create a Firebase project at [Firebase Console](https://console.firebase.google.com/)
   - Add Android and iOS apps to your Firebase project
   - Download and add configuration files:
     - `google-services.json` for Android (place in `android/app/`)
     - `GoogleService-Info.plist` for iOS (place in `ios/Runner/`)
   - Enable Authentication methods (Email/Password, Google, Apple)
   - Set up Cloud Firestore database
   - Deploy Firestore security rules from `firebase/firestore.rules`

4. **Google Maps Setup**
   - Obtain a Google Maps API key from [Google Cloud Console](https://console.cloud.google.com/)
   - Enable Maps SDK for Android and iOS
   - Add the API key to your platform-specific configuration files

5. **Run the app**
   ```bash
   # For development
   flutter run
   
   # For specific platform
   flutter run -d android
   flutter run -d ios
   flutter run -d chrome
   ```

### Building for Production

**Android**
```bash
flutter build apk --release
# or for app bundle
flutter build appbundle --release
```

**iOS**
```bash
flutter build ios --release
```

**Web**
```bash
flutter build web --release
```

## 📊 Database Schema

### Collections

#### `users`
- User profiles with stats, rank, and personal information
- Fields: display_name, email, rank, wins, losses, created_time, etc.

#### `games`
- Active and completed basketball games
- Fields: location, time, players, status, court_name, etc.

#### `users/{userId}/matchHistory`
- Individual match records for each user
- Fields: game_id, result, rank_change, date, etc.

#### `users/{userId}/friendRequests`
- Friend request management
- Fields: sender_id, receiver_id, status, timestamp, etc.

## 🔒 Security

Firestore security rules ensure:
- Users can only read/write their own user documents
- Game data is publicly readable but write-protected
- Match history and friend requests are user-specific
- Authentication required for all sensitive operations

## 🎨 Design System

The app features a custom design system with:
- Custom color schemes and themes
- Rank-specific badge designs (Bronze through Street Legend)
- Consistent typography using Google Fonts
- Responsive layouts for various screen sizes
- Smooth animations and transitions

## 📱 App Features by Page

### Home Page
- View nearby games on an interactive map
- Quick game creation
- Active game status
- Navigation to profile and friends

### Profile Page
- Personal stats and rank display
- Match history with visual graphs
- Rank progression tracking
- Settings access

### Friends Page
- Friend list management
- Incoming/outgoing friend requests
- Friend profile viewing
- Quick game invitations

### Create Game
- Map-based court selection
- Game settings configuration
- Player capacity management
- Time and date scheduling

### In-Game Page
- Real-time game status
- Player list
- Game controls (start, end, force start)
- Score tracking

## 🧪 Testing

```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage
```

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is private and not currently licensed for public use.

## 👨‍💻 Development

### Code Generation
This project uses FlutterFlow for rapid UI development and code generation. Custom code and business logic are integrated alongside generated code.

### State Management
- Provider pattern for global state
- FFAppState for app-wide state management
- Local state management in individual widgets

### Performance
- Firebase Performance Monitoring enabled
- Cached network images for optimal loading
- Lazy loading for lists and data
- Optimized map rendering

## 📞 Support

For support, please open an issue in the GitHub repository or contact the development team.

## 🗺️ Roadmap

- [ ] Tournament system
- [ ] Team creation and management
- [ ] Live game streaming
- [ ] Advanced statistics and analytics
- [ ] Leaderboards (local, regional, global)
- [ ] Achievement system
- [ ] In-app messaging
- [ ] Court reviews and ratings
- [ ] Sponsorship integration
- [ ] Merchandise store

## 🙏 Acknowledgments

- FlutterFlow for rapid development tools
- Firebase for backend infrastructure
- Google Maps for location services
- The basketball community for inspiration

---

**Made with ❤️ for hoopers worldwide**
