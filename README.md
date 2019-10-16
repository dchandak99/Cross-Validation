# Cross-Validation

During my current course 'Data Anaylsis and Interpretation', in which our course instructors are Image processing specialists we have worked on several interesting assignments on this topic and implemented them in MATLAB. One of them was the PDF Estimator where we compared various non parametric estimation techniques like histogramming and Kernel Density Estimation and implemented cross-validation procedure, an application of Machine Learning. In another problem, we were given two {\it Magentic Resonance Images} (MRIs) of a portion of human brain, acquired with different settings of the MRI machine. After casting the images as a double array, we were asked to shift the second image by various amounts and for each compute the correlation coefficient (CC) and quadratic mutual information (QMI) for the first image and shifted versions of second image. The major point was to realise after several plots was that QMI is a much stronger indicator than the CC and anaylze why so.

Problem Statement:

We have extensively seen parametric PDF estimation in class via maximum likelihood. In many situations, the

family of the PDF is however unknown. Estimation under such a scenario is called nonparametric density es-
timation. We have studied one such technique in class, namely histogramming, and we also analyzed its rate

of convergence. There is another popular technique for nonparametric density estimation. It is called KDE or
Kernel density esitmation, the formula for which is given as ˆpn(x; σ) =
Pn
i=1 exp (−(x − xi)
2/(2σ
2
))

nσ√
2π

. Here ˆpn(x)

is an estimate of the underlying probability density at value x, {xi}
n
i=1 are the n samples values, from which the
unknown PDF is being estimated, and σ is a bandwidth parameter (similar to a histogram bin-width parameter).
The choice of the appropriate σ is not very straightforward. We will implement one possible procedure to choose
σ - called cross-validation. For this, do as follows:
(a) Use MATLAB to draw n = 1000 independent samples from N (0, 16). We will use a random subset of 750
samples (set T) for building the PDF, and the remaining 250 as the validation set V . Note that T and V
must be disjoint sets.
(b) In your report, write down an expression for the joint likelihood of the samples in V , based on the estimate
of the PDF built from T with bandwidth parameter σ
(c) For different values of σ from the set {0.001, 0.1, 0.2, 0.9, 1, 2, 3, 5, 10, 20, 100}, write MATLAB code to evaluate
the log of the joint likelihood LL of the samples in V , based on the estimate of the PDF built from T. Plot
of a graph of LL versus log σ and include it in your report. In the report, state which value of σ yielded the
best LL value, and print it via your code as well. This procedure is called cross-validation. 
(d) In this experiment, we know the ground truth pdf which we shall denote as p(x). So we can peek into
it, in order to choose the best σ. This is impractical in actual experiments, but for now it will serve as a
method of comparison. For each σ, write MATLAB code to evaluate D =
P
xi∈V
(p(xi) − pˆn(x; σ))

P

2 D =

xi∈V
(p(xi) − pˆn(xi
; σ))2
. Plot of a graph of D versus log σ and include it in the report. In the report, state
which value of σ yielded the best D value, and also what was the D value for the σ parameter which yielded
the best LL.



HOW TO RUN MY CODE:
Run cross.m and the plots will be generated. Sample plots are given
