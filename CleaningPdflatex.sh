#!/bin/bash

read -p "Do You Want to Remove all .toc .aux .log .lof .lot files Y/N > " choice
case $choice in
  Y|y)
    rm *.toc
    rm *.aux
    rm *.auxlock
    rm *.log
    rm *.lof
    rm *.lot
    rm *.md5
    clear
    read -p "Do you want the pdfs to also be removed Y/N > " choice
    case $choice in
      Y|y)
        rm *.pdf
        clear ;;
      *) ;;
    esac
    ls
    echo "All Extra Files Have Been Deleted." ;;
  N|n)
    ls
    echo "No Files Will Be Deleted." ;;
esac