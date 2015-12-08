var self = require('sdk/self');
var pageMod = require('sdk/page-mod');

pageMod.PageMod({
    include: "*.youtube.com",
    contentScriptFile: self.data.url("content.js")
});
