/*
 * seg_digit.scad : 7 segment and 16 segment digit generation library
 * 
 * Author : Jose Ignacio Croce Busquets <jose.croce@gmail.com>
 *
 * Date : 15-FEB-2014
 *
 * Copyright 2014, 2015, 2016, 2017, 2018 Jose Ignacio Croce Busquets
 *
 * Update:
 *
 * 17FEB2018 Jose Ignacio Croce Busquets <jose.croce@gmail.com>
 *      New polyhedron syntax.
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
 * segment_a(size, on = true)
 * segment_b(size, on = true)
 * segment_c(size, on = true)
 * segment_d(size, on = true)
 * segment_e(size, on = true)
 * segment_f(size, on = true)
 * segment_g(size, on = true) Write the corresponding segment for a 7
 *                            segment display
 *                            size = segment size
 *                            on = on-relief/low-relief flag
 *
 * segment_a1(size, on = true)
 * segment_a2(size, on = true)
 * segment_d1(size, on = true)
 * segment_d2(size, on = true)
 * segment_g1(size, on = true)
 * segment_g2(size, on = true)
 * segment_h(size, on = true)
 * segment_i(size, on = true)
 * segment_j(size, on = true)
 * segment_k(size, on = true)
 * segment_l(size, on = true)
 * segment_m(size, on = true)  Write the aditional segments for a 16
 *                             segment display
 *                             size = segment size
 *                             on = on-relief/low-relief flag
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
function digit_spacing(height) = segment_length(height) + 
    6 * segment_radius(segment_length(height));

/* Draws A segment (top)
 *  size segment size
 *  on   on-relief/low-relief flag
 */
module segment_a(size, on = true)
{
    translate(v = [ 0, digit_height(size), 0 ]) segment(size, on = on);
}

/* Draws A1 segment (top)
 *  size segment size
 *  on   on-relief/low-relief flag
 */
module segment_a1(size, on = true)
{
    translate(v = [ 0, digit_height(size), 0 ])
        segment(size /2 , r = segment_radius(size), on = on);
}

/* Draws A2 segment (top)
 *  size segment size
 *  on   on-relief/low-relief flag
 */
module segment_a2(size, on = true)
{
    translate(v = [ size / 2, digit_height(size), 0 ])
        segment(size /2 , r = segment_radius(size), on = on);
}

/* Draws B segment (right top)
 *  size segment size
 *  on   on-relief/low-relief flag
 */
