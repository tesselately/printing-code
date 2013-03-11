void setup() {
    size(800, 800);
}

void draw() {
    // It says to only use black and white so I guess
    // the grey background has to go. Maybe you're supposed
    // to use the rect() for this buuut this isn't really a
    // “drawing” command...
    background(255);

    fill(0);
    ellipse(400, 650, 3200, 325);

    // Sad cone. :(
    fill(255);
    rect(280, 475, 240, 120, 80, 80, 20, 20);
    triangle(300, 490, 350, 100, 480, 475);

    if (keyPressed && key == 's') {
        saveFrame("cone.png");
    }
}

