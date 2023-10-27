/// @desc Core Player Logic 

//Get player inputs
key_left = keyboard_check(vk_left); 
key_right = keyboard_check(vk_right); 
key_jump = keyboard_check_pressed(vk_space); 

//Calculate movment 
var _move = key_right - key_left; 

hsp = _move * walksp; 

vsp = vsp + grv; 

if (place_meeting(x,y+1,Obj_Wall)) && (key_jump) 
{
	vsp = -jumpsp
}

//Horizontal collison 
if (place_meeting(x+hsp,y,Obj_Wall)) 
{
	while (!place_meeting(x+sign(hsp),y,Obj_Wall)) 
    {
		x = x + sign(hsp);
    }
	hsp = 0;
} 
x = x + hsp; 

//Vertical collison 
if (place_meeting(x,y+vsp,Obj_Wall)) 
{
	while (!place_meeting(x,y+sign(vsp),Obj_Wall)) 
    {
		y = y + sign(vsp);
    }
	vsp = 0;
} 
y = y + vsp; 

//Animation
if (!place_meeting(x,y+1,Obj_Wall)) 
{
	sprite_index = Spr_PlayerA; 
	image_speed = 0; 
	if (vsp > 0) image_index = 1; else image_index = 0;
}