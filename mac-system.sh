#!/bin/bash

echo "macOSシステム設定の変更を開始します..."

# Firewallの有効化
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on
echo "Firewallを有効化しました。"

# 起動時のサウンドの無効化
sudo nvram SystemAudioVolume=" "
echo "起動時のサウンドを無効化しました。"

# Control CenterにBluetoothを表示
defaults write com.apple.controlcenter "NSStatusItem Visible Bluetooth" -bool true
echo "Control CenterにBluetoothを表示するように設定しました。"

# バッテリーのパーセンテージ表示を有効化
defaults write com.apple.menuextra.battery ShowPercent -string "YES"
echo "バッテリーのパーセンテージ表示を有効化しました。"

# Dockの設定変更
defaults write com.apple.dock orientation -string "left"
defaults write com.apple.dock tilesize -int 16
defaults write com.apple.dock autohide -bool true
echo "Dockの設定を変更しました。"

# アプリケーション終了時のウィンドウを閉じない設定
defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool true
echo "アプリケーション終了時にウィンドウを閉じない設定にしました。"

# 明るさの自動調整を無効化
sudo defaults write /Library/Preferences/com.apple.iokit.AmbientLightSensor "Automatic Display Enabled" -bool false
echo "画面の明るさの自動調整を無効化しました。"

# ロックスクリーンの設定
defaults -currentHost write com.apple.screensaver idleTime -int 9000
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0
sudo pmset -b displaysleep 15
sudo pmset -c displaysleep 180
echo "ロックスクリーンの設定を変更しました。"

# キーボード設定
defaults write com.apple.BezelServices kDim -bool false
defaults write NSGlobalDomain AppleKeyboardUIMode -int 2
defaults write com.apple.HIToolbox AppleDictationAutoEnable -int 0
# Caps LockキーをControlに変更（注意：この設定は全てのキーボードに適用されます）
hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000039,"HIDKeyboardModifierMappingDst":0x7000000E0}]}'
echo "キーボード設定を変更しました。"

# トラックパッド設定
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.dock showAppExposeGestureEnabled -bool true
defaults write com.apple.dock showAppExposeGesture -int 2
echo "トラックパッド設定を変更しました。"

# VSCodeのvimキーマッピング設定
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false

# 設定の反映
killall Dock
killall ControlCenter
killall SystemUIServer

echo "全ての設定変更が完了しました。一部の設定は再起動後に反映されます。"
