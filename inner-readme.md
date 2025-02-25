# Supplement for "Incremental Forward Reasoning for White-Box Proof Search"

This is the artifact corresponding to the project **Incremental Forward Reasoning for White-Box Proof Search**.

It is composed of:
- The implementation in the Lean4 Programming Language and Theorem Prover inside of the **aesop** and **saturate** tactics.
- A Benchmark file.
- A Data file recording our local benchmark runs.

## Connection with the paper
The paper associated to this projects explains different key points of the work in Section 4 and 5.
Most of the relevant implementation can be found in:
- `Aesop.Forward.State` and `Aesop.Forward.RuleInfo`

These two files contain : **Forward States**, **Rule States**, **Variable Indices**, **Algorithm 1** and **2**, **Variable Clusters**, **Redundant Hypotheses** and **Lazy Insertions**.

Furthermore, the code associated to **Match Equivalences** can be found in `Aesop.Forward.Match.Types` and, for **Normal Form**, in `Aesop.RPINF.Basic`.

For Section 6, the code associated to the Benchmark can be found in `AesopTest.Foward`.

TODO : Link `Aesop.Index.Forward`?

## Benchmark Guide

The base benchmark can be executed in two different ways :
- Either by running `lake build +Benchmark` in the project's directory;
- or, by simply running the lean file in some editor (e.g. VSCode). In this case, the results will be printed in the infoview.

This will run the benchmark in the same configuration as in the paper **once** (As opposed of taking the average of 20 runs).
This take about 8 minutes on our machine. (MacBook Pro with an Apple M2 Pro processor and 32GB of RAM.)

#### Custom Benchmark

It is also possible to execute the benchmarks with custom options.
Please consult the benchmark file in the project's main directory, it contains all the relevant information on the benchmark's parameters.
