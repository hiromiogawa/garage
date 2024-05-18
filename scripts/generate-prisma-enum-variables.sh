#!/bin/bash

# 出力ファイルのパス
outputPath="./src/util/statics/prisma-enum-variables.ts"
prismaClientPath="./node_modules/.prisma/client/index.d.ts"

echo "PrismaのenumからTypeScriptのenumファイルを自動生成開始..."

# 出力ファイルが存在する場合は削除
if [ -f $outputPath ]; then
    echo "生成済みのファイルを一旦削除します..."
    rm $outputPath
fi

# Enum定義を出力ファイルに書き込む
touch $outputPath

# Prismaクライアントファイルから$Enums内の定数定義を抽出し、出力ファイルに書き込む
awk '
/^export namespace \$Enums \{/,/^\}$/ {
    if (/^export namespace \$Enums \{/) {
        next
    }
    if (/^\}$/) {
        exit
    }
    if (/^export type /) {
        next
    }
    if (/^export const [a-zA-Z]+: \{/) {
        # 変数名を大文字のスネークケースに変換
        varName = $3
        gsub(/([a-z])([A-Z])/, "\\1_\\2", varName)
        varName = toupper(varName)
        sub($3, varName)
        sub(/: \{/, " = {")
        print $0 >> "'"$outputPath"'"
    }
    else if (/^\};$/) {
        print "} as const" >> "'"$outputPath"'"
    }
    else {
        # 末尾にカンマがない場合にカンマを追加
        if ($0 !~ /,/) {
            print $0 "," >> "'"$outputPath"'"
        } else {
            print $0 >> "'"$outputPath"'"
        }
    }
}
' $prismaClientPath

# `=`の前の`:`を削除
awk '{ gsub(/: =/, "="); gsub(/: \{/, " = {"); print }' $outputPath > tmp && mv tmp $outputPath

# `{,`からカンマを削除
awk '{ gsub(/\{,/, "{"); print }' $outputPath > tmp && mv tmp $outputPath

# 不要なカンマを削除し、改行とカンマのみの行からカンマを削除
awk '{ sub(/^[[:space:]]*,$/, ""); print }' $outputPath > tmp && mv tmp $outputPath

echo "自動生成が完了しました. 出力ファイル: $outputPath"
