#!/usr/bin/env bash
# link-to-config.sh
# 将当前目录下的所有文件夹软链到 ~/.config
# 已有同名目录则备份为 *.bak

set -euo pipefail

CONFIG_DIR="$HOME/.config"
BACKUP_SUFFIX=".bak.$(date +%s)"

# 确保 ~/.config 存在
mkdir -p "$CONFIG_DIR"

for dir in */; do
    [[ -d $dir ]] || continue          # 只处理目录
    dir_name=${dir%/}                  # 去掉末尾 /
    target="$CONFIG_DIR/$dir_name"

    if [[ -e $target ]]; then
        # 已存在：先备份
        backup="${target}${BACKUP_SUFFIX}"
        echo "备份已存在的 $target -> $backup"
        mv "$target" "$backup"
    fi

    echo "链接 $PWD/$dir_name -> $target"
    ln -sfn "$PWD/$dir_name" "$target"
done

echo "全部完成！"
