window.setTimeout(function() {
  console.log("HAMMERTIME");
},5000);

// ------------------------------------------------------------------------------------------------

let callback = function() {
  console.log("It's hammertimes");
}

let time_to_wait = 5000;

window.setTimeout(callback,time_to_wait)

// ------------------------------------------------------------------------------------------------

 function hammerTime(time) {
   window.setTimeout(function () {
     alert(`${time} is HAMMERTIME`);
   });
 }


// ------------------------------------------------------------------------------------------------

const readline = require('readline');
const reader = readline.createInterface( {
  input: process.stdin,
  output: process.stdout
});

function teaAndBiscuits () {
  reader.question("would you like some tea?",function(res){
    console.log(`you replied ${res}`);
    reader.question("would you like some  buiscuits?",function(res1){
      console.log(`you replied ${res1}`);

      const first = (res === 'yes') ? 'do' : 'dont';
      const second = (res1 === 'yes') ? 'do' : 'dont';

      console.log(`So, you ${first} want tea and ${second} want buiscuits`);
      reader.close();
    });
  });
}

// ------------------------------------------------------------------------------------------------

function Cat () {
this.name = 'Markov';
this.age = 3;
}

function Dog () {
this.name = 'Noodles';
this.age = 4;
}

Dog.prototype.chase = function (cat) {
console.log(`My name is ${this.name} and I'm chasing ${cat.name}! Woof!`)
};

const Markov = new Cat ();
const Noodles = new Dog ();

Noodles.chase(Markov);


Noodles.chase.call(Markov,Noodles);

Noodles.chase.apply(Markov,[Noodles]);
