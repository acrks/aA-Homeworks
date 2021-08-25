function titleize(array, callback) {
    let newarr = [];
    array.forEach(el => {
        var newName = 'Mx. ' + el + ' Jingleheimer Schmidt';
        newarr.push(newName);
    })
    callback(newarr);
}

function printCallback(array) {
    array.forEach(el => {
        console.log(el);
    })
}

// console.log(titleize(["Mary", "Brian", "Leo"], printCallback));
// Mx. Mary Jingleheimer Schmidt
// Mx. Brian Jingleheimer Schmidt
// Mx. Leo Jingleheimer Schmidt
// undefined

class Elephant 
{
    constructor(name, height, tricks) 
    {
        this.name = name;
        this.tricks = [];
        tricks.forEach(el => {this.tricks.push(el)});
        this.height = height;
    }
}

// should print "(name) the elephant goes 'phrRRRRRRRRRRR!!!!!!!'"
Elephant.prototype.trumpet = function () {
    console.log(this.name + " the elephant goes 'phrRRRRRRRRRRR!!!!!!!'");
}

// should increase the elephant's height by 12 inches
Elephant.prototype.grow = function () {
    this.height += 12;
}

// add a new trick to their existing repertoire
Elephant.prototype.addTrick = function (trick) {
    this.tricks.push(trick);
}

Elephant.prototype.play = function () {
    let max = this.tricks.length;
    let randInt = Math.random() * (max);
    let randTrick = this.tricks[randInt];
    console.log(this.name + ' is ' + randTrick+ '!');
}
// print out a random trick, e.g. "(name) is (trick)!"

let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];

Elephant.paradeHelper = function (elephant) {
    console.log(elephant.name + ' is trotting by!');
}

// herd.forEach(el => {Elephant.paradeHelper(el)});

function dinerBreakfast() {
    let order = "I'd like cheesy scrambled eggs ";
    let polite = "please";
    console.log(order + polite)

    return function (other_orders) {
        if (order[order.length-7] === "p")
        {
            order = order.slice(0, order.length - 7)
        }
        order = order + "and " + other_orders + " " + polite + ".";
        console.log(order)
    }
}

let bfastOrder = dinerBreakfast();
bfastOrder("chocolate chip pancakes");
bfastOrder("grits")