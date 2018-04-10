eval "$(ssh-agent -s)"
chmod 600 /tmp/deploy_rsa
ssh-add /tmp/deploy_rsa
rsync -r --delete-after --quiet $TRAVIS_BUILD_DIR travis@daddytrapc.cn:/home/travis

ssh travis@daddytrapc.cn << 'ENDSSH'
  mkdir -p /home/travis/
  cd /home/travis/
  echo "`date` - Deploy script running..."
  # Do something here
  python3 test.py
  ehco "`date` - Deploy script done!"
ENDSSH