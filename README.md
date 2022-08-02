Random (and perhaps useful) scripts live in the repo ⬆️

Random (and also perhaps useful) one-liners live here ⬇️

**Reproject and reinterpolate a grib2 file using another grib2 file:**
```
wgrib2 input.grib2 -set_grib_type same -new_grid_winds grid -new_grid_interpolation bilinear -new_grid `grid_defn.pl template.grib2` output.grib2
```

**Partial download of a grib2 file (one variable)**
```
wget -O - ${inventory} > /tmp/file.inv
cat /tmp/file.inv | grep 'some_variable' | cut -d ":" -f11-14 | sed 's/,/ /g' | sed 's/"/ /g' > /tmp/file

byte_tpa=`cat /tmp/file | grep 'some_variable' | awk '{print $4}'`
byte_tpb=`cat /tmp/file | grep 'some_variable' | awk '{print $4+$7-1}'`

curl -k --range ${byte_tpa}-${byte_tpb} input.grib2 --output output.grib2
```
