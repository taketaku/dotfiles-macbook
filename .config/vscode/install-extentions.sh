#!/bin/bash
cat extensions | while read line; do
    echo $line
    # code --install-extension $line
done