module segment_b(size, on = true)
{
    translate(v = [ 0, size, 0 ]) segment_c(size, on = on);
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

/* Draws D1 segment (top)
 *  size segment size
 *  on   on-relief/low-relief flag
 */
module segment_d1(size, on = true)
{
    segment(size /2 , r = segment_radius(size), on = on);
}

/* Draws D2 segment (top)
 *  size segment size
 *  on   on-relief/low-relief flag
 */
module segment_d2(size, on = true)
{
    translate(v = [ size / 2, 0, 0 ]) segment(size /2 , r = segment_radius(size), on = on);
}

/* Draws E segment (left bottom)
 *  size segment size
 *  on   on-relief/low-relief flag
 */
module segment_e(size, on = true)
{
    rotate(a = [ 0, 0, 90 ]) segment(size, on = on);
}

/* Draws F segment (left top)
 *  size segment size
 *  on   on-relief/low-relief flag
 */
module segment_f(size, on = true)
{
    translate(v = [ 0, size, 0 ]) segment_e(size, on = on);
}

/* Draws G segment (middle)
 *  size segment size
 *  on   on-relief/low-relief flag
 */
module segment_g(size, on = true)
{
    translate(v = [ 0, size, 0 ]) segment_d(size, on = on);
}

/* Draws G1 segment (top)
 *  size segment size
 *  on   on-relief/low-relief flag
 */
module segment_g1(size, on = true)
{
    translate(v = [ 0, size, 0 ]) segment(size /2 , r = segment_radius(size), on = on);
}

/* Draws G2 segment (top)
 *  size segment size
 *  on   on-relief/low-relief flag
 */
module segment_g2(size, on = true)
{
    translate(v = [ size / 2, size, 0 ]) segment(size /2 , r = segment_radius(size), on = on);
}

/* Draws H segment (upper left diagonal)
 *  size segment size
 *  on   on-relief/low-relief flag
 */
module segment_h(size, on = true)
{
    translate(v = [ size / 2, size, 0 ])
        mirror([ 1, 0, 0 ])
            diag_segment(size, on = on);
}

/* Draws I segment (middle top)
 *  size segment size
 *  on   on-relief/low-relief flag
 */
module segment_i(size, on = true)
{
    translate(v = [ -size / 2, 0, 0 ]) segment_b(size, on = on);
}

/* Draws J segment (upper right diagonal)
 *  size segment size
 *  on   on-relief/low-relief flag
 */
module segment_j(size, on = true)
{
    translate(v = [ size / 2, size, 0 ]) diag_segment(size, on = on);
}

/* Draws K segment (lower right diagonal)
 *  size segment size
 *  on   on-relief/low-relief flag
 */
module segment_k(size, on = true)
{
    translate(v = [ size, 0, 0 ])
        mirror([ 1, 0, 0 ])
            diag_segment(size, on = on);
}

/* Draws L segment (middle bottom)
 *  size segment size
 *  on   on-relief/low-relief flag
 */
module segment_l(size, on = true)
{
    translate(v = [ -size / 2, 0, 0 ]) segment_c(size, on = on);
}

/* Draws M segment (lower left diagonal)
 *  size segment size
 *  on   on-relief/low-relief flag
 */
module segment_m(size, on = true)
{
    diag_segment(size, on = on);
}

/*
 * Place the decimal point at the end of the character
 * size segment size
 * on on-relief/low-relief flag
 */
module segment_p(size, on = true)
{
    radius = segment_radius(size);
    translate(v = [ size + radius, 0, 0 ]) decimal_point(size, on = on);
}

//---------------------------------------------------------------------------
// End of public modules - Just jump to the examples
//---------------------------------------------------------------------------

/*
 * Draws a decimal point
 * size segment size
 * on on-relief/low-relief flag
 */
module decimal_point(size, on = true)
{
    radius = segment_radius(size);
    if (on)
    {
        translate(v = [ radius, 0, 0 ])
            polyhedron(
                points = [
                    [ -radius, -radius,      0 ],
                    [ -radius,  radius,      0 ],
                    [  radius,  radius,      0 ],
                    [  radius, -radius,      0 ],
                    [       0,       0, radius ]
                ],
                faces = [
                    [ 0, 1, 4 ],
                    [ 1, 2, 4 ],
                    [ 2, 3, 4 ],
                    [ 3, 0, 4 ],
                    [ 0, 1, 2, 3]
                ]
            );
    } else {
        translate(v = [ radius, 0, 0 ])
        {
            polyhedron(
                points = [
                    [ -radius, -radius,       0 ],
                    [ -radius,  radius,       0 ],
                    [  radius,  radius,       0 ],
                    [  radius, -radius,       0 ],
                    [       0,       0, -radius ]
                ],
                faces = [
                    [ 0, 1, 4 ],
                    [ 1, 2, 4 ],
                    [ 2, 3, 4 ],
                    [ 3, 0, 4 ],
                    [ 0, 1, 2, 3 ]
                ]
            );
            translate(v = [ 0, 0, radius / 2 ])
                cube(size= [ 2 * radius, 2 * radius, radius ], center = true);
        }
    }
}

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
        polyhedron(
            points = [
                [ 0, 0, 0 ],
                [ radius, radius, 0 ],
                [ radius + length, radius, 0 ],
                [ 2 * radius + length, 0, 0 ],
                [ radius + length, -radius, 0 ],
                [ radius, -radius, 0 ],
                [ radius, 0, radius ],
                [ radius + length, 0, radius ]
            ],
            faces = [
                [ 0, 1, 6 ],
                [ 1, 2, 7, 6 ],
                [ 2, 3, 7 ],
                [ 3, 4, 7 ],
                [ 4, 5, 6, 7 ],
                [ 5, 0, 6 ],
                [ 0, 5, 4, 3, 2, 1 ]
            ]
        );
    } else {
        polyhedron(
            points = [
                [ 0, 0, 0 ],
                [ radius, radius, 0 ],
                [ radius + length, radius, 0 ],
                [ 2 * radius + length, 0, 0 ],
                [ radius + length, -radius, 0 ],
                [ radius, -radius, 0 ],
                [ radius, 0, -radius ],
                [ radius + length, 0, -radius ]
            ],
            faces = [
                [ 0, 1, 2, 3, 4, 5 ],
                [ 1, 0, 6 ],
                [ 2, 1, 6, 7 ], 
                [ 2, 7, 3 ],
                [ 4, 3, 7 ],
                [ 5, 4, 7, 6 ],
                [ 0, 5, 6 ]
            ]
        );
        linear_extrude(height = radius)
            polygon(
                points = [
                    [ 0, 0 ],
                    [ radius,  radius ],
                    [ radius + length,  radius ],
                    [ 2 * radius + length, 0 ],
                    [ radius + length, -radius ],
                    [ radius, -radius ]
                ],
                paths = [
                    [ 0, 1, 2, 3, 4, 5 ]
                ]
            );
    }
}

