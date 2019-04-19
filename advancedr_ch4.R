## 4.2 ##
x <- c(2.1, 4.2, 3.3, 5.4)

x[c(3, 1)]
x[order(x)]
# ���ƪ����Ц^�ǭ��ƪ���
x[c(1, 1)]
# ���бĵL����˥h
x[c(2.1, 2.9)]

# �t��ƱN�S�w�����ư�
x[-c(3, 1)]
# �L�k�P�ɨ����S���t
x[c(-1, 2)]

x[c(TRUE, TRUE, FALSE, FALSE)]
x[x > 3]

# �bx[y]��, �Yx�Py���פ��@�P, �h�Ĵ`���W�h
x[c(TRUE, FALSE)]
x[c(TRUE, FALSE, TRUE, FALSE)]
# NA�����Ц^��NA����
x[c(TRUE, TRUE, NA, FALSE)]

# �d�իh�^�ǭ�V�q, �o�b1���V�q�ݤ��X�γB, ���b2���H�W�D�`����
x[]

# 0�^�Ǫ���0���V�q
x[0]

# �Y�w�Q�R�W, �h�i�Φr���V�q�^�Ǭ۲Ū�����
(y <- setNames(x, letters[1:4]))
y[c("d", "c", "a")]
y[c("a", "a", "a")]
z <- c(abc = 1, def = 2)
# ��[]���l���ħ����ǰt
z[c("a", "d")]

# factor"�L�k"������l�����ʧ@
# �]���L��J���Ofactor������integer�V�q
y[factor("b")]

# �blist��, ��[���l���^��list, ��[[��$�h�^�ǦC����������


a <- matrix(1:9, nrow = 3)
colnames(a) <- c("A", "B", "C")
a[1:2, ]
a[c(TRUE, FALSE, TRUE), c("B", "A")]
a[0, -2]

# �bmatrices��arrays��, [�N���G�ɥi��²�ƨ�̤p����
# �U��̬ҬO�@���V�q
a[1, ]
a[1, 1]

?outer
vals <- outer(1:5, 1:5, FUN = "paste", sep = ",")
vals
vals[]

# �]��array�O�@��@��s��, �ҥH�]��γ�@���Ʀr�Ө�
# �ѥ��ܥk, �k�W�ܤU, ����1,3,17�Ӥ���
vals[c(1, 3, 17)]

# �Ϊ̥ίx�}���l��
select <- matrix(ncol = 2, byrow = TRUE, c(
  1, 1,
  3, 1,
  2, 4
))
vals[select]

# ���γ�@��index�ӹ�data frame���l��
# �h�欰���Olist, �����O��

# ����2��index�ӹ�data frame���l
# �h�欰���{�p�Pmatrix

df <- data.frame(x = 1:3, y = 3:1, z = letters[1:3])

df[df$x == 2, ]
df[c(1, 3), ]
df[c("x", "z")]
df[, c("x", "z")]

# �`�N: ���n�����O��@�V�q
# �x�}�����k�|�N��X²�Ƭ��V�q
# �C�������k�h���|
str(df["x"])
str(df[, "x"])

# �M��tibble���צ�ر��p���^��tibble
df <- tibble::tibble(x = 1:3, y = 3:1, z = letters[1:3])

str(df["x"])
str(df[, "x"])

# �]�wdrop = FALSE�O�d����

a <- matrix(1:4, nrow = 2)
str(a[1, ])
str(a[1, , drop = FALSE])

df <- data.frame(a = 1:2, b = 1:2)
str(df[, "a"])
str(df[, "a", drop = FALSE])

# �N���פ�²�`�ϵ{���ʥF�u�Ω�
# �ϱo���Ǳ��p�i��, ���Ǳ��p����bug

# �Өϥ�factor�ɤ]��drop�o���ܶ�
# ����W���ͪ����Ӥ@��
z <- factor(c("a", "b"))
z[1]
z[1, drop = TRUE]

