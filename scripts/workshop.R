# Introduction to R Programming Workshop ----------------------------------


# R working directory -----------------------------------------------------
# Get your current working directory
getwd()
setwd('') # absolute path
setwd('') # relative path

# Getting started with R --------------------------------------------------
# Let's start with print command
print("Hello world!")

# Now try running...
Print("Hello world!")   # print with a capital P
print ("Hello world!")  # print with a space
"Hello world!"          # just entering the text

# R as a calculator
2 + 2
4 * 2
8 / 3
exp(log(8)-log(3))

# Making assignments
x <- log(8)
y <- log(3)
exp(x-y)

# Concatenating multiple values
n <- c(2, 3, 5, 8, 13, 21, 34, 55)
n * 2

# Making logical comparison
n > 9
n == 8
25 %in% n
55 %in% n
c(25,55) %in% n

