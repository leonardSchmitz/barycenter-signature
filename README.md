# barycenter-signatures

This is the companion package to the article  "Learning barycenters from signature matrices" [[2]](#2) 
in the computer algebra system [OSCAR](https://www.oscar-system.org). 
We contribute in the theory of path recovery [[4]](#4) for barycenters [[3]](#3) of signatures matrices. This package 
helped us with experiments, tests and illustrations. 
In order to support future investigation also on higher signature tensors [[1]](#1)[[4]](#4), we provide a full 
and novel implementation of the Lie group barycenter that is independent of the dimension 
and truncation level. Furthermore, we implement signatures for piecewise linear and polynomial paths with 
symbolic methods to reconstruct the path that is associated to a Lie group barycenter. 

## Reference

<a id="1">[1]</a>
C. Amendola, P. Friz,  B. Sturmfels</br>
[Varieties of Signature Tensors](https://www.cambridge.org/core/journals/forum-of-mathematics-sigma/article/varieties-of-signature-tensors/53CCE644BC95B0F83EB458AADA72EEE5)</br>
Forum of Mathematics, Sigma, 2019. 

<a id="2">[2]</a>
C. Amendola, L. Schmitz </br>
[Learning barycenters from signature matrices](https:/) </br>
arXiv:, 2025. 

<a id="3">[3]</a>
M. Clausel, J. Diehl, R. Mignot, L.Schmitz, N. Sugiura and K. Usevich </br>
[The barycenter in free nilpotent Lie groups and its application to iterated-integrals signatures](https://epubs.siam.org/doi/abs/10.1137/23M159024X)</br>
SIAM Journal on Applied Algebra and Geometry, 2024. </br>
[(github)](https://github.com/diehlj/free-nilpotent-lie-group-barycenter)</br>

<a id="4">[4]</a>
M. Pfeffer, A. Seigal, and B. Sturmfels </br> 
[Learning Paths from Signature Tensors](https://https://epubs.siam.org/doi/10.1137/18M1212331)</br>
SIAM Journal on Matrix Analysis and Applications, 2019. </br>

## Contact

**Authors**

- **Carlos Amendola**  
  Technische Universität Berlin, Algebraic and Geometric Methods in Data Analysis, Berlin  
  Email: [amendola[at]math.tu-berlin.de](mailto:amendola@math.tu-berlin.de)

- **Leonard Schmitz**  
  Technische Universität Berlin, Algebraic and Geometric Methods in Data Analysis, Berlin  
  Email: [lschmitz[at]math.tu-berlin.de](mailto:lschmitz@math.tu-berlin.de)

## Set up
1. Clone the repository by running
   ```
   git clone git@github.com:leonardSchmitz/barycenter-signature.git
   ```
2. Install [OSCAR](https://www.oscar-system.org)
3. Open julia in the project folder via
   ```
   julia -- project
   ``` 
4. The first time using the package, use
   ```
   using Pkg 
   Pkg.instantiate()
   ```
3. Start the package with  
   ```
   using Oscar 
   using barycenter
   ```

## Usage 
We refer to Section 8 in [[2]](#2) for an illustration on how to use the package. 
See also the [manual](https://docs.oscar-system.org/stable/) of OSCAR. 

## Examples
We provide the source code for all examples presented in [[2]](#2). 
Additionally we present several test for technical results. 
The folloing list helps the reader to find the relevant source file.  

| Reference in [[2]](#2) | name of file                         |
|------------------------|--------------------------------------|
| Example 3.4            | `examples/example82.jl`              |
| Lemma 3.9              | `tests/linearTransforms.jl`          |
| Example 3.7            | `examples/example37.jl`              |
| Theorem 4.3            | `tests/baryTests.jl`                 |
| Proposition 4.4        | `tests/baryTests.jl`                 |
| Proposition 4.5        | `tests/baryTests.jl`                 |
| Example 4.6            | `tests/baryTests.jl`                 |
| Proposition 4.8        | `tests/baryTests.jl`                 |
| Remark 4.10            | `tests/bary2ndTruncTest`             |
| Proposition 4.11       | `tests/bary2ndTruncTest`             |
| Example 6.2            | `examples/example84.jl`              |
| Example 6.4            | `examples/example64.jl`              |
| Proposition 6.5        | `tests/linearTransforms.jl`          |
| Proposition 7.1        | `tests/Bd2_tests.jl`                 |
| Theorem 7.2            | `tests/Bd2_tests.jl`                 |
| Lemma 7.3              | `tests/signature_matrix_tests.jl`    |
| Example 7.4            | `examples/example74.jl`              |
| Corollary 7.5          | `tests/signature_matrix_tests.jl`    |
| Lemma 7.6              | `tests/signature_matrix_tests.jl`    |
| Lemma 7.7              | `tests/signature_matrix_tests.jl`    |
| Example 7.8            | `examples/example78.jl`              |
| Lemma 7.9              | `tests/signature_matrix_tests.jl`    |
| Proposition 7.10       | `tests/W_alpha_tests.jl`             |
| Corollary 7.11         | `tests/signature_matrix_tests.jl`    |
| Example 7.12           | `examples/example712.jl`             |
| Example 7.13           | `examples/example713.jl`             |
| Example 8.1            | `examples/example81.jl`              |
| Example 8.2            | `examples/example82.jl`              |
| Example 8.3            | `examples/example83.jl`              |
| Example 8.4            | `examples/example84.jl`              |
| Example 8.5            | `examples/example85.jl`              |
| Example 8.6            | `examples/example86.jl`              |


## Efficiency remarks

The purpose of this package is to support research, test conjectures, and enable experimentation. 
Several solutions have been kept simple and are not optimal from an implementation perspective. 
Achieving optimality is the next step. 
We report performance timings on a MacBook Air (1.6 GHz Dual-Core Intel Core i5).

1. We compute the barycenter of two signatures of random paths `sX1` and `sX2` in dimension `d=4` 
and truncation level `k=5` with `alpha[1]=4` and `alpha[2]=5` segments, respectively. We compare 
our standard method `bary` with our special method `bary_2samples` for `N=2` samples, which 
implements Proposition 4.4 in [[2]](#2). 
One of the reasons for the big difference is that `bary` constructs the underlying non-commutative 
polynomial according to the proof of Proposition 4.9 in [[2]](#2) every time it is called. The 
polynomial for `bary_2samples` is much shorter but produces the same result. We provide the complete 
source code of this comparison in `tests/baryTests.jl`. 

```
  @time bary_2samples(sX1,sX2);
    # 0.309488 seconds (1.06 M allocations: 59.126 MiB, 35.92% gc time)
  
  @time bary([sX1,sX2]);
    # 4.765893 seconds (58.59 M allocations: 3.393 GiB, 32.91% gc time)
```

2. In the special case of matrix truncation (`k=2`) we can use the command `bary_2nd_trunc` based 
on the the polynomial factorization according to Remark 4.10 in [[2]](#2). We report already 
remarable time improvings for `N=100` signatures `sX` of random paths. In `bary_2nd_trunc_closedform`
we implement the complete expression according to Proposition 4.11. We provide the complete
source code of this comparison in `tests/bary2ndTruncTests.jl`.


```
  @time bary_2nd_trunc(sX)
    # 0.016592 seconds (129.30 k allocations: 7.413 MiB)

  @time bary_2nd_trunc_closedform(sX);
    # 0.365100 seconds (1.81 M allocations: 117.283 MiB, 30.82% gc time)

  @time bary(sX)
    # 1.938035 seconds (29.74 M allocations: 1.906 GiB, 35.24% gc time)
```


## Related packages 

- C. Amendola, A. E. Saliby, F. Lotter, and O. R. Fite</br>
[Computing Path Signature Varieties in Macaulay2](https://arxiv.org/abs/2506.01429)</br>
arXiv:2506.01429, 2025</br>

- J. Diehl and R. Krieg</br>
[FRUITS: feature extraction using iterated sums for time series classification](https://link.springer.com/article/10.1007/s10618-024-01068-1) </br>
Data Mining and Knowledge Discovery, 2024.</br>

- P. Kidger and T. Lyons</br>
[Signatory: differentiable computations of the signature and logsignature transforms
on both CPU and GPU](https://github.com/patrick-kidger/signatory)</br>
International Conference on Learning Representations, 2021. 

- J. F. Reizenstein and B. Graham</br>
[Algorithm 1004: The Iisignature Library: Efficient Calculation of Iterated
Integral Signatures and Log Signatures](https://dl.acm.org/doi/10.1145/3371237)</br>
ACM Trans. Math. Softw., 2020.</br>

