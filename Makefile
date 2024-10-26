run:
	 dart run intl_utils:generate
build:
	 flutter pub run build_runner build --delete-conflicting-output
pack:
	flutter build apk --build-name=1.0.8 --build-number=1 --release --obfuscate --split-debug-info=build/debug-info --split-per-abi  --tree-shake-icons

pack2:
	flutter build apk --release --obfuscate --split-debug-info=build/debug-info   --tree-shake-icons

dev:
	flutter run