/* Draws a diagonal segment
 *  size segment size
 *  r    segment radius (default = segment_radius(h))
 *  on   on-relief/low-relief flag
 */
module diag_segment(size, r = 0, on = true)
{
    radius = (r == 0) ? segment_radius(size) : r;
    length = (size > 2 * radius) ? size - 2 * radius : 0;
    if (on)
    {
        polyhedron(
            points = [
                [ radius, radius, 0 ],
                [ radius, 2.41 * radius, 0 ],
                [ size / 2 - 2.41 * radius, size - radius, 0 ],
                [ size / 2 - radius, size - radius, 0 ],
                [ size / 2 - radius, size - 2.41 * radius, 0 ],
                [ 2.41 * radius, radius, 0 ],
                [ 1.70 * radius, 1.70 * radius, radius ],
                [ size / 2 - 1.70 * radius, size - 1.70 * radius, radius ]
            ],
            faces = [
                [ 0, 1, 6 ],
                [ 1, 2, 7, 6 ],
                [ 2, 3, 7 ],
                [ 3, 4, 7 ],
                [ 4, 5, 6, 7 ],
                [ 5, 0, 6 ],
                [ 0, 1, 2, 3, 4, 5 ]
            ]
        );
    } else {
        polyhedron(
            points = [
                [ radius, radius, 0 ],
                [ radius, 2.41 * radius, 0 ],
                [ size / 2 - 2.41 * radius, size - radius, 0 ],
                [ size / 2 - radius, size - radius, 0 ],
                [ size / 2 - radius, size - 2.41 * radius, 0 ],
                [ 2.41 * radius, radius, 0 ],
                [ 1.70 * radius, 1.70 * radius, -radius ],
                [ size / 2 - 1.70 * radius, size - 1.70 * radius, -radius ]
            ],
            faces = [
                [ 0, 1, 2, 3, 4, 5 ],
                [ 1, 0, 6 ],
                [ 2, 1, 6, 7 ], 
                [ 2, 7, 3 ],
                [ 4, 3, 7 ],
                [ 5, 4, 7, 6 ],
                [ 0, 5, 6 ]
            ]
        );
        linear_extrude(height = radius)
            polygon(
                points = [
                    [ radius, radius ],
                    [ radius, 2.41 * radius ],
                    [ size / 2 - 2.41 * radius, size - radius ],
                    [ size / 2 - radius, size - radius ],
                    [ size / 2 - radius, size - 2.41 * radius ],
                    [ 2.41 * radius, radius ]
                ],
                paths = [
                    [ 0, 1, 2, 3, 4, 5 ]
                ]
            );
    }
}

