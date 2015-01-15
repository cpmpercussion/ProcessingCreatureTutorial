# Processing Tutorial - Making a Moving Creature!

__If you're new to programming this tutorial comes after learning the basics from: [hello.processing.org](http://hello.processing.org)__

This tutorial will walk you through making a little creature in Processing using the commands you learned in the basic tutorial.

This tutorial is similar to the first part of the ANU course COMP1720 "Art and Interaction in New Media".

You might want to open up the processing website and check out the reference page so that you can discover new commands: [www.processing.org/reference/](https://www.processing.org/reference/)

If you don't like the look of this tutorial there are [lots of others available online as well](https://www.processing.org/tutorials/)!

## 1. Create a creature

Your first challenge is to create a creature using the basic shapes, colours and background commands that you've just learned, here are some to refresh your memory and to help remember what the arguments stand for:

    background(red,green,blue); // draw a coloured background
    fill(red,green,blue); // change the colour to fill shapes
    stroke(red,green,blue); // change the colour to draw the edge of shapes

    rect(x_corner,y_corner,width,height); // draw a rectangle
    ellipse(x_centre,y_centre,width,height); // draw an ellipse
    tri(x1,y1,x2,y2,x3,y3); // draw a triangle

    size(x_width,y_width) // setup the window to be a certain size! You need this otherwise you won't have enough space to draw!

It's a good first step to code up a creature without any movement, so you don't have to use "setup()" or "draw()" to begin with.

You probably now have an idea about what you might like to draw but it's ok if you don't. Either way, I would suggest coding up a bunch of shapes on the screen and thinking about how you would like change them to form what you want. You don't have to code something up perfectly first time! 

Here's an example of my creature - the "BlueBot":

    int pos_x = 75;
    int pos_y = 150;

    size(600,800);
    background(255);

    fill(14,70,180);
    rect(pos_x-40,pos_y + 250,100,150); // leg left
    rect(pos_x + 80, pos_y + 250,100,150); // leg right
    fill(0,0,255,200);
    rect(pos_x,pos_y,200,300); // body
    fill(0,0,255,240);
    rect(pos_x + 100, pos_y - 100,200,200); // head
    fill(0,0,100,200);
    rect(pos_x + 120, pos_y - 80,20,20);
    rect(pos_x + 260, pos_y - 80,20,20);

And [here's what it looks like:](http://www.openprocessing.org/visuals/?visualID=180992)

<iframe width="428" height="680" scrolling="no" frameborder="0" src="http://www.openprocessing.org/sketch/180992/embed/?width=400&height=600&border=true"></iframe>

## 2. Animate your creature

Adding some mouse or keyboard interaction to your creature can really give it some personality!

The first step will be to add "void setup(){}" and "void draw(){}" to your sketch just like in the video tutorial. You'll want to move the "size" command into the setup area and the rest of the drawing code for your creature into the draw function so that it's updated every frame.

It's a good idea to start naming some variables to keep track of where your creature is on the screen. You could have two integers to keep track of the position of your creature:

    int pos_x = 75;
    int pos_y = 150;

Then when you draw the creature, you can use "pos_x" and "pos_y" instead of writing numbers in every time you draw a shape.

Now you can use the mouse functions "void mouseClicked() {}" and "void mouseDragged() {}" to change these variables using the mouse like so:

    void mouseDragged() {
     pos_x = mouseX;
     pos_y = mouseY;     
    }

Here's an example that I put together called "BlueBot Bob" - this little guy bobs around when you drag or click!

    int pos_x = 75;
    int pos_y = 150;
    int bob_factor = 0;
    int move_factor = 10;
    int drag_x_factor = 0;
    int drag_y_factor = 0;

    void setup(){
      size(600,800);
    }

    void draw() {
      pos_x = pos_x % width;
      pos_y = pos_y % height;
      
      background(100);

      fill(255,70,180);
      rect(pos_x-40- (1.5 * bob_factor) + drag_x_factor,pos_y + 250 + drag_y_factor,100,150); // leg left
      rect(pos_x + 80+ (1.5 * bob_factor) + drag_x_factor, pos_y + 250 + drag_y_factor,100,150); // leg right
      
      fill(0,0,255,200);
      rect(pos_x,pos_y,200,300); // body
      
      fill(0,0,255,240);
      rect(pos_x + 100 + bob_factor, pos_y - 100 + bob_factor,200,200); // head
      
      fill(0,0,100,200);
      rect(pos_x + 120 + (0.5 * bob_factor) + drag_x_factor, pos_y + (0.5 * bob_factor) - 80 + drag_y_factor,20,20);
      rect(pos_x + 260 - (0.5 * bob_factor) + drag_x_factor, pos_y + (0.5 * bob_factor) - 80 + drag_y_factor,20,20);


      if (bob_factor > 0) {bob_factor--;}
      if (drag_x_factor > 0) {drag_x_factor--;}
      if (drag_y_factor > 0) {drag_y_factor--;}
    }

    void mouseClicked() {
      bob_factor = 10;
      pos_x += move_factor;
    }

    void mouseDragged() {
     pos_x = pos_x + (mouseX - pmouseX);
     pos_y = pos_y + (mouseY - pmouseY);

     drag_x_factor = 2 * (pmouseX - mouseX);
     drag_y_factor = 3 * (pmouseY - mouseY);
     
    }

[Here's my bobbing BlueBot!](http://www.openprocessing.org/visuals/?visualID=180993)

<iframe width="628" height="880" scrolling="no" frameborder="0" src="http://www.openprocessing.org/sketch/180993/embed/?width=600&height=800&border=true"></iframe>

## 3. Send it in!

Once you've got a creature that works the way you want why not send it in? I was thinking about making a little zoo of creatures to show to future students.

Just copy the code into an email and send it to: charles.martin@anu.edu.au

If you want, you could sign your name or alias on the sketch before sending it like this:

    text("Charles made this!",20,20);

## 4. Check out what you can do with Processing!

Processing is great for making interactive artworks or just for sketching out new user interfaces or visualising data! There's a lot of great Processing work available on the web, have a look here to see what people are doing:

- [https://www.processing.org/exhibition/](https://www.processing.org/exhibition/)
- [OpenProcessing](http://openprocessing.org)

## 5. Advanced tutorial - add some sound to your creature!

If you've finished everything else or you're already a coder you might like to try out adding some sound to your creature!

Computer music is something I'm really passionate about but it's not always a part of beginning programming courses, I put together a lecture and a series of example programs for making sound and music in Processing:

The sound and music tutorial is contained in a github repository - check out this link to get started!

[https://github.com/cpmpercussion/MusicInProcessingLecture](https://github.com/cpmpercussion/MusicInProcessingLecture)