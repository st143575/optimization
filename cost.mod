/*********************************************
 * OPL 12.8.0.0 Model
 * Author: chongshen
 * Creation Date: Dec 4, 2018 at 5:28:09 PM
 *********************************************/
// decision variables x and y.
 dvar float+ x;
 dvar float+ y;
 
 execute {
 	writeln('start reducing') 
 }
 
 // declaration
 dexpr float cost = 0.12*x + 0.15*y;
 
 // model
 minimize cost;
 subject to {
 	60*x + 60*y >= 300;
 	12*x + 6*y >= 36;
 	10*x + 30*y >= 90;
 }
 
 execute {
 	if(cplex.getCplexStatus() == 1) {
 		writeln('reduced cost of x= ', x.reducedCost)
 		writeln('reduced cost of y= ', y.reducedCost) 	
 	}
 }
