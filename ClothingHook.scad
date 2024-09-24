include <BOSL2/std.scad>

$fn = 64;


baseWidth = 14;
baseDepth = 5;
baseHeight = 60;

hookLength = 30;
hookStrength = baseWidth * 0.666;

screwDiameter = 4.5;
screwHeadDiameter = 8.3;
screwHeadHeight = 3.33;


difference()
{
    union()
    {
        cube([baseWidth, baseDepth, baseHeight]);


        up(baseHeight / 4)
        back(baseDepth)
            xrot(45)
            {

            cube([baseWidth, hookLength - hookStrength / 2, hookStrength]);

            up(hookStrength / 2)
                back(hookLength - hookStrength / 2)
                    yrot(90)
                        cylinder(d = hookStrength, h = baseWidth);
            }

    }

    left(baseWidth / 2)
        fwd(baseDepth)
            cube([baseWidth * 2, baseDepth, baseHeight]);

    zcopies([baseHeight / 6, baseHeight / 6 * 5])
        xrot(-90)
            right(baseWidth / 2)
            {
                up(baseDepth - screwHeadHeight + 0.01)
                    cylinder(d2 = screwHeadDiameter, d1 = screwDiameter, h = screwHeadHeight);
                
                cylinder(d = screwDiameter, h = baseDepth);
            }
}