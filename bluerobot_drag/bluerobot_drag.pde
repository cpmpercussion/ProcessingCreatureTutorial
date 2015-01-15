int bot_position_x = 75;
int bot_position_y = 150;

void setup() {
  size(800,800);
}

void draw() {
  background(100);

  fill(14,70,180);
  rect(bot_position_x-40,bot_position_y + 250,100,150); // leg left
  rect(bot_position_x + 80, bot_position_y + 250,100,150); // leg right
  fill(0,0,255,200);
  rect(bot_position_x,bot_position_y,200,300); // body
  fill(0,0,255,240);
  rect(bot_position_x + 100, bot_position_y - 100,200,200); // head
  fill(0,0,100,200);
  rect(bot_position_x + 120, bot_position_y - 80,20,20);
  rect(bot_position_x + 260, bot_position_y - 80,20,20);
}

void mouseDragged() {
 bot_position_x = bot_position_x + (mouseX - pmouseX);
 bot_position_y = bot_position_y + (mouseY - pmouseY); 
}
