# Spotlight
alias disable-spotlight="sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist"
alias disable-spotlight-index="sudo mdutil -a -i off"

# Dock
alias 2ddock="defaults write com.apple.dock no-glass -boolean YES; killall Dock"
alias 3ddock="defaults write com.apple.dock no-glass -boolean NO; killall Dock"
