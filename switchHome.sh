out="${out:-.}"
dir=$(mktemp -d "${TMPDIR:-/tmp}"/XXXXXXX)
dir=$(realpath $dir)
cp -R "$out/home-manager"/* "$dir/"

cat <<EOF > "$dir/user.nix"
{ ... }:
{
  home.username = "$USER";
  home.homeDirectory = "$HOME";
  programs.alacritty.settings.import = [ "$HOME/.config/alacritty/local.toml" ];
}
EOF
cat <<EOF > "$dir/proxy.nix"
{ ... }:
{
  programs.zsh.sessionVariables.no_proxy = "$no_proxy";
  programs.zsh.sessionVariables.http_proxy = "$http_proxy";
  programs.zsh.sessionVariables.https_proxy = "$https_proxy";
}
EOF

nix run home-manager/master -- switch --flake "$dir/#bob" -b backup || exit
rm -rf "$dir"

mkdir -p "$HOME/.config/kak";  ln -sf "$out/configs/kak/kakrc" "$HOME/.config/kak/realrc"
mkdir -p "$HOME/.config/skhd";  ln -sf "$out/configs/skhd/skhdrc" "$HOME/.config/skhd/"
for arg in "$@"; do
  if [ "$arg" = "--android" ]; then
    mkdir -p "$HOME/.config/zsh"
     ln -sf "$out/configs/zsh/android.zsh" "$HOME/.config/zsh/"
  fi
done
