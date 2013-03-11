void setup() {
    size(800, 800);
}

void draw() {
    // It says to only use black and white so I guess
    // the grey background has to go.
    background(255);

    // ...but since I didn't use the rect() to do that
    // I can draw a ground with it.
    fill(0);
    rect(0, 500, 800, 300);

    // Sad cone. :(
    fill(255);
    ellipse(400, 520, 250, 120);
    triangle(300, 490, 350, 100, 480, 475);

    if (keyPressed && key == 's') {
        saveFrame("cone.png");
    }
}

