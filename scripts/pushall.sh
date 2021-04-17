#!/bin/bash

cd ~/jiminy/examples/atalante_cpp_jiminy/atalante_core/
git add .
echo "Atalante core commit message"
read message
git commit -m message
git push origin task_space

cd ..
git add .
echo "Atalante Jiminy commit message"
read message
git commit -m message
git push origin task_space

cd ~/Research/Repositories/exoskeleton_opt/
git add .
echo "Exoskeleton opt commit message"
read message
git commit -m message
git push origin simulation
