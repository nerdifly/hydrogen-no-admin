#!/bin/bash

main() {
    echo -e "Downloading Latest Roblox"
    [ -f ./RobloxPlayer.zip ] && rm ./RobloxPlayer.zip
    curl "https://setup.rbxcdn.com/mac/version-2178d23686534193-RobloxPlayer.zip" -o "./RobloxPlayer.zip"

    echo -e "Installing Latest Roblox"
    [ -d "/Applications/Roblox.app" ] && rm -rf "/Applications/Roblox.app"
    unzip -o -q "./RobloxPlayer.zip"
    mv ./RobloxPlayer.app /Users/pablovandersande/hacks/Roblox.app
    rm ./RobloxPlayer.zip

    echo -e "Downloading libHydrogen"
    rm ./libHydrogen.dylib
    curl -LJO "https://github.com/retguard/ideal-octo-fishstick/raw/main/libHydrogen.dylib"

    rm ./insert_dylib
    echo -e "Downloading insert_dylib"
    curl -LJO "https://github.com/retguard/legendary-couscous/raw/main/insert_dylib"

    chmod +x "./insert_dylib"

    echo -e "Patching Roblox"
    mv ./libHydrogen.dylib "/Users/pablovandersande/hacks/Roblox.app/Contents/MacOS/libHydrogen.dylib"
    ./insert_dylib "/Users/pablovandersande/hacks/Roblox.app/Contents/MacOS/libHydrogen.dylib" "/Users/pablovandersande/hacks/Roblox.app/Contents/MacOS/RobloxPlayer" --strip-codesig --all-yes
    mv "/Users/pablovandersande/hacks/Roblox.app/Contents/MacOS/RobloxPlayer_patched" "/Users/pablovandersande/hacks/Roblox.app/Contents/MacOS/RobloxPlayer"

    chmod +x "/Users/pablovandersande/hacks/Roblox.app/Contents/MacOS/libHydrogen.dylib"

    rm -rf /Users/pablovandersande/hacks/Roblox.app/Contents/MacOS/RobloxPlayerInstaller.ap

    echo -e "Install Complete!"
}

main
