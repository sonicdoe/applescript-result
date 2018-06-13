import execa from 'execa'
import applescriptResult from '../..'

export default async script => {
  const stdout = await exec(script)
  const result = applescriptResult(stdout)

  return result
}

const exec = async script => {
  return execa.stdout('osascript', ['-e', script, '-s', 's'])
}
