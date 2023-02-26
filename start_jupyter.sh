#!/bin/bash
HASHED_PWD='argon2:$argon2id$v=19$m=10240,t=10,p=8$FovEBAdQbbW1r2rM/JVkTw$B2tXxK0rkRr/d9nan8acYTWYh0W+wF2YFYI9VIMd4Ks'
/root/miniconda/bin/jupyter lab --allow-root --ip=0.0.0.0 --no-browser --ServerApp.root_dir='/root' --NotebookApp.token='' --NotebookApp.password=$HASHED_PWD