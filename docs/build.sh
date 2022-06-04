#!/bin/bash

main() {
    local orig_dir=$(pwd)

    local script_file=$(realpath "${0}")
    local script_dir=$(dirname "${script_file}")

    cd "${script_dir}/../../vimdaloo-core/lua"
    rm -rf "${script_dir}/docs"
    luadox \
        --config "${script_dir}/luadoc.conf" \
        --outdir "${script_dir}/docs" \
        $(find . -name '*.lua' | grep -v 'vimdaloo/lang/init.lua')

    cd "${orig_dir}"
}

main ${@}