# exercise
# 1
mtcars[mtcars$cyl == 4, ]
mtcars[-(1:4), ]
mtcars[mtcars$cyl <= 5, ]
mtcars[mtcars$cyl %in% c(4 ,6), ]

# 2
x <- 1:5
x[NA]
x[NA_real_]
typeof(NA)
typeof(NA_real_)
# �]��NA��type�Ological�ҥH�|���`���W�h

# 3
x <- outer(1:5, 1:5, FUN = "*")
upper.tri(x)
x[upper.tri(x)]

# 4
mtcars[1:20]
mtcars[1:10]
str(mtcars)  # �u��11��

# 5
diag

# 6
df <- data.frame(a = c(1, NA, 3),
                 b = c(NA, 2, NA),
                 c = c(1, 2, 3))
is.na(df)
df[is.na(df)] <- 0
df

## 4.3 ##

# 2�ب��l�����B��l�G[[ �P $
# x$y ���P�� x[["y"]]

# �p�G��Cx�O�@�����۳f��������
# x[[5]]�O����5�`���[���F��
# x[4:6]�O����4~6�`���[

x <- list(1:3, "a", 4:6)
x[1]
x[[1]]

# �]��[[�u��^�ǳ�@������
# �ҥH[[���������O��@������ƩΪ̳�@���r��
# �p�G�̭���V�q ex: x[[c(1, 2)]]
# �h�|�Q����x[[1]][[2]]

# ���׬Oatomic vectors�άOlists, ������@���خ�,
# �ϥ�[[�ӫD[, �O�Ӹ����O�I���n�ߺD


# ��column names�s�b�ܼƩ��U
# ���ɥ�$�|�X�t��
var <- "cyl"
mtcars$var  # �ݥ�mtcars[["cyl"]]
mtcars[[var]]

# $�P[[�@�ӭ��n���t�O�O: $�|�������t��
x <- list(abc = 1)
x[[a]]
x$a

# ���Fĵ�i�o�ئ欰, ��ĳ�]�wglobal option : 
# options(warnPartialMatchDollar = TRUE)
x$a


# ����index���F�褣�s�b, ���S���Ʊ�X�{error
# �i�ϥ�purrr:pluck
# ��purrr:chuck�ۦP���p�U�h�O���^��error
x <- list(
  a = list(1, 2, 3),
  b = list(3, 4, 5)
)
purrr::pluck(x, "a", 1)   # ���� x[["a"]][[1]]
purrr::pluck(x, "c", 1)
purrr::pluck(x, "c", 1, .default = NA)


# �t�~2�ب��l������k: @, slot()
# �L�̧@�Ω�S4����
# @������$
# slot������[[

# exercise
# 1
mtcars$cyl[[3]]
mtcars[["cyl"]][[3]]
mtcars[3, "cyl"]
# 2
mod <- lm(mpg ~ wt, data = mtcars)

attributes(mod)
mod[["df.residual"]]

attributes(summary(mod))
summary((mod))$r.squared


## 4.4 ##

# �V�q�����P���
x <- 1:5
x[c(1, 2)] <- c(101, 102)
x

# �����C������
x <- list(a = 1, b = 2)
x[["b"]] <- NULL
str(x)

# �Ū��l�C��
y <- list(a = 1, b = 2)
y["b"] <- list(NULL)
str(y)

# ���Ŷ��b��Ȯ�, �i���īO�d�쪫�󪺵��c
mtcars[] <- lapply(mtcars, as.integer)
is.data.frame(mtcars)

mtcars <- lapply(mtcars, as.integer)
is.data.frame(mtcars)

rm(mtcars)
## 4.5 ##

# �d�\�� (�r������)
x <- c("m", "f", "u", "f", "f", "m", "m")
lookup <- c(m = "Male", f = "Female", u = NA)
lookup[x]
unname(lookup[x])

# �Hgrades�t��
grades <- c(1, 2, 2, 3, 1)
info <- data.frame(
  grade = 3:1,
  desc = c("Excellent", "Good", "Poor"),
  fail = c(F, F, T)
)
id <- match(grades, info$grade)
id
info[id, ]
