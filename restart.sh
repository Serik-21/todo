echo 'Pub get...'
flutter pub get 
echo 'Pub run watch build...    '
flutter pub run build_runner build --delete-conflicting-outputs
echo 'Done'