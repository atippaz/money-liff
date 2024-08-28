#!/user/bin/env sh

set -e
npm run build 

cd dist 

git init 
git add -A
git commit -m 'new'
git push -f git@github.com:atippaz/money-liff.git master:gh-pages

cd -
