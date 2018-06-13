import test from 'ava'
import run from './helpers/run'

test('"some text"', async t => {
  t.is(await run('"some text"'), 'some text')
})

test('"Mr. Smith"', async t => {
  t.is(await run('"Mr. Smith"'), 'Mr. Smith')
})

test('backslash character and double quote', async t => {
  // "He said \"Use the '\\' character.\""
  const script = '"He said \\"Use the \'\\\\\' character.\\""'
  // He said "Use the '\' character."
  const expected = 'He said "Use the \'\\\' character."'

  t.is(await run(script), expected)
})

test('quote', async t => {
  t.is(await run('quote'), '"')
})

test('space', async t => {
  t.is(await run('space'), ' ')
})

test('tab', async t => {
  t.is(await run('tab'), '\t')
})

test('return', async t => {
  // `return` on its own doesn’t work.
  t.is(await run('"foo: " & return'), 'foo: \r')
})

test('linefeed', async t => {
  t.is(await run('linefeed'), '\n')
})
