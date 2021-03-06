#!/bin/bash

version=$(git describe)
rev=$(git rev-parse --short HEAD)

echo "Creating Directories\n"
mkdir -p project/build/linux
mkdir -p project/build/win64
mkdir -p dist

echo "Exporting projects\n"
godot project/project.godot --export-debug linux build/linux/HCSpace.x86_64
godot project/project.godot --export-debug win64 build/win64/HCSpace.exe

echo "Compressing packages\n"
cd project/build/
zip -r HCSpace-win64-$version\_$rev.zip win64/
tar cjf HCSpace-linux-$version\_$rev.tar.bz2 linux/
rm -rf win64/*
rm -rf linux/*
mv *.zip ../../dist
mv *.bz2 ../../dist
cd ../../dist
rm HCSpace-win64-latest.zip HCSpace-linux-latest.tar.bz2
ln HCSpace-win64-$version\_$rev.zip HCSpace-win64-latest.zip
ln HCSpace-linux-$version\_$rev.tar.bz2 HCSpace-linux-latest.tar.bz2
