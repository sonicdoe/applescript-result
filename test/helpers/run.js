import execa from 'execa'
import parser from './parser'

export default async script => {
  const stdout = await exec(script)
  const result = parser.parse(stdout)

  return result
}

const exec = async script => {
  return execa.stdout('osascript', ['-e', script, '-s', 's'])
}