//---------------------------------------------------------------------------
// Examples
//---------------------------------------------------------------------------

ex_seglen = 100;	// segment length for all examples

// Base for on-relief examples
translate(
    v = [ 0, -2 * digit_height(ex_seglen), -2 * segment_radius(digit_height(ex_seglen)) ]
)
    cube(
        size = [
            2 * digit_spacing(digit_height(ex_seglen)),
            4 * digit_height(ex_seglen),
            2 * segment_radius(digit_height(ex_seglen))
        ]
    );

// On relief examples

// 7 segment on-relief example
translate(
    v = [ digit_spacing(digit_height(ex_seglen)) / 2, digit_height(ex_seglen) / 2, 0 ]
)
{
    segment_a(ex_seglen);
    segment_b(ex_seglen);
    segment_c(ex_seglen);
    segment_d(ex_seglen);
    segment_e(ex_seglen);
    segment_f(ex_seglen);
    segment_g(ex_seglen);
    segment_p(ex_seglen);
}

// 16 segment on-relief example
translate(
    v = [ digit_spacing(digit_height(ex_seglen)) / 2, -1.5 * digit_height(ex_seglen), 0 ]
)
{
    segment_a1(ex_seglen);
    segment_a2(ex_seglen);
    segment_b(ex_seglen);
    segment_c(ex_seglen);
    segment_d1(ex_seglen);
    segment_d2(ex_seglen);
    segment_e(ex_seglen);
    segment_f(ex_seglen);
    segment_g1(ex_seglen);
    segment_g2(ex_seglen);
    segment_h(ex_seglen);
    segment_i(ex_seglen);
    segment_j(ex_seglen);
    segment_k(ex_seglen);
    segment_l(ex_seglen);
    segment_m(ex_seglen);
    segment_p(ex_seglen);
}

// Low relief examples
// Low relief effect is performed by substracting from the base
translate(v = [ 2 * digit_spacing(digit_height(ex_seglen)), 0, 0 ])
    difference()
    {
        // Base for low-relief examples
        translate(
            v = [ 0, -2 * digit_height(ex_seglen), -2 * segment_radius(digit_height(ex_seglen)) ]
        )
            cube(
                size = [
                    2 * digit_spacing(digit_height(ex_seglen)),
                    4 * digit_height(ex_seglen),
                    2 * segment_radius(digit_height(ex_seglen))
                ]
            );

        // 7 segment low-relief example
        translate(
            v = [ digit_spacing(digit_height(ex_seglen)) / 2, digit_height(ex_seglen) / 2, 0 ]
        )
        {
            segment_a(ex_seglen, on = false);
            segment_b(ex_seglen, on = false);
            segment_c(ex_seglen, on = false);
            segment_d(ex_seglen, on = false);
            segment_e(ex_seglen, on = false);
            segment_f(ex_seglen, on = false);
            segment_g(ex_seglen, on = false);
            segment_p(ex_seglen, on = false);
        }

        // 16 segment on-relief example
        translate(
            v = [ digit_spacing(digit_height(ex_seglen)) / 2, -1.5 * digit_height(ex_seglen), 0 ]
        )
        {
            segment_a1(ex_seglen, on = false);
            segment_a2(ex_seglen, on = false);
            segment_b(ex_seglen, on = false);
            segment_c(ex_seglen, on = false);
            segment_d1(ex_seglen, on = false);
            segment_d2(ex_seglen, on = false);
            segment_e(ex_seglen, on = false);
            segment_f(ex_seglen, on = false);
            segment_g1(ex_seglen, on = false);
            segment_g2(ex_seglen, on = false);
            segment_h(ex_seglen, on = false);
            segment_i(ex_seglen, on = false);
            segment_j(ex_seglen, on = false);
            segment_k(ex_seglen, on = false);
            segment_l(ex_seglen, on = false);
            segment_m(ex_seglen, on = false);
            segment_p(ex_seglen, on = false);
        }
}

/* EOF : seg_digit.scad */
