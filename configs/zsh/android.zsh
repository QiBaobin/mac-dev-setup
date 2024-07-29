if [ -z "$JAVA_HOME" ]; then
  for d in "$HOME/Applications/*" ; do
    [[ "$d" = Android\ Studio* ]] && export JAVA_HOME="$d/Contents/jre/jdk/Contents/Home";
  done
fi
[ -z "$ANDROID_SDK_ROOT" ] && export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"
startavd() { "$ANDROID_SDK_ROOT/emulator/emulator" --no-skin --no-audio ${1-@Pixel_2_API_R} }
alias listavd='"$ANDROID_SDK_ROOT/emulator/emulator" -list-avds'
alias sdkmanager='"$ANDROID_SDK_ROOT/cmdline-tools/latest/bin/sdkmanager"'
alias avdmanager='"$ANDROID_SDK_ROOT/cmdline-tools/latest/bin/avdmanager"'
alias adb='"$ANDROID_SDK_ROOT/platform-tools/adb"'
alias logcat='"$ANDROID_SDK_ROOT/platform-tools/adb" logcat'

