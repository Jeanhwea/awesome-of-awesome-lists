#!/usr/bin/env bash
# cat README.md | sed 's/.*(//' | sed 's/#.*$//;s/).*$//' | xargs -I {} git submodule add {}

list_readme() {
    cat README.md | sed 's/.*(//' | sed 's/#.*$//;s/).*$//' | grep '^https'
}

parse_github_url() {
    local url=${1//.git}
    local pattern2='^(http|https)://github.com/([a-zA-Z0-9_-]+)/([.a-zA-Z0-9_-]+)$'
    if [[ $url =~ $pattern2 ]]; then
        local name=${BASH_REMATCH[2]}
        local repo=${BASH_REMATCH[3]}
        local name=$(echo ${name} | tr '[:upper:]' '[:lower:]')
        local repo=$(echo ${repo} | tr '[:upper:]' '[:lower:]' | sed 's/awesome-//')
        if [ X"$repo" == X"awesome" ]; then
            echo ${name} ${url}
        else
            echo ${repo} ${url}
        fi
    fi
}

add_one_submodule() {
    local name=$1
    local url=$2
    local url=$(echo $url | sed 's/github.com/githubfast.com/')
    echo git submodule add $url awesome/$name
    git submodule add $url awesome/$name
}

add_submodule() {
    for url in $(list_readme); do
        add_one_submodule $(parse_github_url "$url")
    done
}

# list_readme
add_submodule
