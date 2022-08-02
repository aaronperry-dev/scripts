⚠️ DISCLAIMER: These scripts may not work without prior dependencies and libraries

Random (and perhaps useful) scripts live in the repo ⬆️

Various (and also perhaps useful) one-liners live here ⬇️

**Reproject and reinterpolate a GRIB2 file using another GRIB2 file as a template:**
```
wgrib2 input.grib2 -set_grib_type same -new_grid_winds grid -new_grid_interpolation bilinear -new_grid `grid_defn.pl template.grib2` output.grib2
```

**Partial download of a GRIB2 file (one variable)**
```
wget -O - ${inventory} > /tmp/file.inv
cat /tmp/file.inv | grep 'some_variable' | cut -d ":" -f11-14 | sed 's/,/ /g' | sed 's/"/ /g' > /tmp/file

byte_tpa=`cat /tmp/file | grep 'some_variable' | awk '{print $4}'`
byte_tpb=`cat /tmp/file | grep 'some_variable' | awk '{print $4+$7-1}'`

curl -k --range ${byte_tpa}-${byte_tpb} input.grib2 --output output.grib2
```

**Extract only the first record from a GRIB2 file**
```
wgrib2 input.grib2 -match some_variable -for_n 1:1 -grib output.grib2
```

**Interpolation between two GRIB2 files**
```
wgrib2 hour1.grib2 -rpn sto_1 -import_grib hour2.grib2 -rpn sto_2 -set_grib_type same -rpn "rcl_1:0.5:*:rcl_2:0.5:*:+" -set_scaling same same -grib_out hour1p5.grib2
```

**Create mosaic from multiple rasters**
```
gdalbuildvrt mosaic.vrt *.tif
gdalwarp -srcnodata 0.0 -dstnodata 0.0 -r near -ot UInt16 -multi -wo "NUM_THREADS=ALL_CPUS" -co "COMPRESS=DEFLATE" -co "BIGTIFF=YES" mosaic.vrt mosaic.tif
```

**Convert NetCDF to GRIB2**
```
cdo -f grb2 copy input.nc output.grb
```
