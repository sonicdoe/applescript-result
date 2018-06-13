import test from 'ava'
import run from './helpers/run'

test('true', async t => {
  t.is(await run('true'), true)
})

test('false', async t => {
  t.is(await run('false'), false)
})
