#!/bin/bash

# 启用不区分大小写的匹配
shopt -s nocasematch

# 定义替换规则
declare -A replacements=(
    ["\$PRTitle"]="$PRTitle"
    ["\$HeadOwner"]="$HeadOwner"
    ["\$GITHUB_SHA"]="$GITHUB_SHA"
)

# 执行替换
for pattern in "${!replacements[@]}"; do
    sed -i "s|${pattern}|${replacements[$pattern]}|g" "$TEMPLATE_FILE"
done
