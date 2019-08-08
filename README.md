# Fortran-based simulation of a sine wave distortion using tanh

The original idea behind this test was that all of my audio plugins
with "analog modeling" create harmonics which are "reflected" when reaching
the nyquist frequency.
Using tanh is probably the easiest way of modeling a saturation.

This was tested using Arch Linux with GNU Fortran 9.1.0 and GNUPLOT 5.2.

fftpack can be found here:

https://people.sc.fsu.edu/~jburkardt/f_src/fftpack5/

### Building fftpack5

```
$ gfortran -c fftpack5.f90
```

### Compiling and running the program

```
$ gfortran SineDistort.f90 ./fftpack5.o
$ ./a.out > out.dat
```

### Plotting

```
$ gnuplot

gnuplot> set xrange[0:8192]
gnuplot> set yrange[-1:2]
gnuplot> plot 'out.dat'
```

