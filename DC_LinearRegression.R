age <- c(3,	4,	5,	6,	7,	8,	9,	11,	12,	14,	15,	16,	17)
Wing.Length <- c(1.4,	1.5,	2.2,	2.4,	3.1,	3.2,	3.2,	3.9,	4.1,	4.7,	4.5,	5.2,	5)
plot(age,Wing.Length)
lm(Wing.Length ~ age)
var.test(age, Wing.Length) #significant, reject H0
