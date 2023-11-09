#!/bin/sh

set -e
PATH=$(bash -l -c 'echo $PATH')

if [ -f ~/.bash_profile ]; then
source ~/.bash_profile
else
echo ".bash_profile not found."
fi

echo "🕗 Checking tools"

if ! which jazzy >/dev/null; then
echo "error: Jazzy not installed, install from https://github.com/realm/jazzy"
exit 1
fi

echo "✅ Tools OK $(jazzy --version)"

echo "🕗 Generating Docs for module ${PROJECT_NAME} in ${PWD}"

# jazzy / cocoapods is not supporting XCode 10 / iOS 12 for now
# https://github.com/realm/jazzy/pull/1004
#jazzy --output ../docs --clean --author AppsPeople --author_url https://www.appspeople.com.au --module ${PROJECT_NAME} --readme ../README.md --theme fullwidth --podspec ../AppsPeopleiOS.podspec
jazzy --output ../docs --clean --author AppsPeople --author_url https://www.appspeople.com.au --module ${PROJECT_NAME} --readme ../README.md --theme fullwidth --xcodebuild-arguments -workspace,AppsPeopleiOS.xcworkspace,-scheme,AppsPeopleiOS,-UseModernBuildSystem=NO --module AppsPeopleiOS

echo "✅ Docs generated"
