// Arrow function
class Person {
  constructor(name) {
    this.name = name;
  }
  printF() {
    console.log("name:" + this.name);

    setTimeout(function () {
      console.log(this.name);
    }, 2000);
  }

  printAr = () => {
    console.log("name:" + this.name);

    setTimeout(() => {
      console.log(this.name);
    }, 2000);
  };
}

const p = new Person("Rincy");
p.printF();
p.printAr();

// --------------
let car = {
  brand: "Honda",
  getBrand: function () {
    return this.brand;
  },
};

console.log(car.getBrand()); // Honda
let brand = car.getBrand;
console.log(brand()); // undefined
let brand1 = car.getBrand.bind(car);
console.log(brand1()); // Honda

// call apply bind
var name = "RINCY";
var person = {
  name: "rincy",
  // getName: () => {
  //    console.log("Name:", this.name); // RINCY
  // },
  getName: function () {
    console.log("Name:", this.name);
  },
};

person.getName(); // rincy

var person2 = {
  name: "rinu",
};

//fucntion borrowing
person.getName.call(person2); //person2 is the 'this' for that function
//or
const getName = function (lastname) {
  console.log("Name:" + this.name + " lastname:", lastname);
};
getName.call(person2, "bedi");
getName.call(person2);
getName.apply(person2, ["bedi"]);

var f = getName.bind(person);
f("bedi");

//Mosh arrow function dont rebind this

const person1 = {
  talk() {
    console.log("this", this); //reference to person object
    let that = this;
    setTimeout(function () {
      console.log("this", this); //anonymous callback this on standalone object points to window

      console.log("that", that); //reference to person object or use arrow functon below
    }, 100);

    setTimeout(() => {
      console.log("this", this);
    }, 100);
  },
};

person1.talk(); // method cal on object
