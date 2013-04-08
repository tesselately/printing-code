float TAU = TWO_PI;
float HALF_TAU = PI;
float QUARTER_TAU = HALF_PI;

void setup() {
    size(600, 600);
    smooth();
    noLoop();
}

void drawSelf() {
    colorMode(HSB, TAU, 100, 100, 100);

    color foo = color(0, 0, 0);
    color baz = color(0, 0, 50);
    color moo = color(0, 0, 75, 75);
    color quux = color(0, 0, 100);

    background(quux);

    pushMatrix();
    stroke(baz);
    translate(-300, -900);
    drawHalfPlaid();
    popMatrix();

    pushMatrix();
    stroke(moo);
    rotate(QUARTER_TAU);
    translate(-300, -900);
    drawHalfPlaid();
    popMatrix();

    stroke(foo);
    strokeWeight(14);
    noFill();
    rotate(TAU/10);
    drawStar(30);
}

void drawStar(int strokes) {
    for (int i = 0; i < strokes; i++) {
        float start = (i / (float)strokes) * TAU;
        println("Step " + i + " start angle is " + degrees(start));
        //start += 8.0/8.0 * HALF_TAU;

        pushMatrix();
        rotate(start);
        arc(0, 0, 400, 580, -0.1 * PI, 0.5 * PI);
        popMatrix();
    }
}

void drawHalfPlaid() {
    pushMatrix();
    for (int i = 0; i < 40; i++) {
        if (i % 3 == 0) {
            strokeWeight(5);
            translate(0, 10);
            line(0, 0, 600, 600);
            translate(0, 10);
        }
        else {
            strokeWeight(20);
            translate(0, 20);
            line(0, 0, 600, 600);
            translate(0, 20);
        }
    }
    popMatrix();
}

boolean saving = false;
int seed;

void draw() {
    if (!saving) {
        seed = millis();
    }
    randomSeed(seed);

    translate(300, 300);
    drawSelf();

    if (saving) {
        saving = false;
        saveFrame("self##.png");
    }
}

void mouseClicked() {
    redraw();
}

void keyReleased() {
    if (key == 's')
        saving = true;
    redraw();
}

