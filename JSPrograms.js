const log = console.log;
////get most frequenct celment
// let testString  = "testinmhfdkttttz";
// let map= new Map();
// for(var ch of testString){
//   if(map.get(ch) == null){
//     map.set(ch, 1);

//   }else{
//     map.set(ch, map.get(ch) + 1);
//   }
// }
// log(Math.max(...map.values()));

// //remove all duploates
// let a = [1,2,3 ,4,1 ,2,4] ;
// a= a.filter((item, index) => a.indexOf(item) == index);
// log(a);

//print all permutation of a String? n => n! size
// var s = "123";
// permute("", s);

// function permute(perm, word) {
//   if (word == "") {
//     log("Pemutaion is " + perm + word);
//   }
//   for (let i = 0; i < word.length; i++) {
//     permute(
//       perm + word[i],
//       word.substring(0, i) + word.substring(i + 1, word.length)
//     );
//   }
// }

// ANAGRAMS
// var word1 = "pots",
//   word2 = "spot";
// log(anagram(word1, word2));

// function anagram(w1, w2) {
//   if (w1.length != w2.length) return false;

//   for (let c of w1) {
//     var index = w2.indexOf(c);
//     if (index == -1) return false;
//     else {
//       let c = w2[index];
//       w2 = w2.replace(c, "");
//     }
//   }
//   log(w2);
//   return w2 == "";
// }

//SUM PAIR PROBLEM
var a = [1, 3, 3, 4, 2, 2, 5];
sumpair(a, 7);

function sumpair(a, n) {
  var set = new Set();
  for (let curr of a) {
    let target = n - curr;
    if (set.has(target)) {
      log(curr + ' , ' + target);
    } else {
      set.add(target);
    }
  }
}
