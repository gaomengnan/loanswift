V := $(shell git rev-parse --abbrev-ref HEAD | sed 's/^v//')

pack: pack_version rename_arm64 rename_armeabi rename_86

run:
	 dart run intl_utils:generate
build:
	 flutter pub run build_runner build --delete-conflicting-output

pack_version:
	flutter build apk --build-name=$(V) --build-number=1 --release --obfuscate --split-debug-info=build/debug-info --split-per-abi  --tree-shake-icons

pack2:
	flutter build apk

rename_arm64:
	mv build/app/outputs/flutter-apk/app-arm64-v8a-release.apk build/app/outputs/flutter-apk/app-arm64-v8a-release-v$(V).apk

rename_armeabi:
	mv build/app/outputs/flutter-apk/app-armeabi-v7a-release.apk build/app/outputs/flutter-apk/app-armeabi-v7a-release-v$(V).apk

rename_86:
	mv build/app/outputs/flutter-apk/app-x86_64-release.apk  build/app/outputs/flutter-apk/app-x86_64-release-v$(V).apk

dev:
	flutter run
