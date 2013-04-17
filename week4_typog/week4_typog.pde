void setup() {
    size(800, 400);
    //noLoop();
    noFill();
}

final float TAU = TWO_PI;
final float THIRD_TAU = TAU / 3.0;
final float HALF_TAU = PI;
final float QUARTER_TAU = HALF_PI;
final float EIGHTH_TAU = QUARTER_PI;

final float[][] letters = {
    /* a */ {1, 2, 1, 1, 1, -1, 0, -1, -1, 0, 0, 1, 1, 0.5, 2, 0},
    /* e */ {-2, 0, -1, 0, 1, 0, 0, -1, -1, 0, 0, 1, 1*sin(EIGHTH_TAU), 1*cos(EIGHTH_TAU), 1, 0},
    /* l */ {0, 2, 0, 1, 0, -2, 0, -3},
    /* n */ {-1, 2, -1, 1, -1, -1, 1, -1, 1, 1, 1, 2},
    /* r */ {-1, 2, -1, 1, -1, -1, 1, -1, 2, -1},
    /* s */ {2, -1, 1, -1, 0, -1, -1, -0.5, 0, 0, 1, 0.5, 0, 1, -1, 1, -2, 1}
};

boolean saving = false;

void draw() {
    background(255);

    // "snarler"
    // "aelnrs"
    float[][] snarler = {letters[5], letters[3], letters[0],
        letters[4], letters[2], letters[1], letters[4]};

    float kern = 86.0 / 4.0;

    translate(400, 200);
    translate(-(3 * (86 + kern)), 0);

    float perturb = mouseX < 20 ? 0.0
                  : (mouseX - 20) / 2400.0;

    for (int i = 0; i < snarler.length; i++) {
        float[] letter = snarler[i];
        pushMatrix();
        scale(86/2);
        strokeWeight(3.0 / 86.0);
        beginShape();
        for (int j = 0; j < letter.length; j += 2) {
            curveVertex(letter[j], letter[j+1]);
            if (j > 0 && j < letter.length - 2 && perturb > 0.0) {
                float firstAngle = random(TAU);
                float secondAngle = random(TAU);
                curveVertex(letter[j] + perturb*sin(firstAngle), letter[j+1] + perturb*cos(firstAngle));
                curveVertex(letter[j] + perturb*sin(secondAngle), letter[j+1] + perturb*cos(secondAngle));
            }
        }
        endShape();
        popMatrix();
        translate(86 + kern, 0);
    }

    if (saving) {
        saving = false;
        saveFrame("snarler.png");
    }
}

void keyReleased() {
    if (key == 's')
        saving = true;
    redraw();
}

