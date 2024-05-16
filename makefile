gen:
	dart run build_runner build --delete-conflicting-outputs
	flutter pub get

watch:
	dart run build_runner watch --delete-conflicting-outputs
	flutter pub get
