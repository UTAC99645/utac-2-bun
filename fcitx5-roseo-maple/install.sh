#!/usr/bin/env bash
# 玫枫 Roseo Maple -> Fcitx5 一键安放脚本 nya~
# 用法: bash install.sh
set -e
DIR="$(cd "$(dirname "$0")" && pwd)"

# 1. 安放主题猫窝
mkdir -p "$HOME/.local/share/fcitx5/themes"
cp -r "$DIR/roseo-maple" "$DIR/roseo-maple-dark" "$HOME/.local/share/fcitx5/themes/"

# 2. 安放字体小鱼干 (Maple Mono NF CN, OFL 许可)
mkdir -p "$HOME/.local/share/fonts/maple-mono-nf-cn"
cp "$DIR"/fonts/*.ttf "$HOME/.local/share/fonts/maple-mono-nf-cn/"
fc-cache -f >/dev/null 2>&1 || true

# 3. 写入经典UI配置 (已有 classicui.conf 则只提示, 不覆盖)
if [ ! -f "$HOME/.config/fcitx5/conf/classicui.conf" ]; then
    mkdir -p "$HOME/.config/fcitx5/conf"
    cp "$DIR/conf/classicui.conf" "$HOME/.config/fcitx5/conf/classicui.conf"
    echo "[ok] 已写入 ~/.config/fcitx5/conf/classicui.conf"
else
    echo "[提示] 已存在 classicui.conf, 请手动把 conf/classicui.conf 里的 Font/Theme/DarkTheme 几行合并进去"
fi

echo "[ok] 安放完成 nya~ 重启 Fcitx5 后, 在「配置 -> 附加组件 -> 经典用户界面」里选择 roseo-maple / roseo-maple-dark"
