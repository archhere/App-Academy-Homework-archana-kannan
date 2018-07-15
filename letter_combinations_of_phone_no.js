function phoneLetterCombo(str){
  const phoneHash = [[],['a','b','c'],['d','e','f'],['g','h','i'],
                ['j','k','l'],['m','n','o'],['p','q','r','s'],
                ['t','u','v'],['w','x','y','z']];

  const letters = str.split("").map(el => phoneHash[el]);


  function perms(keys,progress = 0,currentStr = "",
                 limit = keys.length,foundPermutations = []){
    if (progress === limit){
      foundPermutations.push(currentStr);
    } else {
      for(let i=0; i<keys[progress].length;i++){
        let nextStr = currentStr + keys[progress][i];
        perms(keys,progress+1,nextStr,limit,foundPermutations);
      }
    }
    return foundPermutations;
  }

  return perms(letters);
}
