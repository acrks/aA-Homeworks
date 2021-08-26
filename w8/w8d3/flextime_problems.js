Array.prototype.myBinarySearch = function(target) {
    if (!this.length) {return -1}

    let mid = Math.floor(this.length / 2)
    let left = this.slice(0, mid)
    let right = this.slice(mid + 1)
    
    if (this[mid] === target) {
        return mid;
    } else if (target < this[mid]) {
        let leftVal = left.myBinarySearch(target);
        return leftVal;
    } else {
        let rightVal = right.myBinarySearch(target);
        if (rightVal < 0) {return -1}
        else {return rightVal + mid + 1};
    }
}

let arr1 = [1,2,3,4,5,6];
console.log(arr1.myBinarySearch(6));
// 5
console.log(arr1.myBinarySearch(8));
// -1

function mergeSorte(arr, callback) {
    if (arr.length <= 1) {
        return arr;
    };

    let mididx = Math.floor(arr.length / 2);

    let left = arr.slice(0, mididx);
    let right = arr.slice(mididx);

    let leftSorted = mergeSorte(left, callback);
    let rightSorted = mergeSorte(right, callback);

    return merge(leftSorted, rightSorted, callback);
};

function merge(left, right, callback) { 
    let array = [];

    while (left.length !== 0 && right.length !== 0) {
        if (callback(left[0], right[0])) {
            array.push(left.shift());
        } else {
            array.push(right.shift());
        };
    };

    array = array.concat(left, right);
    return array; 

};

let myArr = [2, 3, 4, 5, 6, 10, -3, 3];

console.log(mergeSorte(myArr, (num1, num2) => {

    if (num1 < num2) {
        return true;
    };

    return false;
}));

// [-3, 2, 3, 3, 4, 5, 6, 10]