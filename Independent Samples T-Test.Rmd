# T-TEST

## **LOAD LIBRARIES**

```{r}
# To get a summary statistics table
library(gtsummary) 

# To get a statistical report of our test
library(report) 

# To run Levene's test
library(lawstat) 

# To visualize data
library(ggpubr) 
```

## **LOAD DATA**

```{r}
# Store our dataset `mtcars` from the datasets package in object `df`
df <- datasets::mtcars

# View our data
View(df)

# Attach our data
attach(df)

# Documentation of the `mtcars` dataset
?mtcars
```

## **DESCRIPTIVE ANALYSIS**

```{r}
# Create a summary statistics table
tbl_summary(df, by = "am")
```

## **T-TEST ASSUMPTIONS**

1.  Independence: Observations in one sample are independent of the observations in the other sample.

2.  Random sampling: Both samples are obtained using a random sampling method.

3.  Normality: Both samples are approximately normally distributed.

    ```{r}
    # Plot histograms for `mpg` data grouped over `am`
    hist(mpg[am==0])
    hist(mpg[am==1])

    # Plot Q-Q plots for `mpg` data grouped over `am`
    qqnorm(mpg[am==0])
    qqnorm(mpg[am==1])

    # Perform the Shapiro-Wilk test for `mpg` data grouped over `am`
    shapiro.test(mpg[am==0])
    shapiro.test(mpg[am==1])
    ```

4.  Homogeneity of variances: Both samples have approximately the same variance.

    ```{r}
    # Perform the Levene's test for `mpg` data grouped over `am`
    levene.test(mpg, am)
    ```

## **T-TEST**

```{r}
# Perform the t-test and store the results in an object `tt`
tt <- t.test(mpg ~ am, 
             paired=F, 
             var.equal=F)

# Reports the results of the t-test
report(tt)
```

## PLOTS

```{r}
# Plots a simple mean and confidence interval plot for `mpg` grouped over `am`
ggline(data=df, 
       x="am", 
       y="mpg", 
       add="mean_ci", 
       color = "am", 
       size = 1)

# Plots a boxplot for `mpg` grouped over `am`
ggboxplot(data=df, 
          x="am", 
          y="mpg", 
          fill = "am")
```
