import test from 'ava'
import run from './helpers/run'

test(async t => {
  t.is(await run(' '), null)
})
