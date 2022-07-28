#!/usr/bin/perl

#Usage: perl csv2kml.pl < in.csv > out.kml

print '<?xml version="1.0" encoding="UTF-8"?>
    <kml xmlns="http://earth.google.com/kml/2.0">
    <Document>
    <ScreenOverlay>
    <name></name>
    <visibility>1</visibility>
    <overlayXY x="0" y="-1" xunits="fraction" yunits="fraction"/>
    <screenXY x="0" y="0" xunits="fraction" yunits="fraction"/>
    <rotationXY x="0" y="0" xunits="fraction" yunits="fraction"/>
    <size x="0" y="0" xunits="fraction" yunits="fraction"/>
    </ScreenOverlay>

    <StyleMap id="">
      <Pair>
        <key>normal</key>
        <styleUrl></styleUrl>
      </Pair>
      <Pair>
        <key>highlight</key>
        <styleUrl></styleUrl>
      </Pair>
    </StyleMap>';

while (<>) {
  s/\&/\&amp;/g;  
  @a=split /,/;

  print "<Style id="">
    <IconStyle>
      <Icon>
       <scale>1.1</scale>
       <href></href>
      </Icon>
    </IconStyle>
    <LabelStyle>
      <scale>0</scale>
    </LabelStyle>
    </Style>
    <Style id="">
     <IconStyle>
      <Icon>
       <scale>1.1</scale>
       <href></href>
      </Icon>
    </IconStyle>
    <LabelStyle>
      <scale>0</scale>
    </LabelStyle>
    </Style>
    <Placemark>
    <styleUrl></styleUrl>
    <name>$a[14]</name>
    <description>$a[16]</description>
    <Point><coordinates>$a[6],$a[5],0</coordinates></Point>
  </Placemark>"
};

print '</Document>
</kml>';
