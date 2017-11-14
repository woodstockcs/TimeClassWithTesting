# TimeClassWithTesting

The following is part of a free response question that has been studied at colleges and universities.

You will implement two unrelated methods for a <code>Time</code> class that keeps track of the time using a 24 hour clock. Consider the code for the <code>Time</code> class provided in the <code>.pde</code> file provided in this repo. (At the top of the file you'll notice some global variables and two additional functions: <code>setup()</code> and <code>printTestCases(...)</code>. These run the automated test cases for the code you write. You can ignore these.)

Start by brainstorming and hand-write solutions for all of the parts below. Then open the provided code in Processing. Immediately run the sketch to see how the test cases are displayed. (You should see a lot of red FAILED test cases, and maybe a couple green PASSED test cases.) Then type your code into the relevant parts of the <code>Time</code> class definition and run the sketch again. Iteratively adapt your code (starting with Part a, then Part b, then Part c) until all your test cases are green.

### Part a.
Finish the method <code>pad()</code> which takes a number between 0 and 99 (inclusive) as input and returns a two-character String representation of that number, with a leading zero if the input number has one digit. If the input number is 0 then it adds a zero to the front to return the String <code>00</code>. If the number is 1 then it adds a zero in front to return the String <code>01</code>. If the input number is 10 then it simply returns <code>10</code> as a String.

### Part b.
Write the method <code>tick()</code> which increases the number of seconds by one. If the number of seconds is 60 it adds one to the number of minutes and resets seconds to 0. If the number of minutes is 59 it adds one to the number of hours and resets the number of minutes to 0. If the number of hours reaches 24 it should be reset to 0.

### Part c.
Write the method <code>add(Time offset)</code> which adds the seconds together and makes sure the result is 59 or less (incrementing the minutes as needed), adds the minutes together and makes sure the result is 59 or less (increments the hours as needed), and adds the hours together (resetting the hours to 0 if it reaches 24).

# Credit
RunestoneInteractive.com
