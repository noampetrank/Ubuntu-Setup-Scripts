#!/usr/bin/env bash

success() {
    echo -e "\e[92m$1\e[0m"
}

error() {
    echo -e "\e[91m$1\e[0m"
}

header() {
    echo -e "\e[94m$1\e[0m"
}

get_yes_no_answer() {
    while true; do
        read -p "$1 [y/n] " answer
        case $answer in
            [Yy]* ) return 1;;
            [Nn]* ) return 0;;
            * ) echo -e "\e[91mInvalid input. Please answer 'y' or 'n'";;
        esac
    done
}

kill_current_idlespork_shells() {
    sudo pkill -f "/usr/bin/python -c __import__\('idlesporklib\.run'\)\.run\.main\(True\)"
    if [ $? -ne 0 ]
    then
        error "ERROR: Killing current idlespork shells failed!"
        echo "NOTE: If no Idlespork windows are open, the above error is expected"
    fi
}

checkout_master() {
    echo "Checking out 'master' branch in $(pwd)..."
    git checkout master
    if [ $? -eq 0 ]
    then
        echo "Checked out 'master' branch successfully"
        return 1
    else
        echo "Check out failed. Trying to reset..."
        git reset --hard
        if [ $? -eq 0 ]
        then
            echo "Reset successful. Trying to check out again..."
            git checkout master
            if [ $? -eq 0 ]
            then
                return 0
            fi
        else
            return 0
        fi
    fi
}

pull_latest_code() {
    echo "Pulling $(pwd)..."
    git pull
    if [ $? -eq 0 ]
    then
        echo "Pulled successfully"
        return 1
    else
        echo "Pull failed. Trying to reset to origin..."
        git reset --hard origin/$1
        if [ $? -eq 0 ]
        then
            echo "Reset successful"
            return 1
        else
            return 0
        fi
    fi

    echo "Pulling tags on $(pwd)..."
    git pull --tags
    if [ $? -eq 0 ]
    then
        echo "Pulled tags successfully"
        return 1
    else
        echo "Pull tags failed."
        return 0
    fi

    echo "Updating submodules on $(pwd)..."
    git submodule update --init --recursive
    if [ $? -eq 0 ]
    then
        echo "Updated submodules successfully"
        return 1
    else
        echo "Updating submodules failed."
        return 0
    fi
}

prepare_repo() {
    changed_files=$(git status -s)
    if [ "$changed_files" != "" ]
    then
        error "There are changed files in the repo $(pwd):"
        git status -s
        get_yes_no_answer "Do you want to continue anyway?"
        if [ $? -eq 0 ]
        then
            error "Exiting script. Please handle the changed files and execute the script again."
            exit 0
        fi

    fi

    header "Resetting repo: $(pwd)"
    branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
    if [ "$branch" != "master" ]
    then
        echo "$(pwd) is on branch: '$branch'"
        get_yes_no_answer "Do you want to switch to 'master'?"
        if [ $? -eq 1 ]
        then
            checkout_master
            if [ $? -eq 0 ]
            then
                error "Check out failed. Exiting"
                exit 1
            else
                success "$(pwd) checked out to 'master' successfully"
            fi
        fi
    fi

    get_yes_no_answer "Do you want to pull the latest code?"
    if [ $? -eq 1 ]
    then
        pull_latest_code branch
        if [ $? -eq 0 ]
        then
            error "Pull failed. Exiting"
            exit 1
        else
            success "$(pwd) pulled successfully"
        fi
    fi
}

cd $(echo $BUGATONE_ROOT)
prepare_repo
cd ../test-files
aws s3 sync s3://buga-resources-test-files .
cd ../oppo_daemon
prepare_repo
cd ../mobileproduct
prepare_repo
cd ../buga-recordings
prepare_repo
cd ../device_communication
prepare_repo

get_yes_no_answer "Do you want to reset idlesporks?"
if [ $? -eq 1 ]
then
    kill_current_idlespork_shells
fi
