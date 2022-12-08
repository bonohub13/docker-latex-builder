#!/bin/sh

init() {
    mkdir -p aux log pdf

    return $?
}

format() {
    file="$1"

    sed "s/YYYY-MM-DD/$(date +'%Y-%m-%d')/" "${file}" \
        | tee tmp.tex > /dev/null

    return $?
}

compile() {
    file="$1"

    format "${file}"
    lualatex tmp.tex
    grep '\tableofcontents' "tmp.tex" > /dev/null \
        && lualatex tmp.tex
    mv -v \
        "tmp.aux" \
        "aux/$(echo "$file" | sed "s/tex$/aux/" | awk -F/ '{print $NF}')"
    mv -v \
        "tmp.log" \
        "log/$(echo "$file" | sed "s/tex$/log/" | awk -F/ '{print $NF}')"
    mv -v \
        "tmp.pdf" \
        "pdf/$(echo "$file" | sed "s/tex$/pdf/" | awk -F/ '{print $NF}')"

    return $?
}

init
find -type f -name "*.tex" | while read file
do
    compile "$file"
done
rm tmp.tex *.toc
