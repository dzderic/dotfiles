function fix_dns
  sudo defaults write /System/Library/LaunchDaemons/com.apple.mDNSResponder.plist ProgramArguments -array-add '-AlwaysAppendSearchDomains'
  sudo launchctl unload /System/Library/LaunchDaemons/com.apple.mDNSResponder.plist
  sudo launchctl load /System/Library/LaunchDaemons/com.apple.mDNSResponder.plist
end
