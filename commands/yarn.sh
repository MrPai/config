# Error log: The remote archive doesn't match the expected checksum
# Fix: 
# https://stackoverflow.com/questions/71275021/error-encountered-could-not-complete-yarn-install-of-substrate-front-end-templat
# https://github.com/yarnpkg/berry/issues/1142#issuecomment-607272809
yarn cache clean --all
yarn install
YARN_CHECKSUM_BEHAVIOR=update yarn