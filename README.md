# Flutter App Template
This is a template for starting a new flutter app using all the patterns I like. 

## Patterns
- Authentication: [firebase_auth](https://pub.dev/packages/firebase_auth)
- Authentication UI: [firebase_ui_auth](https://pub.dev/packages/firebase_ui_auth)
- Data models: [freezed](https://pub.dev/packages/freezed) and [json_serializable](https://pub.dev/packages/json_serializable)
- Business logic: [mobx](https://pub.dev/packages/mobx)
- Dependency injection: [get_it](https://pub.dev/packages/get_it) and [injectable](https://pub.dev/packages/injectable)
- Routing: [go_router](https://pub.dev/packages/go_router)
- Localisation: [intl](https://pub.dev/packages/intl) and the [built-in Flutter localisations generator](https://docs.flutter.dev/ui/accessibility-and-localization/internationalization#adding-your-own-localized-messages)

To add: 
- Firestore
- SharedPreferences
- LocalDB (Hive, Isar?)
- SecureStorage
- Crash reporting (Sentry)
- Logging?

## Project Structure
- `/assets`: contains app resources, images, sounds, etc
- `/l10n`: contains ARB files with translations of app messages
- `/lib`
    - `/config`: loads configuration data from the settings files
    - `/firebase`: contains firebase configuration
    - `/models`: Domain data models
    - `/pages`: Contains pages/screens within the app pages. One folder per page. View model in the same folder as the page, with the same name
        - `/feature1`
            - `feature1_page.dart`: Contains the top level flutter widget for the page
            - `feature1_page_vm.dart`: View model for the page, implemented as a MobX store. Calling these a view model instead of a store indicates their purpose in serving a specific page
    - `/services`: Services are wrappers around specific implementations of data access, API calls, etc
    - `/stores`: Mobx stores provide CRUD operations on data models
    - `/widgets`: Widgets which are shared across multiple pages
- `/settings`: environment-specific app settings

## Using the Template
- Find and replace all instances of `MyAwesomeApp` with the **display name** of your application
- Find and replace all instance of `com.example.my_awesome_app` with your organisation and app id name
- Update the folder structure in the `android` folder to match your app id. Rename the folders `android/app/src/main/kotlin/com/example/my_awesome_app` to `android/app/src/main/kotlin/my/organisation/department/my_app`
- Populate firebase settings using [flutterfire](https://firebase.google.com/docs/flutter/setup?platform=android)
    - `firebase login`: to login to your firebase account
    - `fluttefire configure --out=lib\firebase\firebase_options_dev.dart --android-app-id=<YOUR_APP_ID>.dev`: then select your development firebase project
    - `fluttefire configure --out=lib\firebase\firebase_options_prod.dart --android-app-id=<YOUR_APP_ID>`: then select your production firebase project
- Firebase options can be checked in to source control since they do not contain sensitive values. `lib/firebase/.gitignore` can be deleted if you want to check in the firebase options
- Populate app settings files in `settings` folder
    - `googleClientId`: Value is the "Web client ID" from the google_sign_in setup steps described here: https://github.com/firebase/FirebaseUI-Flutter/blob/main/packages/firebase_ui_auth/doc/providers/oauth.md#google-sign-in

If there are additional non-prod environments:
- `fluttefire configure --out=lib\firebase\firebase_options_<ENV>.dart --android-app-id=<YOUR_APP_ID>.<ENV>`: import the firebase configuration for each environment
- Update the `switch` statement in `lib/firebase/firebase_options.dart` to be able to switch between the different enviroments 
- Add additional `settings/app_settings_<ENV>.json` files to contain settings for that environment
- Add additional launch configurations in `.vscode/launch.json`

