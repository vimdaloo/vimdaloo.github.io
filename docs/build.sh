#!/bin/bash

main() {
    local version="0.0.1-1"

    local orig_dir=$(pwd)

    local script_file=$(realpath "${0}")
    local script_dir=$(dirname "${script_file}")

    cd "${script_dir}/../../vimdaloo-core/lua"
    rm -rf "${script_dir}/docs"
    luadox \
        --config "${script_dir}/luadox.conf" \
        --outdir "${script_dir}/docs" \
        $(cat "../rockspecs/vimdaloo-core-${version}.rockspec" | grep 'vimdaloo.*\.lua' | grep -v '\-\-' | sed -e "s/\[.*= 'lua\///g" | sed -e "s/',//g")
    cp "${script_dir}/luadox.new.css" "${script_dir}/docs/luadox.css"
    cp "${script_dir}/prism.new.css" "${script_dir}/docs/prism.css"

    cd "${orig_dir}"
}

main ${@}
