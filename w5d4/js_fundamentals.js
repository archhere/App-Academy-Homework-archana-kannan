// PART-1

function madLib(verb,adj,noun) {

  // return 'We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}'
  return `We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}.`
}


function isSubstring(searchString,subString) {
  return searchString.includes(subString);
}


function fizzBuzz(array) {
  let result = []
  for (let i=0; i<array.length; i++) {
    if ((array[i] % 3) ^ (array[i] % 5)) {
      result.push(array[i]);
    }
  }
  return result;
}


function isPrime(n) {
  if (n<2) {
    return false;
  }
  for (i=2; i<n; i++) {
    if (n % i == 0) {
      return false;
      }
    }
    return true
}

function sumOfPrimes(n) {
  let count = 0;
  let primecount = 0;
  for (let i=2; primecount<n; i++) {
    if (isPrime(i)) {
      count = count + i;
      primecount++;
    }
  }
  return count
}
