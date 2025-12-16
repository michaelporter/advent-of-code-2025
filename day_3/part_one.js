#!/usr/bin/env node

/*
  https://adventofcode.com/2025/day/3
*/

const fs = require('node:fs');
const path = require('path');

const testData = fs.readFileSync(path.join(process.cwd(), 'day_3/input.txt'), 'utf-8').split('\n');

const result = testData.reduce((totalJoltage, bank) => {
    const bankNums = `${bank}`.split('').map(x => +x);
    let firstNum, secondNum;
    let firstIndex;
    let highestPair;

    bankNums.forEach((n, i) => {
        const notSet = firstNum === undefined;
        const newWinner = n > firstNum && i < bankNums.length - 1;
        if ( notSet || newWinner ) {
            firstNum = n;
            firstIndex = i;
        }
    })

    bankNums.slice(firstIndex + 1).forEach((n, i) => {
        const notSet = secondNum === undefined;
        const newWinner = n > secondNum;
        if ( notSet || newWinner ) { 
            secondNum = n; 
        }
    })

    highestPair = +`${firstNum}${secondNum}`
    return totalJoltage + highestPair
}, 0)

console.log(result)
