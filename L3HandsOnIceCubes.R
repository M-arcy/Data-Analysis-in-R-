iceCubeWeights = c(.96, 1.51, 2.17, 3.85, 4.45, 6.02)

GramtoDiam = function(sphere) {2/2.54 * (sphere/(.92 * (4/3) * pi) ^ .3333333333)}

for(sphere in iceCubeWeights) {
  diam = GramtoDiam (sphere)
  cat(sphere, "grams equals", diam, "inches in diameter" , "\n")
}

