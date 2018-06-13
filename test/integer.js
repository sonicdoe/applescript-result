import test from 'ava'
import run from './helpers/run'

test('1', async t => {
  t.is(await run('1'), 1)
})

test('-1', async t => {
  t.is(await run('-1'), -1)
})

test('42', async t => {
  t.is(await run('42'), 42)
})
