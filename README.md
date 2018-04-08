#Librería 3D basada en displays de leds

Librería para diseños 3D en [OpenSCAD](http://www.openscad.org/).
Permite incorporar relieves o bajorelieves numéricos o alfanuméricos para
especficar datos como marcas, modelos o números de serie.

##Uso

La librería se compone de dos ficheros:
<dl>
<dt>digit7.scad</dt>
<dd>Métodos para mostrar secuencias numéricas en notación octal, decimal o
hexadecimal utilizando una tipografía basada en cómo se visualizan los
displays de siete segmentos.</dd>
</dl>
<dl>
<dt>seg_digit.scad</dt>
<dd>Métodos para mostrar secuencias alfanuméricas utilizando una tipografía
basada en cómo se visualizan los displays de dieciseis segmentos.</dd>
</dl> 

Cualquier diseño que quiera utilizar alguna de estas librerías debe incorporar
el archivo correspondiente a través de la directiva `use` que le dará acceso
a los métodos públicos de esa librería dentro del diseño.

En el caso de utilizarse `digit7.scad` debe tenerse en cuenta que depende de
`seg_digit.scad` por lo que ambos archivos deberán ser incorporados al
directorio del diseño.

##Métodos de digit7.scad

###digit7_str(s, h, on)
####Descripción
Escribe una secuencia de caracteres.
####Parámetros
<dl>
<dt>s</dt>
<dd>Secuencia de carateres a grabar. La secuencia debe estar compuesta por
cualquier combinación de los caracteres <code>0123456789abcdef</code>.</dd>
<dt>h</dt>
<dd>Altura de los dígitos a grabar.</dd>
<dt>on</dt>
<dd>Flag que, en caso de ser verdadero, indica que el grabado será un relieve
por fuera del diseño.
En caso de ser falso indica realizar un bajo relieve o grabado en el diseño.</dd>
</dl>

###digit7_int(v, h, on)
####Descripción
Escribe un valor numérico entero.
####Parámetros
<dl>
<dt>v</dt>
<dd>Valor entero a representar en notación decimal.</dd>
<dt>h</dt>
<dd>Altura de los dígitos a grabar.</dd>
<dt>on</dt>
<dd>Flag que, en caso de ser verdadero, indica que el grabado será un relieve
por fuera del diseño.
En caso de ser falso indica realizar un bajo relieve o grabado en el diseño.</dd>
</dl>

###digit7_float(v, h, on)
####Descripción
Escribe un valor numérico en coma flotante.
####Parámetros
<dl>
<dt>v</dt>
<dd>Valor en coma flotante a representar en notación decimal.</dd>
<dt>h</dt>
<dd>Altura de los dígitos a grabar.</dd>
<dt>on</dt>
<dd>Flag que, en caso de ser verdadero, indica que el grabado será un relieve
por fuera del diseño.
En caso de ser falso indica realizar un bajo relieve o grabado en el diseño.</dd>
</dl>

##Métodos de seg_digit.scad

Las funciones públicas de `seg_digit.scad` son:

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

Cada función se corresponde con cada uno de los segmentos que se muestran a
continuación:

![Disposición de segmentos en displays](https://crossforests.com/wp-content/uploads/2018/01/digits-300x212.png)

Y cada uno de estos métodos posee los siguientes parámetros:
<dl>
<dt>size</dt>
<dd>Largo del segmento a grabar.</dd>
<dt>on</dt>
<dd>Flag que, en caso de ser verdadero, indica que el grabado será un relieve
por fuera del diseño.
En caso de ser falso indica realizar un bajo relieve o grabado en el diseño.</dd>
</dl>

