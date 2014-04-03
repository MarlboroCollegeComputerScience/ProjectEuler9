/* euler9.js in JavaScript
 *
 * Running it with node.js from the command line.
 *   $ time node euler9.js
 *   (a,b,c)=200,375,425; a*b*c=31875000
 *   user: 0m0.045s
 *
 * Jim Mahoney | cs.marlboro.edu | April 2014 | MIT License
 */

var pythagorean = function(a,b,c){
    return a*a + b*b == c*c;
}

var search = function(perimeter){
    for (var a = 1; a < 1 + perimeter/3; a++){
	for (var b = a+1; b < 1 + perimeter/2; b++){
	    var c = perimeter - a - b;
	    if (c > 0 && pythagorean(a,b,c)){
		return [a,b,c];
	    }
	}
    }
}

var answer = search(1000);
var product = answer[0] * answer[1] * answer[2]
console.log("(a,b,c)=" + answer + "; a*b*c=" + product)

