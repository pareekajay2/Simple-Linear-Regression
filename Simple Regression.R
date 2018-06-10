dataset = read.csv('Salary_Data.csv')

set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

regressor = lm(formula = Salary ~ YearsExperience,
               data = training_set)

y_pred = predict(regressor, newdata = test_set)

ggplot() +
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary),
             colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience, predict(regressor, newdata = training_set)),
            colour = 'blue') +
  ggtitle('Salary vs Experience') +
  xlab('Years of Experience') +
  ylab('Salary')

ggplot() +
  geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary),
             colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience, predict(regressor, newdata = training_set)),
            colour = 'blue') +
  ggtitle('Salary vs Experience') +
  xlab('Years of Experience') +
  ylab('Salary')