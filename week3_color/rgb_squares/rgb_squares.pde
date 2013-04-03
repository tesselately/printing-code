void square(color c, int x, int y) {
    pushMatrix();
    translate(x, y);

    fill(c);
    int radius = 30;
    rect(-radius, -radius, radius*2, radius*2);     

    popMatrix();
}

void setup() {
    size(900, 600);
    smooth();
    noStroke();
    noLoop();

    background(255);
    colorMode(HSB, 360, 100, 100);
    translate(450, 300);

    square(color(0, 100, 100), -90, 0);
    square(color(110, 100, 100), 0, 0);
    square(color(220, 100, 100), 90, 0);
    // red 0
    // green 110
}

