# 613 Shiny Project
Jacob Henkels &amp; David Saff

Our shiny app uses data from the World Happiness Report in 2019. This data lists 158 countries and their scores for the 2019 WHR.

There are variables for each country including: Overall rank, Score, GDP Per Capita, Social Support, Healthy Life Expectancy, Freedom to make life choices, Generosity,
and Perceptions of corruption.

Using our Shiny app, you can select a country to view its overall rank as well as how it scored on the World Happiness Report and the other variables. 
This portion of the app uses a drop-down menu where you can input a country to learn more about.

The next part of the app uses two more drop down boxes where a user can select the independent variable and dependent variable. The text output associated with these selection boxes shows the results of a least squares linear regression model between the selected variables.

The corresponding plot shown below the summary statistics  displays a scatter plot of how the chosen independent variable corresponds to the overall WHR score. Using this, one can see which variables have the most effect on a country's happiness score.
