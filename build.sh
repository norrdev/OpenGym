# echo Cleanup...
# flutter clean \
#         && rm ios/Podfile.lock pubspec.lock \
#         && rm -rf ios/Pods ios/Runner.xcworkspace \
#         && rm macos/Podfile.lock \
#         && rm -rf macos/Pods macos/Runner.xcworkspace

# echo
# echo Packages update...
# flutter pub get

echo
echo Changelog sync...
cp CHANGELOG.md ../npng-site/

echo SplashScreen creating...
flutter pub run flutter_native_splash:create

echo 
echo Build android app...
cp -v -R lib/widgets/multiplatform_widgets.material.dart lib/widgets/multiplatform_widgets.dart
cp -v -R lib/main.material.dart lib/main.dart
flutter build apk --release
flutter build appbundle --release

echo 
echo Build iOS app...
cp -v -R lib/widgets/multiplatform_widgets.cupertino.dart lib/widgets/multiplatform_widgets.dart
cp -v -R lib/main.cupertino.dart lib/main.dart
flutter build ios --release

echo 
echo Build MacOS app...
cp -v -R lib/widgets/multiplatform_widgets.cupertino.dart lib/widgets/multiplatform_widgets.dart
cp -v -R lib/main.cupertino.dart lib/main.dart
flutter build macos --release

# echo Build web app...
# flutter build web --release


