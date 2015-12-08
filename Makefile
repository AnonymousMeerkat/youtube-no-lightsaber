NAME = Youtube disable lightsaber sound
DESCRIPTION = Removes the annoying youtube lightsaber sound
VERSION = 1.0.1

all: chrome firefox userscript/youtube_no_lightsaber.user.js

clean:
	rm chrome/manifest.json
	rm chrome/content.js
	rm firefox/data/content.js
	rm firefox/package.json
	rm firefox/*.xpi
	rm userscript/youtube_no_lightsaber.user.js

%: %.in
	sed -e "s:@@NAME@@:$(NAME):g" \
	    -e "s:@@DESC@@:$(DESCRIPTION):g" \
	    -e "s:@@VERSION@@:$(VERSION):g" $< > $@

chrome/content.js: youtube_no_lightsaber.js
	cp $< $@

firefox/data/content.js: youtube_no_lightsaber.js
	cp $< $@

userscript/youtube_no_lightsaber.user.js: userscript/head.js youtube_no_lightsaber.js
	cat $< > $@

firefox/@youtubelightsaber-$(VERSION).xpi: firefox/package.json firefox/data/content.js
	cd firefox && jpm xpi
	cd ..


chrome: chrome/manifest.json chrome/content.js

firefox: firefox/@youtubelightsaber-$(VERSION).xpi
