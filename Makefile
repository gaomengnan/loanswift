run:
	 dart run intl_utils:generate
build:
	 flutter pub run build_runner build --delete-conflicting-output
pack:
	flutter build apk --release --obfuscate --split-debug-info=build/debug-info --split-per-abi  --tree-shake-icons
dev:
	flutter run
