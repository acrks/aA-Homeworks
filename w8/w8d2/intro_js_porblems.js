function mysteryScoping1() {
    var x = 'out of block';
    if (true) {
      var x = 'in block';  
      console.log(x);
    }
    console.log(x);
  }

// Does not throw an error

// in block
// in block

// mysteryScoping1()

  
function mysteryScoping2() {
const x = 'out of block';
if (true) {
    const x = 'in block';  
    console.log(x);
}
console.log(x);
}

// in block
// out of block

// mysteryScoping2()
  
// function mysteryScoping3() {
// const x = 'out of block';
// if (true) {
//     var x = 'in block';  
//     console.log(x);
// }
// console.log(x);
// }

// Throws an error, const x has already been defined

// mysteryScoping3()
  
// function mysteryScoping4() {
// let x = 'out of block';
// if (true) {
//     let x = 'in block';  
//     console.log(x);
// }
// console.log(x);
// }

// cannot have two lets in for the same variable in the function

// mysteryScoping4()
  
//   function mysteryScoping5() {
//     let x = 'out of block';
//     if (true) {
//       let x = 'in block';  
//       console.log(x);
//     }
//     let x = 'out of block again';
//     console.log(x);
//   }

// mysteryScoping5()

// cannot have three lets in for the same variable in the function

// mysteryScoping4()

function madLib(word1, word2, word3) {
    console.log("We shall " + word1.toUpperCase() + " the " + word2.toUpperCase() + " " + word3.toUpperCase())
}

// madLib('make', 'best', 'guac')
// "We shall MAKE the BEST GUAC."

function isSubstring(sent, word) {
    const words = sent.split(" ");
    for(let i = 0; i < words.length; i++) {
        if(words[i] === word) {
            return true
        }
    }
    return false
}

// console.log(isSubstring("time to program", "time"))
// true

// console.log(isSubstring("Jump for joy", "joys"))
// false

function fizzBuzz(array) {
    var new_arr = []
    array.forEach(function(ele) {
        if((ele % 5 === 0 || ele % 3 === 0) && !(ele % 5 === 0 && ele % 3 === 0)) {
            new_arr.push(ele);
        }
    });
    return new_arr;
}

// var array = [1,2,3,4,5,30] 
// console.log(fizzBuzz(array))

function isPrime(number) {
    for(let i = 2; i < number; i++) {
        if(number % i === 0) {
            return false;
        }
    }
    return true;
}

// console.log(isPrime(2))
// true

// console.log(isPrime(10))
// false

// console.log(isPrime(15485863))
// true

// console.log(isPrime(3548563))
// false

function sumOfNPrimes(number) {
    // Counter to the number of primes
    var x = 0;
    // Sum variable
    var y = 2;
    var result = 0;
    while(x < number) {
        if(isPrime(y)) {
            x += 1;
            result += y;
        }
        y += 1;
    }
    return result;
}

console.log(sumOfNPrimes(0))
// 0

console.log(sumOfNPrimes(1))
// 2

console.log(sumOfNPrimes(4))
// 17