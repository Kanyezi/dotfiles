#!/usr/bin/env bash
# deploy.sh —— 把当前目录下所有文件夹软链到 ~/.config/

set -euo pipefail

CONFIG_DIR="$HOME/.config"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

mkdir -p "$CONFIG_DIR"

for src in "$SCRIPT_DIR"/*/; do
    [[ ! -d $src ]] && continue        # 跳过非目录
    folder=$(basename "$src")

    dst="$CONFIG_DIR/$folder"

    if [[ -e "$dst" ]]; then
        read -rp "⚠️  $dst 已存在，覆盖吗？(y/N) " ans
        [[ $ans =~ ^[Yy]$ ]] || { echo "跳过 $folder"; continue; }

        # 备份旧目标（可选）
        mv "$dst" "${dst}.bak.$(date +%s)" 2>/dev/null || true
    fi

    # 创建父目录并链接
    mkdir -p "$(dirname "$dst")"
    ln -sfn "$src" "$dst"
    echo "✅ 链接 $src  ->  $dst"
done

echo "全部完成！"