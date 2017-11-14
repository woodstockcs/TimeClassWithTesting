int x = 20;
int incrX = 100;
int bigX = incrX + 90;
int y = 40;
int incrY = 20;
String expected;
String provided;
Time time;
Time time1;
Time time2;

void setup() {
  size(600, 675);

  // set up display of test cases for pad()
  textSize(20);
  fill(0);
  text("TEST SUITE: create new Time then print with pad(...)", x, y);
  stroke(0);
  line(x, y + 8, x + 550, y + 8);
  y += incrY + 10;
  textSize(16);
  text("input", x, y);
  x += bigX;
  text("found", x, y);
  x += incrX;
  text("expected", x, y);
  x += incrX;
  text("conclusion", x, y);

  // test case: check all zeros
  expected = "00:00:00";
  provided = "(0, 0, 0)";
  time = new Time(0, 0, 0);
  printTestCase(provided, time.toString(), expected);

  // test case: check all ones
  expected = "01:01:01";
  provided = "(1, 1, 1)";
  time = new Time(1, 1, 1);
  printTestCase(provided, time.toString(), expected);

  // test case: check all tens
  expected = "10:10:10";
  provided = "(10, 10, 10)";
  time = new Time(10, 10, 10);
  printTestCase(provided, time.toString(), expected);

  // test case: check mix
  expected = "03:10:03";
  provided = "(3, 10, 3)";
  time = new Time(3, 10, 3);
  printTestCase(provided, time.toString(), expected);

  // test case: check all max values
  expected = "23:59:59";
  provided = "(23, 59, 59)";
  time = new Time(23, 59, 59);
  printTestCase(provided, time.toString(), expected);

  // set up display of test cases for tick()
  textSize(20);
  fill(0);
  x = 20;
  y += (incrY * 3);
  text("TEST SUITE: create new Time then call tick()", x, y);
  stroke(0);
  line(x, y + 8, x + 550, y + 8);
  y += incrY + 10;
  textSize(16);
  text("input", x, y);
  x += bigX;
  text("found", x, y);
  x += incrX;
  text("expected", x, y);
  x += incrX;
  text("conclusion", x, y);

  // test case: check simple increment of one second
  expected = "00:00:01";
  provided = "(0, 0, 0)";
  time = new Time(0, 0, 0);
  time.tick();
  printTestCase(provided, time.toString(), expected);

  // test case: check simple increment of one second
  expected = "00:00:59";
  provided = "(0, 0, 58)";
  time = new Time(0, 0, 58);
  time.tick();
  printTestCase(provided, time.toString(), expected);

  // test case: check minute rollover
  expected = "00:01:00";
  provided = "(0, 0, 59)";
  time = new Time(0, 0, 59);
  time.tick();
  printTestCase(provided, time.toString(), expected);

  // test case: check minute rollover
  expected = "00:59:00";
  provided = "(0, 58, 59)";
  time = new Time(0, 58, 59);
  time.tick();
  printTestCase(provided, time.toString(), expected);

  // test case: check hour rollover
  expected = "01:00:00";
  provided = "(0, 59, 59)";
  time = new Time(0, 59, 59);
  time.tick();
  printTestCase(provided, time.toString(), expected);

  // test case: check hour rollover
  expected = "00:00:00";
  provided = "(23, 59, 59)";
  time = new Time(23, 59, 59);
  time.tick();
  printTestCase(provided, time.toString(), expected);

  // set up display of test cases for add()
  textSize(20);
  fill(0);
  x = 20;
  y += (incrY * 3);
  text("TEST SUITE: create new Time then call add(...)", x, y);
  stroke(0);
  line(x, y + 8, x + 550, y + 8);
  y += incrY + 10;
  textSize(16);
  text("input", x, y);
  x += bigX;
  text("found", x, y);
  x += incrX;
  text("expected", x, y);
  x += incrX;
  text("conclusion", x, y);

  // test case: check simple add
  expected = "03:03:03";
  provided = "(1, 1, 1).add(2, 2, 2)";
  time1 = new Time(1, 1, 1);
  time2 = new Time(2, 2, 2);
  time1.add(time2);
  printTestCase(provided, time1.toString(), expected);

  // test case: check add with seconds rollover
  expected = "00:01:00";
  provided = "(0, 0, 59).add(0, 0, 1)";
  time1 = new Time(0, 0, 59);
  time2 = new Time(0, 0, 1);
  time1.add(time2);
  printTestCase(provided, time1.toString(), expected);

  // test case: check simple add
  expected = "00:59:01";
  provided = "(0, 59, 0).add(0, 0, 1)";
  time1 = new Time(0, 59, 0);
  time2 = new Time(0, 0, 1);
  time1.add(time2);
  printTestCase(provided, time1.toString(), expected);

  // test case: check add with seconds and minutes rollover
  expected = "01:00:00";
  provided = "(0, 59, 59).add(0, 0, 1)";
  time1 = new Time(0, 59, 59);
  time2 = new Time(0, 0, 1);
  time1.add(time2);
  printTestCase(provided, time1.toString(), expected);

  // test case: check add hour with full rollover
  expected = "00:00:00";
  provided = "(23, 0, 0).add(1, 0, 0)";
  time1 = new Time(23, 0, 0);
  time2 = new Time(1, 0, 0);
  time1.add(time2);
  printTestCase(provided, time1.toString(), expected);

  // test case: check complex add with full rollover
  expected = "23:59:58";
  provided = "(23, 59, 59).add(23, 59, 59)";
  time1 = new Time(23, 59, 59);
  time2 = new Time(23, 59, 59);
  time1.add(time2);
  printTestCase(provided, time1.toString(), expected);
}

