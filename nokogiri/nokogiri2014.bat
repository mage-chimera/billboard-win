FOR /L %%y IN (1990, 1, 2013) DO (
  curl https://en.wikipedia.org/wiki/Billboard_Year-End_Hot_100_singles_of_%%y > %%y.html
)
