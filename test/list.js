import test from 'ava'
import run from './helpers/run'

test('{"oatmeal", 42, "new"}', async t => {
  t.deepEqual(await run('{"oatmeal", 42, "new"}'), ['oatmeal', 42, 'new'])
})

test('{ "it\'s", 2, true }', async t => {
  t.deepEqual(await run('{ "it\'s", 2, true }'), ['it\'s', 2, true])
})

test('nested', async t => {
  t.deepEqual(await run('{ "foo", { "bar" } }'), ['foo', ['bar']])
})

test('{}', async t => {
  t.deepEqual(await run('{}'), [])
})
