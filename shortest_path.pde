
int gen_size = 20;
int pop_size = 100;
float mutationrate = 0.01;

Creature pop[];
PVector goal, start;

void setup(){
  size(800,800);
  
  stroke(255);
  noFill();
  start = new PVector(width/2, 0);
  goal = new PVector(width/2, height);
  pop = new Creature[pop_size];
  for(int i = 0; i < pop_size; i++)pop[i] = new Creature();
}


void draw(){
  background(0);
  
  int maxInd = 0;
  for(int i = 0; i < pop_size; i++){
    pop[i].calcFitness();
    pop[i].show(50);
    
    if(pop[maxInd].fitness < pop[i].fitness)maxInd = i;
  }
  pop[maxInd].show(255);
    print("G:"+frameCount + "  maxFit: "+ pop[maxInd].fitness * 100 + "   len: " + pop[maxInd].len +  "  dist S->G: "+ goal.dist(start) +"\n");
  pop = breadPopulation();
  
}