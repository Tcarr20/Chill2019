///@function val_to_string(value)
///@description Turn ASCII decimal values/ game constants into strings
///@param value
switch(argument0)
{
    case 8: return "Backspace"; break;
    case 9: return "Tab"; break;
    case 13: return "Enter"; break;
    case 16: return "Shift"; break;
    case 17: return "Control"; break;
    case 27: return "Escape"; break;
    case 32: return "Space"; break;
    case 37: return "Left Arrow"; break;
    case 38: return "Up Arrow"; break;
    case 39: return "Right Arrow"; break;
    case 40: return "Down Arrow"; break;
    case 48: return "0"; break;
    case 49: return "1"; break;
    case 50: return "2"; break;
    case 51: return "3"; break;
    case 52: return "4"; break;
    case 53: return "5"; break;
    case 54: return "6"; break;
    case 55: return "7"; break;
    case 56: return "8"; break;
    case 57: return "9"; break;
    case 65: return "A"; break;
    case 66: return "B"; break;
    case 67: return "C"; break;
    case 68: return "D"; break;
    case 69: return "E"; break;
    case 70: return "F"; break;
    case 71: return "G"; break;
    case 72: return "H"; break;
    case 73: return "I"; break;
    case 74: return "J"; break;
    case 75: return "K"; break;
    case 76: return "L"; break;
    case 77: return "M"; break;
    case 78: return "N"; break;
    case 79: return "O"; break;
    case 80: return "P"; break;
    case 81: return "Q"; break;
    case 82: return "R"; break;
    case 83: return "S"; break;
    case 84: return "T"; break;
    case 85: return "U"; break;
    case 86: return "V"; break;
    case 87: return "W"; break;
    case 88: return "X"; break;
    case 89: return "Y"; break;
    case 90: return "Z"; break;
    case 160: return "Left Shift"; break;
    case 161: return "Right Shift"; break;
    case 162: return "Left Control"; break;
    case 163: return "Right Control"; break;
    //Gamepad controls
    case gp_axisl_l: return "L-Stick Left"; break;
    case gp_axisl_r: return "L-Stick Right"; break;
    case gp_axisl_u: return "L-Stick Up"; break;
    case gp_axisl_d: return "L-Stick Down"; break;
    case gp_stickl: return "L-Stick Press"; break;
    case gp_stickr: return "R-Stick Press"; break;
    case gp_face1: return "A Button"; break;
    case gp_face2: return "B Button"; break;
    case gp_face3: return "X Button"; break;
    case gp_face4: return "Y Button"; break;
    case gp_shoulderl: return "Left Shoulder"; break;
    case gp_shoulderr: return "Right Shoulder"; break;
    case gp_shoulderlb: return "Left Trigger"; break;
    case gp_shoulderrb: return "Right Trigger"; break;
    case gp_select: return "Select"; break;
    case gp_start: return "Start"; break;
    case gp_padl: return "D-Pad Left"; break;
    case gp_padr: return "D-Pad Right"; break;
    case gp_padu: return "D-Pad Up"; break;
    case gp_padd: return "D-Pad Down"; break;
    default: return "Missingno."
}
