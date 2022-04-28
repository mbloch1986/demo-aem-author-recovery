ci: clean deps lint package

clean:
	rm -rf Gemfile.lock bin/ pkg/ stage/ modules/

deps:
	gem install bundler --version=1.17.3
	bundle install --binstubs -j4
	bundle exec r10k puppetfile install --verbose --moduledir modules

.PHONY: ci clean deps lint package release release-major release-minor release-patch publish
