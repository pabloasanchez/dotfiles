const LanguageDetect = require("languagedetect");
const lngDetector = new LanguageDetect();

const lang = lngDetector.detect(process.argv[2] || "English default", 1)[0]
const abbrv = lang[0] === 'spanish'? 'es' : 'en'
console.log(abbrv);

