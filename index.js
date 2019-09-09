var fs = require('fs');
var inlineCss = require('inline-css');
const options = {
    "url": "http://example.com/",
    "removeHtmlSelectors": true,
    "removeLinkTags": true,
    "removeStyleTags": true,
}

fs.readFile(process.argv[2], 'utf8', function(err, contents) {
    inlineCss(contents, options)
        .then(function(contents) { console.log(contents); });
});