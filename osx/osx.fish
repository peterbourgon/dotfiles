#!/usr/bin/env fish

# https://gist.github.com/brandonb927/3195465
# https://github.com/mathiasbynens/dotfiles/blob/master/.macos


# NAME


# Set computer name.
read -P "Computer name: " name
sudo scutil --set ComputerName $name
sudo scutil --set HostName $name
sudo scutil --set LocalHostName $name
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string $name


# MOUSE AND KEYBOARD


# Enable tap to click for this user and the login screen.
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Use scroll gesture with the Ctrl (^) modifier key to zoom.
# Doesn't seem to work in Mojave, at least.
# defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
# defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144
# defaults write com.apple.universalaccess closeViewZoomFollowsFocus -bool true # follow keyboard focus

# Enable full keyboard access for all controls (Accessibility pane).
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Press-and-hold should repeat the key, not pop a dialog for special keys.
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Fast keyboard repeat rate.
defaults write NSGlobalDomain KeyRepeat -int 0

# Disable autocorrect.
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false


# DISPLAY AND SCREEN SAVER


# Don't adjust screen brightness in low light.
sudo defaults write /Library/Preferences/com.apple.iokit.AmbientLightSensor "Automatic Display Enabled" -bool false

# Speed up wake-from-sleep by avoiding standby mode until 1d has passed.
# http://www.cultofmac.com/221392/quick-hack-speeds-up-retina-macbooks-wake-from-sleep-os-x-tips/
sudo pmset -a standbydelay 86400

# Hot corner: bottom right puts the display to sleep.
# 
# Values: 0: no-op
#         2: Mission Control
#         3: Show application windows
#         4: Desktop
#         5: Start screen saver
#         6: Disable screen saver
#         7: Dashboard
#        10: Put display to sleep
#        11: Launchpad
#        12: Notification Center
#
defaults write com.apple.dock wvous-br-corner -int 10
defaults write com.apple.dock wvous-br-modifier -int 0

# Require password immediately after display sleep or screen saver begins.
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0


# FINDER


# New Finder window opens home directory by default.
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://{$HOME}/"

# Show more things in a Finder window.
defaults write com.apple.Finder AppleShowAllFiles -bool true # show hidden files
defaults write NSGlobalDomain AppleShowAllExtensions -bool true # always show extensions
defaults write com.apple.finder ShowStatusBar -bool true # show status bar
defaults write com.apple.finder ShowPathbar -bool true # show path bar

# Don't warn when changing a file extension.
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Use column view by default.
defaults write com.apple.finder FXPreferredViewStyle Clmv

# Keep folders on top when sorting by name.
defaults write com.apple.finder _FXSortFoldersFirst -bool true


# SPOTLIGHT


# Stop a few things from getting indexed.
defaults write com.apple.spotlight orderedItems -array \
  '{"enabled" = 1;"name" = "APPLICATIONS";}' \
  '{"enabled" = 1;"name" = "SYSTEM_PREFS";}' \
  '{"enabled" = 0;"name" = "DIRECTORIES";}' \
  '{"enabled" = 0;"name" = "PDF";}' \
  '{"enabled" = 0;"name" = "FONTS";}' \
  '{"enabled" = 0;"name" = "DOCUMENTS";}' \
  '{"enabled" = 0;"name" = "MESSAGES";}' \
  '{"enabled" = 0;"name" = "CONTACT";}' \
  '{"enabled" = 0;"name" = "EVENT_TODO";}' \
  '{"enabled" = 0;"name" = "IMAGES";}' \
  '{"enabled" = 0;"name" = "BOOKMARKS";}' \
  '{"enabled" = 0;"name" = "MUSIC";}' \
  '{"enabled" = 0;"name" = "MOVIES";}' \
  '{"enabled" = 0;"name" = "PRESENTATIONS";}' \
  '{"enabled" = 0;"name" = "SPREADSHEETS";}' \
  '{"enabled" = 0;"name" = "SOURCE";}' \
  '{"enabled" = 0;"name" = "MENU_DEFINITION";}' \
  '{"enabled" = 0;"name" = "MENU_OTHER";}' \
  '{"enabled" = 0;"name" = "MENU_CONVERSION";}' \
  '{"enabled" = 0;"name" = "MENU_EXPRESSION";}' \
  '{"enabled" = 0;"name" = "MENU_WEBSEARCH";}' \
  '{"enabled" = 0;"name" = "MENU_SPOTLIGHT_SUGGESTIONS";}'
killall mds >/dev/null 2>&1 # load new settings before rebuilding the index
sudo mdutil -i on / >/dev/null # make sure indexing is enabled for the main volume
sudo mdutil -E / >/dev/null # rebuild the index from scratch

# Disable spotlight indexing for any volume that gets mounted and has not been indexed before.
# Doesn't seem to work in Mojave at least.
# sudo defaults write /.Spotlight-V100/VolumeConfiguration Exclusions -array "/Volumes"


# DIALOGS AND ERRATA


# Expanded Save and Print dialogs by default.
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Save to disk, rather than iCloud, by default.
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false


# DOCK AND ICONS


# Enable snap-to-grid for icons by default.
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

# Wipe all default app icons from the dock.
defaults write com.apple.dock persistent-apps -array

# Set Dock icon size to 36 pixels.
defaults write com.apple.dock tilesize -int 36

# Auto-hide the Dock.
defaults write com.apple.dock autohide -bool true


# PRIVACY


# In Safari, don't send search queries to Apple.
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true


# TIME MACHINE


# Disable local Time Machine backups.
# Doesn't seem to work in Mojave at least.
# hash tmutil >/dev/null 2>&1 ; and sudo tmutil disablelocal
