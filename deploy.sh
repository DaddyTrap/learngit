eval "$(ssh-agent -s)"
chmod 600 /tmp/deploy_rsa
ssh-add /tmp/deploy_rsa
# rsync -r --delete-after --quiet $TRAVIS_BUILD_DIR travis@daddytrapc.cn:/home/travis

ssh travis@daddytrapc.cn << 'ENDSSH'
  cd /home/travis
  git clone https://github.com/DaddyTrap/learngit.git
  cd learngit
  echo "`date` - Deploy script running..." >> travis.log
  # Do something here
  python3 test.py
  echo "`date` - Deploy script done!" >> travis.log
ENDSSH