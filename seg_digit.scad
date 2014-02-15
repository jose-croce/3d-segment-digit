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
 * digit7_str(s, h, on)
 *                     Writes a string from "0123456789ABCDEFabcdef" chars
 *                     as a 7 digit display of the specified height.
 *                     on = on-relief/low-relief flag
 * digit7_int(v, h)    Writes an integer value in decimal representation
 *                     as a 7 digit display of the specified height.
 * digit7_float(v, h)  Writes a floating point value in decimal representation
 *                     as a 7 digit display of the specified height.
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
    translate(v = [ search(".", s)[0] * digit_spacing(h), 0, 0 ])
      segment_dp(h, on);
    for (i = [ search(".", s)[0] : len(s) ]) {
        translate(v = [ (i - 1) * digit_spacing(h) + segment_length(h) * 0.5
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

/* Draws a single segment
 *  h    segment length
 *  r    segment radius (default = segment_radius(h))
 *  on   on-relief/low-relief flag
 */
module segment(h, r = 0, on = true)
{
 radius = (r == 0) ? segment_radius(h) : r;
 length = (h > 2 * radius) ? h - 2 * radius : 0;
 if (on)
 {
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
 } else {
  polyhedron(points = [ [                   0,       0,       0 ]
                      , [     radius         ,  radius,       0 ]
                      , [     radius + length,  radius,       0 ]
                      , [ 2 * radius + length,       0,       0 ]
                      , [     radius + length, -radius,       0 ]
                      , [     radius         , -radius,       0 ]
                      , [     radius         ,       0, -radius ]
                      , [     radius + length,       0, -radius ]
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
  linear_extrude(height = radius)
    polygon(points = [ [ 0                  ,        0]
                     , [     radius         ,  radius ]
                     , [     radius + length,  radius ]
                     , [ 2 * radius + length,       0 ]
                     , [     radius + length, -radius ]
                     , [     radius         , -radius ]
                     ]
           , paths = [ [ 0, 1, 2, 3, 4, 5 ] ]);
 }
}

/*
 * Draws a decimal point
 *   h   Digit height
 *  on   on-relief/low-relief flag
 */
module segment_dp(h, on = true)
{
 radius = segment_radius(segment_length(h));
 if (on)
 {
  polyhedron(points = [ [          0,          0,      0 ]
                      , [          0, 2 * radius,      0 ]
                      , [ 2 * radius, 2 * radius,      0 ]
                      , [ 2 * radius,          0,      0 ]
                      , [     radius,     radius, radius ]
                      ]
        , triangles = [ [ 0, 1, 4 ]
                      , [ 1, 2, 4 ]
                      , [ 2, 3, 4 ]
                      , [ 0, 4, 3 ]
                      , [ 0, 3, 1 ]
                      , [ 1, 3, 2 ]
                      ]);
 } else {
  polyhedron(points = [ [          0,          0,       0 ]
                      , [          0, 2 * radius,       0 ]
                      , [ 2 * radius, 2 * radius,       0 ]
                      , [ 2 * radius,          0,       0 ]
                      , [     radius,     radius, -radius ]
                      ]
        , triangles = [ [ 0, 1, 4 ]
                      , [ 1, 2, 4 ]
                      , [ 2, 3, 4 ]
                      , [ 0, 4, 3 ]
                      , [ 0, 3, 1 ]
                      , [ 1, 3, 2 ]
                      ]);
  cube(size= [ 2 * radius, 2 * radius, radius ], center = false);
 }
}

/* Draws A segment (top)
 *  h    segment length
 *  on   on-relief/low-relief flag
 */
module segment_a(h, on = true)
{
 translate(v = [ 0, digit_height(h), 0 ])
   segment(h, on = on);
}

/* Draws B segment (right top)
 *  h    segment length
 *  on   on-relief/low-relief flag
 */
module segment_b(h, on = true)
{
 translate(v = [ 0, h, 0 ])
   segment_c(h, on = on);
}

/* Draws C segment (right bottom)
 *  h    segment length
 *  on   on-relief/low-relief flag
 */
module segment_c(h, on = true)
{
 translate(v = [ h, h, 0 ])
   rotate(a = [ 0, 0, 270 ])
     segment(h, on = on);
}

/* Draws D segment (bottom)
 *  h    segment length
 *  on   on-relief/low-relief flag
 */
module segment_d(h, on = true)
{
 segment(h, on = on);
}

/* Draws E segment (left bottom)
 *  h    segment length
 *  on   on-relief/low-relief flag
 */
module segment_e(h, on = true)
{
 rotate(a = [ 0, 0, 90 ])
   segment(h, on = on);
}

/* Draws F segment (left top)
 *  h    segment length
 *  on   on-relief/low-relief flag
 */
module segment_f(h, on = true)
{
 translate(v = [ 0, h, 0 ])
   segment_e(h, on = on);
}

/* Draws G segment (middle)
 *  h    segment length
 *  on   on-relief/low-relief flag
 */
module segment_g(h, on = true)
{
 translate(v = [ 0, h, 0 ])
   segment_d(h, on = on);
}

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

//---------------------------------------------------------------------------
// Examples
//---------------------------------------------------------------------------

translate(v = [ 0, 300, 0 ])
  digit7_str("0123456789ABCDEF", 100);
translate(v = [ 0, 150, 0 ])
  digit7_int(65535, 100);
digit7_float(123.45, 100);
translate(v = [ 0, -150, 0 ])
  digit7_str("0123456789ABCDEF", 100, on = false);
translate(v = [ 0, -300, 0 ])
  digit7_int(65535, 100, on = false);
translate(v = [ 0, -450, 0 ])
  digit7_float(123.45, 100, on = false);

/* EOF : seg_digit.scad */
