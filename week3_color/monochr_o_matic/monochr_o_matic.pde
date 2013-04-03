void square(color c, float x, float y, float radius) {
    pushMatrix();
    translate(x, y);

    fill(c);
    rect(-radius, -radius, radius*2, radius*2);     

    popMatrix();
}

void setup() {
    size(900, 600);
    smooth();
    noStroke();
    noLoop();
    colorMode(HSB, 360, 100, 100);
}

void draw() {
    //background();
    translate(450, 300);

    float hue = random(360);
    float saturation = random(100);
    float valueStep = random(10, 40);

    square(color(hue, saturation, 100), -200, 0, 100);
    square(color(hue, saturation, 100 - valueStep), 0, 0, 100);
    square(color(hue, saturation, 100 - valueStep*2), 200, 0, 100);
}

void mouseClicked() {
    redraw();
}

