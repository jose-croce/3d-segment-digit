/*
 * seg_digit.scad : 7 segment and 16 segment digit generation library
 * 
 * Author : Jose Ignacio Croce Busquets <jose.croce@gmail.com>
 *
 * Date : 08-DEC-2013
 *
 * Usage
 * The module contains the following public methods
 *
 * digit7_str(s, h)  Writes a string from "0123456789ABCDEFabcdef" characters
 *                   as a 7 digit display of the specified height.
 * digit7_int(v, h)  Writes an integer value in decimal representation
 *                   as a 7 digit display of the specified height.
 */

/* Segment length based on digit height */
function segment_length(height) = height / 2;

/* digit height based on segment length */
function digit_height(seglen) = 2 * seglen;

/* Segment radius based on segment length */
function segment_radius(seglen) = seglen / 10;

/* Position (horiz) for next digit based on digit length */
function digit_spacing(height) = segment_length(height) * 1.5;

/*
 * Creates a 7 segment display for the given string
 *   s    String to display. Characters should be within "0"-"9", "A"-"F",
 *        "a"-"f" ranges. Otherwise nothing is shown.
 *   h    digit height
 */
module digit7_str(s, h)
{
 for(i = [ 0 : len(s) ])
 {
   translate(v = [ i * digit_spacing(100), 0, 0 ])
     put_digit7(s[i], h);
 }
}

/*
 * Creates a 7 segment display for an integer value (decimal)
 *   v    Value to display
 *   h    digit height
 */
module digit7_int(v, h)
{
 digit7_str(str(v), h);
}

/*
 * Creates a 7 segment display for the given character
 *   c    Character to display. Should be within "0"-"9", "A"-"F", "a"-"f"
 *        ranges. Otherwise nothing is shown.
 *   h    digit height
 */
module put_digit7(c, h)
{
 if (c == "0") digit7_0(h);
 if (c == "1") digit7_1(h);
 if (c == "2") digit7_2(h);
 if (c == "3") digit7_3(h);
 if (c == "4") digit7_4(h);
 if (c == "5") digit7_5(h);
 if (c == "6") digit7_6(h);
 if (c == "7") digit7_7(h);
 if (c == "8") digit7_8(h);
 if (c == "9") digit7_9(h);
 if (c == "A" || c == "a") digit7_A(h);
 if (c == "B" || c == "b") digit7_B(h);
 if (c == "C" || c == "c") digit7_C(h);
 if (c == "D" || c == "d") digit7_D(h);
 if (c == "E" || c == "e") digit7_E(h);
 if (c == "F" || c == "f") digit7_F(h);
}

//---------------------------------------------------------------------------
// End of public modules - Just jump to the examples
//---------------------------------------------------------------------------

/* Draws a single segment
 *  h    segment length
 *  r    segment radius (default = segment_radius(h))
 */
module segment(h, r = 0)
{
 radius = (r == 0) ? segment_radius(h) : r;
 length = (h > 2 * radius) ? h - 2 * radius : 0;
 polyhedron(points = [ [                   0,       0,      0 ]
                     , [     radius         ,  radius,      0 ]
                     , [     radius + length,  radius,      0 ]
                     , [ 2 * radius + length,       0,      0 ]
                     , [     radius + length, -radius,      0 ]
                     , [     radius         , -radius,      0 ]
                     , [     radius         ,       0, radius ]
                     , [     radius + length,       0, radius ]
                     ]
       , triangles = [ [ 0, 1, 6 ]
                     , [ 1, 2, 6 ]
                     , [ 2, 7, 6 ]
                     , [ 2, 3, 7 ]
                     , [ 3, 4, 7 ]
                     , [ 4, 5, 7 ]
                     , [ 5, 6, 7 ]
                     , [ 0, 6, 5 ]
                     , [ 0, 5, 1 ]
                     , [ 1, 5, 4 ]
                     , [ 1, 4, 2 ]
                     , [ 2, 4, 3 ]
                     ]);
}

/* Draws A segment (top)
 *  h    segment length
 */
module segment_a(h)
{
 translate(v = [ 0, digit_height(h), 0 ])
   segment(h);
}

/* Draws B segment (right top)
 *  h    segment length
 */
module segment_b(h)
{
 translate(v = [ 0, h, 0 ])
   segment_c(h);
}

/* Draws C segment (right bottom)
 *  h    segment length
 */
module segment_c(h)
{
 translate(v = [ h, h, 0 ])
   rotate(a = [ 0, 0, 270 ])
     segment(h);
}

/* Draws D segment (bottom)
 *  h    segment length
 */
module segment_d(h)
{
 segment(h);
}

/* Draws E segment (left bottom)
 *  h    segment length
 */
module segment_e(h)
{
 rotate(a = [ 0, 0, 90 ])
   segment(h);
}

/* Draws F segment (left top)
 *  h    segment length
 */
module segment_f(h)
{
 translate(v = [ 0, h, 0 ])
   segment_e(h);
}

