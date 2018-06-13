import fs from 'fs'
import path from 'path'
import jison from 'jison'

const grammarPath = path.join(__dirname, '..', '..', 'grammar.jison')
const bnf = fs.readFileSync(grammarPath, { encoding: 'utf8' })
const parser = new jison.Parser(bnf)

export default parser
