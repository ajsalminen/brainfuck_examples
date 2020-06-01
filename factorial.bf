Simple BrainFuck program to calculate a factorial

Note that with one-byte data the highest factorial that doesn't overflow is 5!


The following describes what each byte of data is used for in the program:
m1: initial input
m2: factorial loop
m3: factorial loop helper
m4: multiplication input
m5: multiplication input/result
m6: multiplication result


Set first byte to what number we want to calculate the factorial for:
+++++

Copy m1 to m2 for use by loop and decrease the value by 2 to end loop at correct
point: the loop counter at m2 reaches zero when the last factorial term is one

Initialize data for multiplication by setting m5 to the highest term of the
factorial (in other words copy the value of m1 to m5)

This achieves the two tasks described above:
[>+>>>+<<<<-]>--


The top level loop takes care of setting the data bytes the multiplication uses
in m4 and m5 to the correct values for calculating a factorial and continues
until the factorial is complete

The result of each multiplication is moved from m6 to m5 at the end of the loop
so that calculating the factorial can continue by multiplying that result by the
next factorial term

Top loop starts here with m2 as the loop counter:
[

  The multiplication term at m4 is set based on the loop counter at m2 by copying
  the value of the loop counter to it and adding one

  The value of m2 is also copied to m3 so it can be rewritten

  The following line makes the two copies of m2 described above:
  [>+>+<<-]>>+

  Now that m4 has been set we can move the loop counter value back to m2 from m3:
  <[<+>-]

  For the multiplication we add the second term to the sum the number of  times
  specified by the first term

  (3*2) becomes (2 plus 2 plus 2) for example

  The outer multiplication loop uses the first multiplication term at m4 as
  the loop counter

  It uses the inner loop to add the value of the second term to the sum every
  cycle of the loop to complete the multiplication

  This begins the loop at m4:
  >[


    m5 is the second multiplication term and we need to copy it to another data byte
    so that we use it as the loop counter for the inner loop

    Here we copy the value of m5 to m7 and m8 which clears m5
      >[>>+>+<<<-]

    Then restore the value of m5 by moving it back from m8
    >>>[<<<+>>>-]

    Now we have a copy of the value of the second multiplication term so we can
    add it to the sum of the multiplication stored at m6

    The inner loop of the multiplication uses the value of the second multiplication
    term that we copied from m5 to m7 as the counter

    It adds the value stored in m7 to the sum at m6

    The inner loop of the multiplication is started here at m7:
    <[<+>-]

    At the end of the outer multiplication loop we decrement the loop counter at m4:
    <<<-]

  This completes the multiplication

  We empty the second term of the multiplication at m5 so we can replace the term
  with the result of the previous multiplication
  >[-]

  Next we move the multiplication result from m6 to be the second term at m5 for
  the next round of the factorial loop
  >[<+>-]

  We go back to m2 which is the loop counter for the factorial loop and decrement
  the value at the end of the loop
  <<<<-]
