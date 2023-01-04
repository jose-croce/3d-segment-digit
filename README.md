# 3D Led display library

[OpenSCAD](http://www.openscad.org/) library for 3d modelling.

Permits the engraving of low or high relieves to label trade marks or serial numbers on 3d models.

![digit7.scad unit test](https://crossforests.com/wp-content/uploads/2018/01/digit7_unittest.png)

## Usage

The library consists of two files:

- **digit7.scad**

  Includes methods to display numerical strings in binary, octal, decimal or hexadecimal notation as it would result from a 7 leds digit display.

- **seg_digit.scad**

  Includes methods to display alphanumeric strings as it would result from a 16 leds digit display.

In order to use this library on any openscad project, call the required file with the `use` directive from within your model file. This permits the use of the methods commented below.

> **NOTE:**
> As **digit7.scad** depends on **seg_digit.scad** both files should be accessible (should be included within the model project) in order for **digit7.scad** methods to be available.

## digit7.scad methods

### `digit7_str(s, h, on)`

#### Description

Writes a numeric string.

#### Parameters

- **s**

  String to display. It must only include characters from `0123456789abcdef`.

- **h**

  Digit height.

- **on**

  if this flag is true (default) a high relief will be engraved on the model.
  Otherwise, a low relief will be engraved.

### `digit7_int(v, h, on)`

#### Description

Writes a numeric value

#### Parameters

- **v**

  Integer value to display. Value will always be displayed in decimal notation.

- **h**

  Digit height.

- **on**

  if this flag is true (default) a high relief will be engraved on the model.
  Otherwise, a low relief will be engraved.

### `digit7_float(v, h, on)`

#### Description

Writes a floating poiny numeric value

#### Parameters

- **v**

  Floating point value to display. Value will always be displayed in decimal notation.

- **h**

  Digit height.

- **on**

  if this flag is true (default) a high relief will be engraved on the model.
  Otherwise, a low relief will be engraved.

## seg_digit.scad methods

The public methods from **seg_digit.scad** are:

* `segment_a(size, on = true)`
* `segment_b(size, on = true)`
* `segment_c(size, on = true)`
* `segment_d(size, on = true)`
* `segment_e(size, on = true)`
* `segment_f(size, on = true)`
* `segment_g(size, on = true)`
* `segment_a1(size, on = true)`
* `segment_a2(size, on = true)`
* `segment_d1(size, on = true)`
* `segment_d2(size, on = true)`
* `segment_g1(size, on = true)`
* `segment_g2(size, on = true)`
* `segment_h(size, on = true)`
* `segment_i(size, on = true)`
* `segment_j(size, on = true)`
* `segment_k(size, on = true)`
* `segment_l(size, on = true)`
* `segment_m(size, on = true)`
* `segment_dp(digit_size, on = true)`

Each one of these methods displays a segment according to the following diagram:

![Display segments arrangement](https://crossforests.com/wp-content/uploads/2018/01/digits-300x212.png)

All these methods use the following parameters:

- **size**

  Digit height.

- **on**

  if this flag is true (default) a high relief will be engraved on the model.
  Otherwise, a low relief will be engraved.

