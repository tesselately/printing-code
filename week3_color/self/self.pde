import java.util.Random;

float TAU = TWO_PI;
float HALF_TAU = PI;
float QUARTER_TAU = HALF_PI;

boolean saving = false;
long seed;
Random r;

void setup() {
    size(600, 600);
    smooth();
    noLoop();
}

float randomGauss(float mode, float stddev) {
    float hue = (float)r.nextGaussian();
    hue *= stddev;
    hue += mode;
    return hue;
}

void drawSelf() {
    colorMode(HSB, TAU, 100, 100, 100);

    float fooHue = random(TAU);

    color foo = color(fooHue, randomGauss(75, 25), randomGauss(50, 50));
    color baz = color(randomGauss((fooHue + QUARTER_TAU) % TAU, HALF_TAU), randomGauss(75, 25), randomGauss(75, 25));
    color moo = color(randomGauss((fooHue + HALF_TAU) % TAU, HALF_TAU), randomGauss(75, 25), randomGauss(75, 25), 75);
    color quux = color(randomGauss((fooHue - QUARTER_TAU) % TAU, HALF_TAU), randomGauss(10, 10), 100);

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

void draw() {
    if (!saving) {
        seed = millis();
    }
    randomSeed(seed);
    r = new Random(seed);

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

