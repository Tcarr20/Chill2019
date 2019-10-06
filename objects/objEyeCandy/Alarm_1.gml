///@description Update last pos
if (xLast != x || yLast != y) { moveDir = point_direction(xLast, yLast, x, y); }
xLast = x;
yLast = y;
alarm[1] = 1;