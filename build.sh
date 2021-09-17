echo Cleanup...
flutter clean \
        && rm ios/Podfile.lock pubspec.lock \
        && rm -rf ios/Pods ios/Runner.xcworkspace

echo 
echo Changelog sync...
cp CHANGELOG.md ../npng-site/

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


