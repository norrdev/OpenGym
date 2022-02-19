echo Cleanup...
flutter clean \
        && rm ios/Podfile.lock pubspec.lock \
        && rm -rf ios/Pods ios/Runner.xcworkspace \
        && rm macos/Podfile.lock \
        && rm -rf iomacoss/Pods macos/Runner.xcworkspace

echo
echo Packages update...
flutter pub get

echo
echo Changelog sync...
cp CHANGELOG.md ../npng-site/

echo SplashScreen creating...
flutter pub run flutter_native_splash:create

echo 
echo Build android app...
flutter build appbundle --release

echo 
echo Build iOS app...
flutter build ios --release

echo 
echo Build MacOS app...
flutter build macos --release

# echo Build web app...
# flutter build web --release