void printTestCase(String input, String found, String expected) {
  textSize(12);
  fill(50);
  stroke(150);
  x = 24;
  y += incrY;
  text(input, x, y);
  line(x + textWidth(input) + 8, y - 5, x + bigX - 10, y - 5);
  x += bigX;
  text(found, x, y);
  line(x + textWidth(found) + 8, y - 5, x + incrX - 10, y - 5);
  x += incrX;
  text(expected, x, y);
  line(x + textWidth(expected) + 8, y - 5, x + incrX - 10, y - 5);
  x += incrX;
  if (found.equals(expected)) {
    fill(0, 200, 0);
    text("PASSED", x, y);
  } else {
    fill(255, 0, 0);
    text("FAILED", x, y);
  }
}

/**
 * Objects of the Time class hold a time value for
 * a European-style 24 hour clock.
 * The value consists of hours, minutes and seconds.
 * The range of the value is 00:00:00 (midnight)
 * to 23:59:59 (one second before midnight).
 */
class Time
{
  // The values of the three parts of the time
  private int hours;
  private int minutes;
  private int seconds;

  /**
   * Creates a new Time object set to 00:00:00.
   * Do not change this constructor.
   */
  public Time()
  {
    this.hours = 0;
    this.minutes = 0;
    this.seconds = 0;
  }

  /**
   * Constructor for objects of class Time.
   * Creates a new Time object set to h:m:s.
   * Assumes, without checking, that the parameter values are
   * within bounds.
   * For this task, you don't need to worry about invalid parameter values.
   * Do not change this constructor.
   */
  public Time(int h, int m, int s)
  {
    this.hours = h;
    this.minutes = m;
    this.seconds = s;
  }

  /**
   * Add one second to the current time.
   * When the seconds value reaches 60, it rolls over to zero.
   * When the seconds roll over to zero, the minutes advance.
   * So 00:00:59 rolls over to 00:01:00.
   * When the minutes reach 60, they roll over and the hours advance.
   * So 00:59:59 rolls over to 01:00:00.
   * When the hours reach 24, they roll over to zero.
   * So 23:59:59 rolls over to 00:00:00.
   */
  public void tick()
  {
    // Part b: complete the tick() method
  }

  /**
   * Add an offset to this Time.
   * Rolls over the hours, minutes and seconds fields when needed.
   */
  public void add(Time offset)
  {
    // Part c: complete the add(...) method
  }

  public String toString()
  {
    return pad(hours) + ":" + pad(minutes) + ":" + pad(seconds);
  }

  /**
   * Returns a string representing the argument value, adding a leading
   * "0" if needed to make it at least two digits long.
   * Do not change this.
   */
  private String pad(int value)
  {
    // Part a: complete the pad(...) method
    return "" + value;
  }
}