/* Draws G segment (middle)
 *  h    segment length
 */
module segment_g(h)
{
 translate(v = [ 0, h, 0 ])
   segment_d(h);
}

/* Draws 0 in a 7 segment digit
 *  h    digit length
 */
module digit7_0(h)
{
 segment_a(segment_length(h));
 segment_b(segment_length(h));
 segment_c(segment_length(h));
 segment_d(segment_length(h));
 segment_e(segment_length(h));
 segment_f(segment_length(h));
}

/* Draws 1 in a 7 segment digit
 *  h    digit length
 */
module digit7_1(h)
{
 segment_b(segment_length(h));
 segment_c(segment_length(h));
}

/* Draws 2 in a 7 segment digit
 *  h    digit length
 */
module digit7_2(h)
{
 segment_a(segment_length(h));
 segment_b(segment_length(h));
 segment_d(segment_length(h));
 segment_e(segment_length(h));
 segment_g(segment_length(h));
}

/* Draws 3 in a 7 segment digit
 *  h    digit length
 */
module digit7_3(h)
{
 segment_a(segment_length(h));
 segment_b(segment_length(h));
 segment_c(segment_length(h));
 segment_d(segment_length(h));
 segment_g(segment_length(h));
}

/* Draws 4 in a 7 segment digit
 *  h    digit length
 */
module digit7_4(h)
{
 segment_b(segment_length(h));
 segment_c(segment_length(h));
 segment_f(segment_length(h));
 segment_g(segment_length(h));
}

/* Draws 5 in a 7 segment digit
 *  h    digit length
 */
module digit7_5(h)
{
 segment_a(segment_length(h));
 segment_c(segment_length(h));
 segment_d(segment_length(h));
 segment_f(segment_length(h));
 segment_g(segment_length(h));
}

/* Draws 6 in a 7 segment digit
 *  h    digit length
 */
module digit7_6(h)
{
 segment_a(segment_length(h));
 segment_c(segment_length(h));
 segment_d(segment_length(h));
 segment_e(segment_length(h));
 segment_f(segment_length(h));
 segment_g(segment_length(h));
}

/* Draws 7 in a 7 segment digit
 *  h    digit length
 */
module digit7_7(h)
{
 segment_a(segment_length(h));
 segment_b(segment_length(h));
 segment_c(segment_length(h));
}

/* Draws 8 in a 7 segment digit
 *  h    digit length
 */
module digit7_8(h)
{
 segment_a(segment_length(h));
 segment_b(segment_length(h));
 segment_c(segment_length(h));
 segment_d(segment_length(h));
 segment_e(segment_length(h));
 segment_f(segment_length(h));
 segment_g(segment_length(h));
}

/* Draws 9 in a 7 segment digit
 *  h    digit length
 */
module digit7_9(h)
{
 segment_a(segment_length(h));
 segment_b(segment_length(h));
 segment_c(segment_length(h));
 segment_f(segment_length(h));
 segment_g(segment_length(h));
}

/* Draws A in a 7 segment digit
 *  h    digit length
 */
module digit7_A(h)
{
 segment_a(segment_length(h));
 segment_b(segment_length(h));
 segment_c(segment_length(h));
 segment_e(segment_length(h));
 segment_f(segment_length(h));
 segment_g(segment_length(h));
}

/* Draws b in a 7 segment digit
 *  h    digit length
 */
module digit7_B(h)
{
 segment_c(segment_length(h));
 segment_d(segment_length(h));
 segment_e(segment_length(h));
 segment_f(segment_length(h));
 segment_g(segment_length(h));
}

/* Draws C in a 7 segment digit
 *  h    digit length
 */
module digit7_C(h)
{
 segment_a(segment_length(h));
 segment_d(segment_length(h));
 segment_e(segment_length(h));
 segment_f(segment_length(h));
}

/* Draws d in a 7 segment digit
 *  h    digit length
 */
module digit7_D(h)
{
 segment_b(segment_length(h));
 segment_c(segment_length(h));
 segment_d(segment_length(h));
 segment_e(segment_length(h));
 segment_g(segment_length(h));
}

/* Draws E in a 7 segment digit
 *  h    digit length
 */
module digit7_E(h)
{
 segment_a(segment_length(h));
 segment_d(segment_length(h));
 segment_e(segment_length(h));
 segment_f(segment_length(h));
 segment_g(segment_length(h));
}

/* Draws F in a 7 segment digit
 *  h    digit length
 */
module digit7_F(h)
{
 segment_a(segment_length(h));
 segment_e(segment_length(h));
 segment_f(segment_length(h));
 segment_g(segment_length(h));
}

//---------------------------------------------------------------------------
// Examples
//---------------------------------------------------------------------------

translate(v = [ 0, 200, 0 ])
  digit7_str("0123456789ABCDEF", 100);
digit7_int(65535, 100);

echo(7.3 % 1);

/* EOF : seg_digit.sca.scad d */
