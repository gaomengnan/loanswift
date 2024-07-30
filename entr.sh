while true
do
    find lib/ -name '*.dart' | \
        entr -d -p ./hotreloader.sh /_
done
