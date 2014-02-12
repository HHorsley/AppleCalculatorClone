README.txt

CIS 195 - HW2 2/12/2014

WHAT I DID: 

Wow! This was hard for me. But I got it done.

There were three basic parts based on the way I thought about it. 
1) I need to pass back the value of the button clicked to the Calculator object
2) I needed to run a signicant amount of logic on those values
3) I needed to return the results of the calculations to display on screen

I structured it mainly around four methods: "getOperator", "getNumber", "getTopKey", "displayResults". In each of these methods there was a signicicant amount of logic. I passed values around using two properties, storing a "num1" and "num2" that allowed me to keep track of inputs and calculation results. I also used a fair number of instance variables to help me keep track of if the equals button had been pressed, for example.

My feeling is that this code is pretty ugly. The naming is weird, I capitalized some variables that I wish I hadn't, I rely too much on one-off solutions like boolean instance variables telling me if a the decimal button has been clicked. 

In the future I'm going to strive to keep things cleaner. The goal with this though, as my first time ever using objective-C, was just to make it work.

