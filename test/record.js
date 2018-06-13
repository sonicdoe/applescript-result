import test from 'ava'
import run from './helpers/run'

test('{product:"pen", price:2.34}', async t => {
  t.deepEqual(await run('{product:"pen", price:2.34}'), { product: 'pen', price: 2.34 })
})

test('nested', async t => {
  t.deepEqual(await run('{foo:"foo", bar:{baz:"baz"}}'), { foo: 'foo', bar: { baz: 'baz' } })
})
