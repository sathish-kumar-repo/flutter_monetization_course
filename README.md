# flutter-monetization-course

A step-by-step course covering how to configure and use ads, in-app purchases, and subscriptions to monetize a flutter app.

## Topics

### Part - 1

#### Setup App & Basic Ui

#### Connect to firebase

- Add code in Info.plist

  ```
  <key>NSAppTransportSecurity</key>
  <dict>
  <key>NSAllowsLocalNetworking</key>
  <true/>
  </dict>
  ```

- minSdkVersion 23
- Profile file not exist
- multiDexEnabled true in app level gradle (not apply)

#### Anonymous Authentication

#### Build Answer Generator, connecting to firstore, Backend process

### Part - 2

#### Implement google ads

Using package [google_mobile_ads](https://pub.dev/packages/google_mobile_ads)

[See Documention](https://developers.google.com/admob/flutter/quick-start)

Note: I Skip native ads

### Part - 3

#### In app purchase

Also I miss in app purchase in ios
