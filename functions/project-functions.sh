function getAllShellScripts() {
    find . -name "*.sh"
}

function customCommit() {
    echo "COMMIT"
    echo "Jira Card:"
    read n
    read description
    git add .
    git commit --no-verify -m "[$n] - "$description
    if [ $? -ne 0 ]
    then
        echo "pre commit failure"
        return -1
    fi
    git commit --amend --no-verify
    #git push
}
