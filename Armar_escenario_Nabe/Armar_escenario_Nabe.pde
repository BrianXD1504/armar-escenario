PImage fondoImage,jugadorImage,enemigoImage,nubeImage;
ArrayList<Cloud> clouds = new ArrayList<Cloud>();
int playerWidth = 250; // Ancho del jugador
int playerHeight = 100; // Alto del jugador
int enemyWidth = 150; // Ancho del enemigo
int enemyHeight = 150; // Alto del enemigo
int enemyX = 600, enemyY = 200;
int enemySpeed = 2;
int direction = 1;

void setup() {
  size(1000, 550);
  loadImages();
  createClouds();
}

void draw() {
  image(fondoImage, 0, 0, width, height);
  drawClouds();
  moveEnemy();
  // Asegurarse de que el jugador no salga de la pantalla
  int playerX = constrain(mouseX - playerWidth/2, 0, width - playerWidth);
  int playerY = constrain(mouseY - playerHeight/2, 0, height - playerHeight);
  image(jugadorImage, playerX, playerY, playerWidth, playerHeight);
}

void loadImages() {
  fondoImage = loadImage("Fondo.jpg");
  jugadorImage = loadImage("NAbe.png");
  enemigoImage = loadImage("enemifo.png");
  nubeImage = loadImage("asteroide.png");
}

void createClouds() {
  for (int i = 0; i < 25; i++) {
    clouds.add(new Cloud(random(width), random(height), random(100, 150), random(1, 5)));
  }
}

void drawClouds() {
  for (Cloud cloud : clouds) {
    image(cloud.getImage(), cloud.getX(), cloud.getY(), cloud.getSize(), cloud.getSize());
    cloud.setX(cloud.getX() + cloud.getSpeed());
    if (cloud.getX() > width) {
      cloud.setX(0);
      cloud.setY(random(height));
    }
  }
}

void moveEnemy() {
  image(enemigoImage, enemyX, enemyY, enemyWidth, enemyHeight);
  enemyX += enemySpeed * direction;
  if (enemyX <= 0 || enemyX >= width - enemyWidth) {
    direction *= -1;
  }
}
