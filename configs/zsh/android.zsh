if [ -z "$JAVA_HOME" ]; then
  for d in "$HOME/Applications/*" ; do
    [[ "$d" = Android\ Studio* ]] && export JAVA_HOME="$d/Contents/jre/jdk/Contents/Home";
  done
fi
[ -z "$ANDROID_SDK_ROOT" ] && export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"
alias startavd='"$ANDROID_SDK_ROOT/emulator/emulator" -list-avds | rg -v INFO | sk | while read name; do "$ANDROID_SDK_ROOT/emulator/emulator" -avd "$name"; done'
alias sdkmanager='"$ANDROID_SDK_ROOT/cmdline-tools/latest/bin/sdkmanager"'
alias avdmanager='"$ANDROID_SDK_ROOT/cmdline-tools/latest/bin/avdmanager"'
alias adb='"$ANDROID_SDK_ROOT/platform-tools/adb"'
alias logcat='"$ANDROID_SDK_ROOT/platform-tools/adb" logcat'

