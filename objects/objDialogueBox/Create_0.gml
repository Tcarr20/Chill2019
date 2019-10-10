/// @description Initialize
cpt_init();
global.stopFlagText = true;
myChoices = ct_argument[4];
myValues = ct_argument[5];
myPortrait = ct_argument[6];
myName = ct_argument[7];
myCallback = ct_argument[8];
myCallbackArgs = ct_argument[9];
cols = 50;
rows = 5;
myType = ct_argument[0];
mySpeed = ct_argument[2];
myState = 0;
drawPos = 1;
drawLength = 1;
drawText = "";
drawLines = 1;
lineCount = 1;
numChoices = -1;
choiceSelect = 0;
choiceLine = 0;
db_choice = undefined;

//Determine width & height
growing = false;
boxW = (cols * font_w) / 2;
boxH = (rows * font_h) / 2;
if (ct_argument[3]) {
	drawW = 0;
	drawH = 0;
	growing = true;
}
else {
	drawW = boxW;
	drawH = boxH;
}
myPos = [drawW, drawH];
sizePath = cpt_begin(myPos, cpt_linear, 10, 10, [boxW, boxH]);
scrollPath = -1;

//Bound the box position
x = clamp(x, get_camera_l() + boxW + (tb_border * 2), get_camera_r() - boxW - (tb_border * 2));
y = clamp(y, get_camera_t() + boxH + (tb_border * 2), get_camera_b() - boxH - (tb_border * 2));
drawTextX = x - boxW;
drawTextY = y - boxH;

//Get name & portrait dimensions
nameLength = -1;
portraitSize = -1;
portraitCols = -1;
if (myName != undefined) { nameLength = string_length_formatted(myName); }
if (myPortrait != undefined)
{
	portraitSize = sprite_get_width(myPortrait);
	portraitCols = ceil(portraitSize/font_w)+1;
	cols -= portraitCols;
	drawTextX += portraitCols*font_w;
}

//Format text
myText = string_insert_newline(ct_argument[1], cols);

//Process choices
if (myType == tb_select) {
	numChoices = array_length_1d(myChoices);
	choiceLine = rows - numChoices;
	for(var i=0; i<numChoices; i++) { myText += ("\n " + myChoices[i]); }
	var j;
	j = 0;
}
length = string_length(myText);

//Player should never move while dialog box exists
global.stopFlagTextbox = true;