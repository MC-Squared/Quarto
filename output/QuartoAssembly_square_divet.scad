$fn=64;
difference(){translate(v = [-12.500, -12.500])
cube(size = [25, 25, 23]);
translate(v = [-12.500, -12.500])
union(){rotate(a = [0, 0, 180])
translate(v = [-5.000, -5.000])
difference(){translate(v = [0, 0, -0.010])
cube(size = [10.000, 10.000, 23.020]);
translate(v = [0, 0, -0.020])
cylinder(r = 5.000, h = 23.040, $fn = 64);
}
rotate(a = [0, 0, 90])
translate(v = [20.000, -5.000])
difference(){translate(v = [0, 0, -0.010])
cube(size = [10.000, 10.000, 23.020]);
translate(v = [0, 0, -0.020])
cylinder(r = 5.000, h = 23.040, $fn = 64);
}
translate(v = [20.000, 20.000])
difference(){translate(v = [0, 0, -0.010])
cube(size = [10.000, 10.000, 23.020]);
translate(v = [0, 0, -0.020])
cylinder(r = 5.000, h = 23.040, $fn = 64);
}
rotate(a = [0, 0, -90])
translate(v = [-5.000, 20.000])
difference(){translate(v = [0, 0, -0.010])
cube(size = [10.000, 10.000, 23.020]);
translate(v = [0, 0, -0.020])
cylinder(r = 5.000, h = 23.040, $fn = 64);
}
}
sphere(r = 6.250);
translate(v = [0, 0, 25])
sphere(r = 6.250);
}
