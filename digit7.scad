/*
 * digit7.scad : 7 segment digit generation library
 * 
 * Author : Jose Ignacio Croce Busquets <jose@crossforests.com>
 *
 * Date : 08-DEC-2013
 *
 * Copyright 2014, 2015 Jose Ignacio Croce Busquets
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * Usage
 * The module contains the following public methods
 *
 * digit7_str(s, h, on)
 *                     Writes a string from "0123456789ABCDEFabcdef" chars
 *                     as a 7 digit display of the specified height.
 *                     on = on-relief/low-relief flag
 * digit7_int(v, h)    Writes an integer value in decimal representation
 *                     as a 7 digit display of the specified height.
 * digit7_float(v, h)  Writes a floating point value in decimal representation
 *                     as a 7 digit display of the specified height.
 */

/* Include general definitions */
use <seg_digit.scad>

/*
 * Creates a 7 segment display for the given string
 *   s    String to display. Characters should be within "0"-"9", "A"-"F",
 *        "a"-"f" ranges. Otherwise nothing is shown.
 *   h    digit height
 *  on   on-relief/low-relief flag
 */
module digit7_str(s, h, on = true)
{
 for(i = [ 0 : len(s) ])
 {
   translate(v = [ i * digit_spacing(h), 0, 0 ])
     put_digit7(s[i], h, on);
 }
}

/*
 * Creates a 7 segment display for an integer value (decimal)
 *   v    Value to display
 *   h    digit height
 *   on   on-relief/low-relief flag
 */
module digit7_int(v, h, on = true)
{
 digit7_str(str(v), h, on);
}

/*
 * Creates a 7 segment display for a float value
 *   v    Value to display
 *   h    digit height
 *   on   on-relief/low-relief flag
 */
module digit7_float(v, h, on = true)
{
 s = str(v);
 if (search(".", s)[0] == undef) {
    digit7_str(s, h, on); // integer value
 } else {
    for (i = [ 0 : search(".", s)[0] - 1 ]) {
        translate(v = [ i * digit_spacing(h), 0, 0 ])
          put_digit7(s[i], h, on);
    }
    translate(v = [ (search(".", s)[0] - 1) * digit_spacing(h), 0, 0 ])
      put_digit7(s[i], h, on);
    for (i = [ search(".", s)[0] : len(s) ]) {
        translate(v = [ (i - 1) * digit_spacing(h)
                      , 0
                      , 0 ])
          put_digit7(s[i], h, on);
    }
 }
}

/*
 * Creates a 7 segment display for the given character
 *   c    Character to display. Should be within "0"-"9", "A"-"F", "a"-"f"
 *        ranges. Otherwise nothing is shown.
 *   h    digit height
 *   on   on-relief/low-relief flag
 */
module put_digit7(c, h, on = true)
{
 if (c == ".") digit7_P(h, on);
 if (c == "0") digit7_0(h, on);
 if (c == "1") digit7_1(h, on);
 if (c == "2") digit7_2(h, on);
 if (c == "3") digit7_3(h, on);
 if (c == "4") digit7_4(h, on);
 if (c == "5") digit7_5(h, on);
 if (c == "6") digit7_6(h, on);
 if (c == "7") digit7_7(h, on);
 if (c == "8") digit7_8(h, on);
 if (c == "9") digit7_9(h, on);
 if (c == "A" || c == "a") digit7_A(h, on);
 if (c == "B" || c == "b") digit7_B(h, on);
 if (c == "C" || c == "c") digit7_C(h, on);
 if (c == "D" || c == "d") digit7_D(h, on);
 if (c == "E" || c == "e") digit7_E(h, on);
 if (c == "F" || c == "f") digit7_F(h, on);
}

//---------------------------------------------------------------------------
// End of public modules - Just jump to the examples
//---------------------------------------------------------------------------

/* Draws 0 in a 7 segment digit
 *  h    digit length
 *  on   on-relief/low-relief flag
 */
module digit7_0(h, on = true)
{
 segment_a(segment_length(h), on);
 segment_b(segment_length(h), on);
 segment_c(segment_length(h), on);
 segment_d(segment_length(h), on);
 segment_e(segment_length(h), on);
 segment_f(segment_length(h), on);
}

/* Draws 1 in a 7 segment digit
 *  h    digit length
 *  on   on-relief/low-relief flag
 */
module digit7_1(h, on = true)
{
 segment_b(segment_length(h), on);
 segment_c(segment_length(h), on);
}

/* Draws 2 in a 7 segment digit
 *  h    digit length
 *  on   on-relief/low-relief flag
 */
module digit7_2(h, on = true)
{
 segment_a(segment_length(h), on);
 segment_b(segment_length(h), on);
 segment_d(segment_length(h), on);
 segment_e(segment_length(h), on);
 segment_g(segment_length(h), on);
}

/* Draws 3 in a 7 segment digit
 *  h    digit length
 *  on   on-relief/low-relief flag
 */
module digit7_3(h, on = true)
{
 segment_a(segment_length(h), on);
 segment_b(segment_length(h), on);
 segment_c(segment_length(h), on);
 segment_d(segment_length(h), on);
 segment_g(segment_length(h), on);
}

/* Draws 4 in a 7 segment digit
 *  h    digit length
 *  on   on-relief/low-relief flag
 */
module digit7_4(h, on = true)
{
 segment_b(segment_length(h), on);
 segment_c(segment_length(h), on);
 segment_f(segment_length(h), on);
 segment_g(segment_length(h), on);
}

/* Draws 5 in a 7 segment digit
 *  h    digit length
 *  on   on-relief/low-relief flag
 */
