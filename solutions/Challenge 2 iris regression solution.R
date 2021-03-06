### Big question 2 answer: by using only an inflexible OLS linear regression model, we are assuming that linear relationships among the data - we don't know this for sure. 


### Challenge 2: iris regression solution

# Define Y response variable
Y_iris = iris$Sepal.Length 

# Remove outcome variable from the X dataframe
X_iris = subset(iris, select = -Sepal.Length)

# This will convert factors to indicators but will also add an extra constant
# column for estimating the intercept
X_iris = data.frame(model.matrix( ~ ., X_iris))

str(X_iris)

# Remove the extra intercept column, we don't need to store it in our dataset
X_iris = X_iris[, -1]

str(X_iris)

# Fit the regression model; lm() will automatically add a temporary intercept column
iris_fit = lm(Y_iris ~ ., data = X_iris)

# View the output
summary(iris_fit) 

# Predict outcome for the training data
iris_predicted = predict(iris_fit, X_iris)

# Calculate mean-squared error
MSE_iris = mean((Y_iris - iris_predicted)^2)

MSE_iris
sqrt(MSE_iris) # RMSE
 