dir=$(mktemp -d "${TMPDIR:-/tmp}"/XXXXXXX)
dir=$(realpath $dir)
cp -R "$out/home-manager"/* "$dir/"
echo '{ ... }:  { home = { username = "'$USER'"; homeDirectory = "'$HOME'"; }; }' > "$dir/user.nix"
echo '{ ... }:  { programs.zsh.sessionVariables.no_proxy = "'$no_proxy'"; programs.zsh.sessionVariables.http_proxy = "'$http_proxy'"; programs.zsh.sessionVariables.https_proxy = "'$https_proxy'"; }' > "$dir/proxy.nix"
nix run home-manager/master -- switch --flake "$dir/#bob" -b backup || exit
rm -rf "$dir"

mkdir -p "$HOME/.config/kak"
cp -v "$out/configs/kak/kakrc" "$HOME/.config/kak/realrc"
cp -Rv "$out/configs/skhd" "$HOME/.config/"
for arg in "$@"; do
  if [ "$arg" = "--android" ]; then
    mkdir -p "$HOME/.config/zsh"
    cp -v "$out/configs/zsh/android.zsh" "$HOME/.config/zsh/"
  fi
done
