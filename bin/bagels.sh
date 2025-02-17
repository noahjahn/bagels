#!/bin/bash

print_usage() {
    printf "Usage:\tbagels [OPTIONS] [COMMANDS]\n"
    printf "\nRun Bagels TUI\n\n"
    printf "Options:\n"
    printf "  -d, --data-dir\tstring\tThe path to the data directory. Used to preserve data\n"
    printf "\n"
    printf "Commands:\n"
    printf "  help \t\tDisplay usage and how to use the script\n"
}

DATA_DIR="$HOME/bagels/data"

while true; do
    case "$1" in
        -d | --data-dir ) DATA_DIR="$2"; shift 2 ;;
        help) print_usage; exit 0 ;;
        -- ) shift; break ;;
        * ) break ;;
    esac
done

mkdir -p $DATA_DIR

IMAGE_TAG="noahjahn-bagels"
CONTAINER_NAME="$IMAGE_TAG-$(date +%s)"

SCRIPT_DIR="$(dirname "$(dirname "$(readlink -f "$0")")")"

docker build -f "$SCRIPT_DIR/Dockerfile" -t $IMAGE_TAG . || exit 1;

docker run -v $DATA_DIR:/home/bagels/data --rm -it --name $CONTAINER_NAME  $IMAGE_TAG || exit 1;
