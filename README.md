# applescript-result [![Build Status](https://img.shields.io/travis/sonicdoe/applescript-result.svg)](https://travis-ci.org/sonicdoe/applescript-result)

> Convert an AppleScript result to its equivalent JavaScript representation

## Installation

```console
$ npm install applescript-result
```

## Usage

```javascript
const applescriptResult = require('applescript-result')

applescriptResult('{1, 2, 3}')
// => [ 1, 2, 3 ]

applescriptResult('{product:"pen", price:2.34}')
// => { product: 'pen', price: 2.34 }
```

## Supported data types

- [`boolean`](https://developer.apple.com/library/archive/documentation/AppleScript/Conceptual/AppleScriptLangGuide/reference/ASLR_classes.html#//apple_ref/doc/uid/TP40000983-CH1g-BBCIBBGG) → Boolean
- [`integer`](https://developer.apple.com/library/archive/documentation/AppleScript/Conceptual/AppleScriptLangGuide/reference/ASLR_classes.html#//apple_ref/doc/uid/TP40000983-CH1g-BBCHBDCJ) → Number
- [`real`](https://developer.apple.com/library/archive/documentation/AppleScript/Conceptual/AppleScriptLangGuide/reference/ASLR_classes.html#//apple_ref/doc/uid/TP40000983-CH1g-BBCJECEC) → Number
- [`text`](https://developer.apple.com/library/archive/documentation/AppleScript/Conceptual/AppleScriptLangGuide/reference/ASLR_classes.html#//apple_ref/doc/uid/TP40000983-CH1g-BBCIAHJF) → String
- [`list`](https://developer.apple.com/library/archive/documentation/AppleScript/Conceptual/AppleScriptLangGuide/reference/ASLR_classes.html#//apple_ref/doc/uid/TP40000983-CH1g-BBCDBHIE) → Array
- [`record`](https://developer.apple.com/library/archive/documentation/AppleScript/Conceptual/AppleScriptLangGuide/reference/ASLR_classes.html#//apple_ref/doc/uid/TP40000983-CH1g-BBCDGEAH) → Object

## Related

- [applescript](https://github.com/TooTallNate/node-applescript): Run AppleScript and get the result as a native JavaScript data type
- [run-applescript](https://github.com/sindresorhus/run-applescript): Run AppleScript and get the result as a string
- [node-osascript](https://github.com/FWeinb/node-osascript): Run AppleScript and process the result using [PEG.js](https://pegjs.org)
- [run-jxa](https://github.com/sindresorhus/run-jxa): Run JXA (JavaScript for Automation) code and get the result
