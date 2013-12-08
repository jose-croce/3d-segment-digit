/*
 * seg_digit.scad : 7 segment and 16 segment digit generation library
 * 
 * Author : Jose Ignacio Croce Busquets <jose.croce@gmail.com>
 *
 * Date : 08-DEC-2013
 *
 */

/* Segment length based on digit height */
function segment_length(height) = height / 2;

/* digit height based on segment length */
function digit_height(seglen) = 2 * seglen;

/* Segment radius based on segment length */
function segment_radius(seglen) = seglen / 10;

/* Position (horiz) for next digit based on digit length */
function digit_spacing(height) = segment_length(height) * 1.5;

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

digit7_0(100);
translate(v = [ digit_spacing(100), 0, 0 ])
  digit7_1(100);
translate(v = [ 2 * digit_spacing(100), 0, 0 ])
  digit7_2(100);
translate(v = [ 3 * digit_spacing(100), 0, 0 ])
  digit7_3(100);
translate(v = [ 4 * digit_spacing(100), 0, 0 ])
  digit7_4(100);
translate(v = [ 5 * digit_spacing(100), 0, 0 ])
  digit7_5(100);
translate(v = [ 6 * digit_spacing(100), 0, 0 ])
  digit7_6(100);
translate(v = [ 7 * digit_spacing(100), 0, 0 ])
  digit7_7(100);
translate(v = [ 8 * digit_spacing(100), 0, 0 ])
  digit7_8(100);
translate(v = [ 9 * digit_spacing(100), 0, 0 ])
  digit7_9(100);
translate(v = [ 10 * digit_spacing(100), 0, 0 ])
  digit7_A(100);
translate(v = [ 11 * digit_spacing(100), 0, 0 ])
  digit7_B(100);
translate(v = [ 12 * digit_spacing(100), 0, 0 ])
  digit7_C(100);
translate(v = [ 13 * digit_spacing(100), 0, 0 ])
  digit7_D(100);
translate(v = [ 14 * digit_spacing(100), 0, 0 ])
  digit7_E(100);
translate(v = [ 15 * digit_spacing(100), 0, 0 ])
  digit7_F(100);

/* EOF : seg_digit.sca.scad d */
