#!/usr/bin/env node
const LanguageDetect = require('languagedetect')

// const langGuess = require('guesslanguage').guessLanguage
const langDetect = new LanguageDetect()

const ES = 'es',
EN = 'en'

const input = process.argv[2]

let abbrv

// With guesslanguage library
// langGuess.detect(input, l => {
// console.log(l)
//   if( l === 'spanish' ) 
//     abbrv = ES
//   else 
//     abbrv = EN
//   console.log(abbrv)
// })

if(input.includes('ñ')) {
  console.log('es')
  process.exit(0)
}

// With languagedetect library
const lang = langDetect.detect(input, 1)[0]
abbrv = lang[0] === 'spanish'? 'es' : 'en'
console.log(abbrv)

