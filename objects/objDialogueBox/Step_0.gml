/// @description Manage state

//Start text scrolling
if (cpt_finished(sizePath))
{
	growing = false;
	if (mySpeed > 0) { alarm[0] = mySpeed; }
	else { drawText = myText; }
}
//Manage choice selection
if (myState == 2 && myType == tb_select)
{
	if (get_in(in_up, in_check_press, 0)) { choiceSelect = wrap(choiceSelect - 1, 0, numChoices - 1); }
	if (get_in(in_down, in_check_press, 0)) { choiceSelect = wrap(choiceSelect + 1, 0, numChoices - 1); }
}
//Scroll line
if (myState == 3)
{
	if (cpt_finished(scrollPath))
	{
		//scrollPath = -1;
		myState = 0;
		drawTextY = y - boxH;
		alarm[0] = mySpeed;
	}
}

//Kill brief textboxes right when text finishes drawing
if (myState == 2 && myType == tb_brief)
{
	//Destroy
	instance_destroy(); 	
}


//Input 
if (get_in(in_a, in_check_press, 0)) {
	if (myState == 1)
	{
		//Keep scrolling text
		lineCount = 1;
		myState = 3;
		myPos = [0, drawTextY + font_h];
		scrollPath = cpt_begin(myPos, cpt_linear, 2, 2, [0, drawTextY]);
		alarm[1] = 1;
	}
	else if (myState == 2) { 
		if (myType == tb_select) {
			//Return choice
			db_choice = myValues[choiceSelect];
		}
		
		//Destroy
		instance_destroy(); 
	}	
}