module digit7_5(h, on = true)
{
 segment_a(segment_length(h), on);
 segment_c(segment_length(h), on);
 segment_d(segment_length(h), on);
 segment_f(segment_length(h), on);
 segment_g(segment_length(h), on);
}

/* Draws 6 in a 7 segment digit
 *  h    digit length
 *  on   on-relief/low-relief flag
 */
module digit7_6(h, on = true)
{
 segment_a(segment_length(h), on);
 segment_c(segment_length(h), on);
 segment_d(segment_length(h), on);
 segment_e(segment_length(h), on);
 segment_f(segment_length(h), on);
 segment_g(segment_length(h), on);
}

/* Draws 7 in a 7 segment digit
 *  h    digit length
 *  on   on-relief/low-relief flag
 */
module digit7_7(h, on = true)
{
 segment_a(segment_length(h), on);
 segment_b(segment_length(h), on);
 segment_c(segment_length(h), on);
}

/* Draws 8 in a 7 segment digit
 *  h    digit length
 *  on   on-relief/low-relief flag
 */
module digit7_8(h, on = true)
{
 segment_a(segment_length(h), on);
 segment_b(segment_length(h), on);
 segment_c(segment_length(h), on);
 segment_d(segment_length(h), on);
 segment_e(segment_length(h), on);
 segment_f(segment_length(h), on);
 segment_g(segment_length(h), on);
}

/* Draws 9 in a 7 segment digit
 *  h    digit length
 *  on   on-relief/low-relief flag
 */
module digit7_9(h, on = true)
{
 segment_a(segment_length(h), on);
 segment_b(segment_length(h), on);
 segment_c(segment_length(h), on);
 segment_f(segment_length(h), on);
 segment_g(segment_length(h), on);
}

/* Draws A in a 7 segment digit
 *  h    digit length
 *  on   on-relief/low-relief flag
 */
module digit7_A(h, on = true)
{
 segment_a(segment_length(h), on);
 segment_b(segment_length(h), on);
 segment_c(segment_length(h), on);
 segment_e(segment_length(h), on);
 segment_f(segment_length(h), on);
 segment_g(segment_length(h), on);
}

/* Draws b in a 7 segment digit
 *  h    digit length
 *  on   on-relief/low-relief flag
 */
module digit7_B(h, on = true)
{
 segment_c(segment_length(h), on);
 segment_d(segment_length(h), on);
 segment_e(segment_length(h), on);
 segment_f(segment_length(h), on);
 segment_g(segment_length(h), on);
}

/* Draws C in a 7 segment digit
 *  h    digit length
 *  on   on-relief/low-relief flag
 */
module digit7_C(h, on = true)
{
 segment_a(segment_length(h), on);
 segment_d(segment_length(h), on);
 segment_e(segment_length(h), on);
 segment_f(segment_length(h), on);
}

/* Draws d in a 7 segment digit
 *  h    digit length
 *  on   on-relief/low-relief flag
 */
module digit7_D(h, on = true)
{
 segment_b(segment_length(h), on);
 segment_c(segment_length(h), on);
 segment_d(segment_length(h), on);
 segment_e(segment_length(h), on);
 segment_g(segment_length(h), on);
}

/* Draws E in a 7 segment digit
 *  h    digit length
 *  on   on-relief/low-relief flag
 */
module digit7_E(h, on = true)
{
 segment_a(segment_length(h), on);
 segment_d(segment_length(h), on);
 segment_e(segment_length(h), on);
 segment_f(segment_length(h), on);
 segment_g(segment_length(h), on);
}

/* Draws F in a 7 segment digit
 *  h    digit length
 *  on   on-relief/low-relief flag
 */
module digit7_F(h, on = true)
{
 segment_a(segment_length(h), on);
 segment_e(segment_length(h), on);
 segment_f(segment_length(h), on);
 segment_g(segment_length(h), on);
}

/* Draws a decimal point in a 7 segment digit
 *  h    digit length
 *  on   on-relief/low-relief flag
 */
module digit7_P(h, on = true)
{
 segment_p(segment_length(h), on);
}

//---------------------------------------------------------------------------
// Examples
//---------------------------------------------------------------------------

ex_height = 100;	// Digit height for all examples

// Base for on-relief examples
translate(v = [ 0, 0, -2 * segment_radius(ex_height) ])
  cube(size = [ (len("0123456789ABCDEF") + 2) * digit_spacing(ex_height)
              , 5 * ex_height
              , 2 * segment_radius(ex_height) 
              ]);

// On relief examples
translate(v = [ digit_spacing(ex_height), 3.5 * ex_height, 0 ])
  digit7_str("0123456789ABCDEF", ex_height);

translate(v = [ digit_spacing(ex_height), 2 * ex_height, 0 ])
  digit7_int(65535, ex_height);

translate(v = [ digit_spacing(ex_height), 0.5 * ex_height, 0 ])
  digit7_float(1234.56, ex_height);

// Low relief examples
// Low relief effect is performed by substracting from the base
translate(v = [ 0, -5 * ex_height, 0 ])
  difference()
  {
    // Base for low-relief examples
    translate(v = [ 0, 0, -2 * segment_radius(ex_height) ])
      cube(size = [ (len("0123456789ABCDEF") + 2) * digit_spacing(ex_height)
                  , 5 * ex_height
                  , 2 * segment_radius(ex_height) 
                  ]);

    translate(v = [ digit_spacing(ex_height), 3.5 * ex_height, 0 ])
      digit7_str("0123456789ABCDEF", ex_height, on = false);

    translate(v = [ digit_spacing(ex_height), 2 * ex_height, 0 ])
      digit7_int(65535, 100, on = false);

    translate(v = [ digit_spacing(ex_height), 0.5 * ex_height, 0 ])
      digit7_float(1234.56, 100, on = false);
  }

/* EOF : digit7.scad */
