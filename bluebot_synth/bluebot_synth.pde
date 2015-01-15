import ddf.minim.*; //<>//
import ddf.minim.ugens.*;

Minim minim;
AudioOutput out;
Oscil carrier, modulator;
Damp envelope;

float waveAmplitude;
float carrierFrequency;
float modulatorFrequency;

int pos_x = 75;
int pos_y = 150;
int bob_factor = 0;
int move_factor = 10;
int drag_x_factor = 0;
int drag_y_factor = 0;

void setup() {
  size(800, 800);
  minim = new Minim(this);
  out = minim.getLineOut();

  waveAmplitude = 0.5;
  carrierFrequency = 220;
  modulatorFrequency = 440;

  carrier = new Oscil(carrierFrequency, waveAmplitude, Waves.SINE);
  modulator = new Oscil(modulatorFrequency, 1000, Waves.SINE);
  modulator.offset.setLastValue(carrierFrequency); 

  envelope = new Damp(0.1, 0.8, 0.7);
  modulator.patch(carrier.frequency);
  carrier.patch(envelope);
  envelope.patch(out);
}

void draw() {
  pos_x = pos_x % width;
  pos_y = pos_y % height;

  background(100);

  fill(255, 70, 180);
  rect(pos_x-40- (1.5 * bob_factor) + drag_x_factor, pos_y + 250 + drag_y_factor, 100, 150); // leg left
  rect(pos_x + 80+ (1.5 * bob_factor) + drag_x_factor, pos_y + 250 + drag_y_factor, 100, 150); // leg right

  fill(0, 0, 255, 200);
  rect(pos_x, pos_y, 200, 300); // body

  fill(0, 0, 255, 240);
  rect(pos_x + 100 + bob_factor, pos_y - 100 + bob_factor, 200, 200); // head

  fill(0, 0, 100, 200);
  rect(pos_x + 120 + (0.5 * bob_factor) + drag_x_factor, pos_y + (0.5 * bob_factor) - 80 + drag_y_factor, 20, 20);
  rect(pos_x + 260 - (0.5 * bob_factor) + drag_x_factor, pos_y + (0.5 * bob_factor) - 80 + drag_y_factor, 20, 20);


  if (bob_factor > 0) {
    bob_factor--;
  }
  if (drag_x_factor > 0) {
    drag_x_factor--;
  }
  if (drag_y_factor > 0) {
    drag_y_factor--;
  }
}

void mouseClicked() {
  bob_factor = 10;
  pos_x += move_factor;
  float modulateAmount = map( pos_y, 0, height, 1200, 1 );
  float modulateFrequency = map( pos_x, 0, width, 0.1, 800 );
  modulator.setFrequency( modulateFrequency );
  modulator.setAmplitude( modulateAmount );
}

void mousePressed() {
    envelope.activate();
}

void mouseDragged() {
  pos_x = pos_x + (mouseX - pmouseX);
  pos_y = pos_y + (mouseY - pmouseY);

  drag_x_factor = 2 * (pmouseX - mouseX);
  drag_y_factor = 3 * (pmouseY - mouseY);
  float modulateAmount = map( pos_y, 0, height, 1200, 1 );
  float modulateFrequency = map( pos_x, 0, width, 0.1, 800 );
  modulator.setFrequency( modulateFrequency );
  modulator.setAmplitude( modulateAmount );
  
}
