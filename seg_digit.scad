/*
 * seg_digit.scad : 7 segment and 16 segment digit generation library
 * 
 * Author : Jose Ignacio Croce Busquets <jose.croce@gmail.com>
 *
 * Date : 15-FEB-2014
 *
 * Usage
 * The module contains the following public methods
 *
 * segment_a(size, on = true)
 * segment_b(size, on = true)
 * segment_c(size, on = true)
 * segment_d(size, on = true)
 * segment_e(size, on = true)
 * segment_f(size, on = true)
 * segment_g(size, on = true) Write the corresponding segment from a 7
 *                            segment display
 *                            size = segment size
 *                            on = on-relief/low-relief flag
 *
 * segment_dp(digit_size, on = true)
 *                            Write the decimal point for a 7 segment display
 *                            digit_size = whole digit size
 *                            on = on-relief/low-relief flag
 */

/* Segment length based on digit height */
function segment_length(height) = height / 2;

/* digit height based on segment length */
function digit_height(seglen) = 2 * seglen;

/* Segment radius based on segment length */
function segment_radius(seglen) = seglen / 10;

/* Position (horiz) for next digit based on digit length */
function digit_spacing(height) = segment_length(height) * 1.5;

/* Draws A segment (top)
 *  size segment size
 *  on   on-relief/low-relief flag
 */
module segment_a(size, on = true)
{
 translate(v = [ 0, digit_height(size), 0 ])
   segment(size, on = on);
}

/* Draws B segment (right top)
 *  size segment size
 *  on   on-relief/low-relief flag
 */
module segment_b(size, on = true)
{
 translate(v = [ 0, size, 0 ])
   segment_c(size, on = on);
}

/* Draws C segment (right bottom)
 *  size segment size
 *  on   on-relief/low-relief flag
 */
module segment_c(size, on = true)
{
 translate(v = [ size, size, 0 ])
   rotate(a = [ 0, 0, 270 ])
     segment(size, on = on);
}

/* Draws D segment (bottom)
 *  size segment size
 *  on   on-relief/low-relief flag
 */
module segment_d(size, on = true)
{
 segment(size, on = on);
}

/* Draws E segment (left bottom)
 *  size segment size
 *  on   on-relief/low-relief flag
 */
module segment_e(size, on = true)
{
 rotate(a = [ 0, 0, 90 ])
   segment(size, on = on);
}

/* Draws F segment (left top)
 *  size segment size
 *  on   on-relief/low-relief flag
 */
module segment_f(size, on = true)
{
 translate(v = [ 0, size, 0 ])
   segment_e(size, on = on);
}

/* Draws G segment (middle)
 *  size segment size
 *  on   on-relief/low-relief flag
 */
module segment_g(size, on = true)
{
 translate(v = [ 0, size, 0 ])
   segment_d(size, on = on);
}

/*
 * Draws a decimal point
 * digit_size whole digit size
 *         on on-relief/low-relief flag
 */
module segment_dp(digit_size, on = true)
{
 radius = segment_radius(segment_length(digit_size));
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

//---------------------------------------------------------------------------
// End of public modules - Just jump to the examples
//---------------------------------------------------------------------------

/* Draws a single segment
 *  size segment size
 *  r    segment radius (default = segment_radius(h))
 *  on   on-relief/low-relief flag
 */
module segment(size, r = 0, on = true)
{
 radius = (r == 0) ? segment_radius(size) : r;
 length = (size > 2 * radius) ? size - 2 * radius : 0;
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

//---------------------------------------------------------------------------
// Examples
//---------------------------------------------------------------------------

ex_seglen = 100;	// segment length for all examples

// Base for on-relief examples
translate(v = [ 0, 0, -2 * segment_radius(digit_height(ex_seglen)) ])
  cube(size = [ 2 * digit_spacing(digit_height(ex_seglen))
              , 2 * digit_height(ex_seglen)
              , 2 * segment_radius(digit_height(ex_seglen))
              ]);

// On relief examples
translate(v = [ digit_spacing(digit_height(ex_seglen)) / 2
              , digit_height(ex_seglen) / 2
              , 0 ])
{
 segment_a(ex_seglen);
 segment_b(ex_seglen);
 segment_c(ex_seglen);
 segment_d(ex_seglen);
 segment_e(ex_seglen);
 segment_f(ex_seglen);
 segment_g(ex_seglen);
 translate(v = [ digit_spacing(digit_height(ex_seglen)), 0, 0 ])
   segment_dp(digit_height(ex_seglen));
}

// Low relief examples
// Low relief effect is performed by substracting from the base
translate(v = [ 2 * digit_spacing(digit_height(ex_seglen)), 0, 0 ])
  difference()
  {
    // Base for low-relief examples
   translate(v = [ 0, 0, -2 * segment_radius(digit_height(ex_seglen)) ])
      cube(size = [ 2 * digit_spacing(digit_height(ex_seglen))
                  , 2 * digit_height(ex_seglen)
                  , 2 * segment_radius(digit_height(ex_seglen))
                  ]);

    translate(v = [ digit_spacing(digit_height(ex_seglen)) / 2
                  , digit_height(ex_seglen) / 2
                  , 0 ])
    {
     segment_a(ex_seglen, on = false);
     segment_b(ex_seglen, on = false);
     segment_c(ex_seglen, on = false);
     segment_d(ex_seglen, on = false);
     segment_e(ex_seglen, on = false);
     segment_f(ex_seglen, on = false);
     segment_g(ex_seglen, on = false);
     translate(v = [ digit_spacing(digit_height(ex_seglen)), 0, 0 ])
       segment_dp(digit_height(ex_seglen));
    }
  }

/* EOF : seg_digit.scad */
