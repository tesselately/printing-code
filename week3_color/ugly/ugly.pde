void square(color c, float x, float y, float radius) {
    pushMatrix();
    translate(x, y);

    fill(c);
    rect(-radius, -radius, radius*2, radius*2);     

    popMatrix();
}

void polarSquare(color c, float theta, float r, float radius) {
    float x = r * cos(theta);
    float y = r * sin(theta);
    square(c, x, y, radius);
}

boolean saving = false;
int seed;

void setup() {
    size(600, 600);
    smooth();
    noStroke();
    noLoop();
    colorMode(HSB, TWO_PI, 100, 100);
}

void draw() {
    //background();
    translate(300, 300);

    if (!saving) {
        seed = millis();
    }
    randomSeed(seed);

    float hueFirst = random(TWO_PI);
    float hueSecond = (hueFirst + radians(47)) % TWO_PI;
    float hueThird = (hueFirst - radians(133)) % TWO_PI;

    color first = color(hueFirst, random(30), 100);
    color second = color(hueSecond, 100, 100);
    color third = color(hueThird, random(30), 100);

    square(first, 0, 0, 300);
    square(second, 0, 0, 200);
    square(third, 0, 0, 100);

    if (saving) {
        saving = false;
        saveFrame("ugly.png");
    }
    else {
        polarSquare(color(0,0,0), hueFirst, 200, 10);
        polarSquare(color(0,0,0), hueSecond, 200, 10);
        polarSquare(color(0,0,0), hueThird, 200, 10);
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

