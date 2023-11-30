# iShowTime

iShowTime: Your Personal TV Show Tracker

Overview
iShowTime is a go-to app for easily tracking your favorite TV shows. The app has user-friendly and simple interface which is powered by UIKit.
The app was completely built on MVVM architecture. 

API used: open and free for non-commercial use - TMDB API.

The app allows you to search information about TV series. Each series can be added to the "Watching Now" or "Favorites" section. 
The "Watching Now" section tracks and saves your current progress, while the "Favorites" section serves as a reminder for you to watch specific series in the future.

Key Features of the App:
1) Each series detail screen has its own BackDrop poster, covered by a fancy blur view.
2) Each series has its maximum number of seasons and episodes.
3) Progress is tracked with high precision.
4) Once a series is added, the app doesn't require an internet connection to manage your progress.

Tech Stack:
UIKit, MVVM, URLSession, async/await, GCD, Realm, CoreAnimation, SwiftLint

The app does not collect any user information and does not implement logging functionality. 
All data is stored on user's device via Realm Database. 

The app supports devices with iOS 14 and above (only for iPhone).
