'use strict'

const parser = require('./parser').parser

module.exports = input => {
  return parser.parse(input)
}
