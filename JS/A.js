//Higher Order Functions Example
const radius = [3, 1, 2, 4];
// This is not a correc approcah, DRY violated, not modular
const calculateArea = function (radius) {
  const arr = [];
  for (var r of radius) {
    arr.push(Math.PI * r * r);
  }
  return arr;
};

const calculateCircumference = function (radius) {
  const arr = [];
  for (var r of radius) {
    arr.push(Math.PI * 2 * r);
  }
  return arr;
};

// console.log(calculateArea(radius));
// console.log(calculateCircumference(radius));

// -------------------- Correct Implementation below, also POLYFILL for Map

const area = (r) => Math.PI * r * r; //callback fucntion
const circumference = (r) => Math.PI * 2 * r; //functions as values

Array.prototype.calculate = function (logic) {
  //polyfill for Map, Higher Order fucntion
  const arr = [];
  for (var r of this) {
    arr.push(logic(r));
  }
  return arr;
};
// console.log(radius.calculate(area));
// console.log(radius.map(area));

// console.log(radius.calculate(circumference));
// console.log(radius.map(circumference));

// a();
// b(); Error : b is not a fucntion, its due to it is variable that is undefined in 1st code execution phase

//FUNCTION STATMENT OR DECLARATION
function a() {
  console.log("a called");
}

//FUNCTION EXPRESSION
var b = function () {
  console.log("b called");
}; // anonymous function  as value
// DIfference between above two is Hoisting

//ANONYMOUS FUCNTION

// function()
// {
// }

// above Will throw error: Fucntion Statements requires  a name
//anonymous fucntion are used to pass functtion as value

//NAMED FUNCTION EXPRESSION
var c = function xyz() {
  console.log("c called");
  console.log(xyz);
};

c();
// xyz(); //xyz is not defined

//PARAMTERES VS ARGUMENTS
var d = function (params1, params2) {
  //
  return function () {
    console.log("retuned function");
  };
};

d("arg1");

//FIRST CLASS FUNCTIONS
//functions inside function as parameter or return function from a  function

var e = d(function () {});
e();

//let var
// var variables are placed in global scope but let is present in Script scope
//Hoisiting works for both
//accessing let before init gives Reference error: not intialized, this is due to temporal dead zone
// console.log(aaa)
console.log(ab); //undefined
let aaa;
var ab = 10;
console.log(aaa);

let a1 = 10;
// var a1 = 2; //syntax error alredy declared
{
  // var a1 = 100;  //syntax error alredy declared, var are not block scoped so it will conflict with let
  let ab = 3;
  // console.log(a1);
}

//CLOSURES
console.log("closures");
function x() {
  var a = 1;
  var y = function () {
    console.log(a);
  };
  return y;
}

var z = x(); // x scope ends
z(); // but z still have accaes to its lexical scope (which contains a), as it forms a closures

Array.prototype.filter.call("abcsdllll", (e) => console.log(e));

var uniqueInOrder = function (iterable) {
  return [].filter.call(iterable, function (a, i) {
    return iterable[i - 1] !== a;
  });
};
console.log(uniqueInOrder("aaaaaBBBDSJJJJ"));

console.log("find Duplicates");
var dupArr = [1, 2, 2, 3, 4, 3, 1, 3, 6, 7];
let tempDup = [...dupArr].sort();
var dups = tempDup.filter(function (a, i, arr) {
  // debugger;
  return arr.indexOf(a) === i; //will give unique elements in the array
  // return arr[i-1] != a; //1,2,3
});

console.log(dups);

console.log("-----------------------");

// {
//   const constva = 1;
//   constva = 3;
// }

function closure() {
  const cd = 1;
  return function c() {
    console.log("cd = ", cd);
  };
}

closure()();


 