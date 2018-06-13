import test from 'ava'
import run from './helpers/run'

test('10.2579432', async t => {
  t.is(await run('10.2579432'), 10.2579432)
})

test('1.0', async t => {
  t.is(await run('1.0'), 1.0)
})

test('1.', async t => {
  t.is(await run('1.'), 1.0)
})

test('1.0e5', async t => {
  t.is(await run('1.0e5'), 100000)
})

test('1.0e+5', async t => {
  t.is(await run('1.0e+5'), 100000)
})

test('1.0e-5', async t => {
  t.is(await run('1.0e-5'), 0.00001)
})
