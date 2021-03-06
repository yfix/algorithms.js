all: jshint coverage

setup:
	npm install

jshint: setup
	jshint src

test: setup
	mocha -R spec --recursive src/test

coverage: setup
	istanbul cover ./node_modules/.bin/_mocha -- -R spec --recursive src/test

coveralls:
	cat ./coverage/lcov.info | ./node_modules/coveralls/bin/coveralls.js

VERSION := $(shell node -e "console.log(require('./package.json').version);")
browser_bundle: setup
	browserify $(realpath src/index.js) --s algorithms | uglifyjs -c -m --screw-ie8 --wrap --preamble "/* algorithms.js v$(VERSION) | (c) 2014 Felipe Ribeiro | https://github.com/felipernb/algorithms.js/blob/master/LICENSE */" > build/algorithms.browser.min.js

