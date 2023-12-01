# iShowTime

iShowTime is a go-to app for easily tracking your favorite TV shows. The app has user-friendly and simple interface which is powered by UIKit.
The app was completely built on MVVM architecture with using the TMDB API - open and free for non-commercial use.
    
  <b>Overview:</b>
  <br>The app allows you to search information about TV series. Each series can be added to the "Watching Now" or "Favorites" section. 
The "Watching Now" section tracks and saves your current progress, while the "Favorites" section serves as a reminder for you to watch specific series in the future.

<b>Key Features:</b>
  1) Each series detail screen has its own BackDrop poster, covered by a fancy blur view.<br>
  2) Each series has its maximum number of seasons and episodes.<br>
  3) Progress is tracked with high precision.<br>
  4) Once a series is added, the app doesn't require an internet connection to manage your progress.<br>

<b>Tech Stack:</b>
  UIKit, MVVM, URLSession, async/await, GCD, Realm, CoreAnimation, SwiftLint

  <details>
    <summary><b>User Data & Devices support</b></summary>
  <br>The app does not collect any user information and does not implement logging functionality. All data is stored on user's device via Realm Database. 
  <br>The app supports devices with iOS 14 and above (only for iPhone).
  </details>

  <details>
    <summary><b>GIFs</b></summary><br>
    <details>
    <summary>Search screen</summary>
  <img src="https://github.com/snipes1111/iShowTime/assets/123557658/24842144-8279-4029-99d1-4c38cecba085">
    </details>
    <details>
    <summary>Search detail screen</summary>
  <img src="https://github.com/snipes1111/iShowTime/assets/123557658/ca4c7f14-6bc4-4350-bf7e-0cf67f05c05f">
    </details>
    <details>
    <summary>WatchingNow screen</summary>
  <img src="https://github.com/snipes1111/iShowTime/assets/123557658/06f6a77e-b400-4430-9647-009d60dadc11">
    </details>
    <details>
    <summary>Favourites screen</summary>
  <img src="https://github.com/snipes1111/iShowTime/assets/123557658/13645924-b0a7-4327-9d3b-76e2e66d0108">
    </details>
    <details>
    <summary>Setting progress</summary>
  <img src="https://github.com/snipes1111/iShowTime/assets/123557658/dd951910-d490-473d-9f9e-455aa3988a6a">
    </details>
    <details>
    <summary>Progress validation</summary>
  <img src="https://github.com/snipes1111/iShowTime/assets/123557658/186361d5-5d78-40dc-bf41-fe1405848595">
    </details>
    <details>
    <summary>Navigation</summary>
  <img src="https://github.com/snipes1111/iShowTime/assets/123557658/988dda9c-6b34-495d-bbd9-a1fb0b53a6ec">
    </details>
  </details>
