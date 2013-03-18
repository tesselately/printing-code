void setup() {
    size(500, 700);
    smooth();
    noStroke();
    noLoop();
}

boolean saving = false;

void drawShape(boolean saving, boolean sharp, int[] perturbations) {
    float shapeRadius = 150 - 60;

    noStroke();
    fill(0);
    beginShape();
    int degStep = sharp ? 9 : 30;
    float zeroRadius = 0;

    int deg = 0, end = 360;
    if (!sharp) {
        deg -= degStep;
        end += degStep;
    }

    for (int pertStep = 0; deg <= end; deg += degStep, pertStep = ++pertStep % perturbations.length) {
        float radius = shapeRadius + perturbations[pertStep] + random(30);
        if (zeroRadius == 0) zeroRadius = radius;
        if (deg <= 0 || deg >= 360) radius = zeroRadius; 
        float vX = cos(radians(deg)) * radius;
        float vY = sin(radians(deg)) * radius;
        if (sharp) {
            vertex(vX, vY);
        }
        else {
            curveVertex(vX, vY);
        }
        if (!saving) ellipse(vX, vY, 5, 5);
    }
    noFill();
    stroke(0);
    endShape(CLOSE);
}

void drawWet(boolean saving) {
    int[] perturbations = {0, 30, 30, 0, 0, 0};
    drawShape(saving, false, perturbations);
}

void drawSharp(boolean saving) {
    int[] perturbations = {0, 30, 0, 60, -20, 45};
    drawShape(saving, true, perturbations);
}

void draw() {
    background(255);

    pushMatrix();
    translate(250, 175);
    fill(0);
    drawWet(saving);
    if (!saving) {
        fill(0, 0, 255);
        ellipse(0, 0, 5, 5);
    }
    popMatrix();

    pushMatrix();
    translate(250, 175 + 350);
    drawSharp(saving);
    if (!saving) {
        pushMatrix();
        fill(0, 0, 255);
        ellipse(0, 0, 5, 5);
        popMatrix();
    }
    popMatrix();

    if (saving) {
        saving = false;
        saveFrame("form.png");
    }
}

void keyReleased() {
    if (key == 's')
        saving = true;

    redraw();
}

