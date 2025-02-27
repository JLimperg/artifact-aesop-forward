# Supplement for "Incremental Forward Reasoning for White-Box Proof Search"

This is the supplement for the paper *Incremental Forward Reasoning for
White-Box Proof Search* by Jannis Limperg and Xavier Généreux. The supplement
contains

- a snapshot of the Aesop source code, including the forward reasoning
  algorithm described in the paper;
- the benchmarks described in the paper;
- the raw benchmark data.

## Aesop Source Code

The `aesop/` directory contains source code for the version of Aesop
described in the paper.

The naive forward reasoning algorithm described in Sec. 3 is implemented by the
`makeForwardHyps` function in `Aesop/RuleTac/Forward.lean`.

The incremental forward reasoning algorithm described in Sec. 4 and 5 is
implemented primarily in the following files.

- `Aesop/Forward/Substitution.lean`:
  substitutions.
- `Aesop/Forward/Match/Types.lean` and `Aesop/Forward/Match.lean`:
  matches and match equivalence.
- `Aesop/Forward/RuleInfo.lean`:
  slots and variable clusters.
- `Aesop/Forward/State`:
  variable indices, rule states and forward states including Algorithm 1 and 2,
  deletion, hypothesis redundancy and lazy insertion.
- `Aesop/RPINF/Basic.lean` and `Aesop/RPINF.lean`:
  RPINF normal form.
- `Aesop/Index/Forward.lean`:
  discrimination tree index for forward rules.

### Running and Testing Aesop

To build and test Aesop, first install
[`elan`](https://github.com/leanprover/elan), the Lean version manager.
In the Docker image, `elan` is already pre-installed.

Then run the following commands in the `aesop/` directory:

1. `lake build`  
   This command downloads Lean (which takes around 1.5GB of disk space) and
   Aesop's dependencies and builds Aesop. It should report no errors or
   warnings.
2. `lake test`  
   This command runs the Aesop test suite. It should report no errors or
   warnings.

## Benchmarks

The `aesop/` directory also contains the benchmarks described in the paper.
They are implemented in the following files.

- `Benchmark/Basic.lean`:
  basic definitions, including our custom natural number type.
- `Benchmark/Command.lean`:
  a command that runs benchmarks with various options.
- `Benchmark/Trans.lean`, `Benchmark/Indep.lean` and `Benchmark/Depth.lean`:
  the transitivity, independence and depth benchmark.
- `Benchmark/Cascade.lean` and `Benchmark/Cluster.lean`:
  two additional benchmarks not discussed in the paper.
- `Benchmark.lean`:
  the main benchmark entrypoint.

To run the benchmarks, run (in the `aesop/` directory) the command
```
lake build +Benchmark
```

This runs the benchmarks in the same configuration as in the paper.
However, each benchmark is only run once, rather than taking the average of 20
runs. One run takes about 10 minutes, with most of that time spent on the transitivity benchmark.

The benchmarks have various parameters, which can be adjusted by editing the
`Benchmark.lean` file.

## Benchmark Data

The `data/` directory contains the data that was used to produce the graphs in
the paper, i.e. the output of `lake build +Benchmark` with 20 runs on a MacBook
Pro with an M2 Pro processor and 32GB of RAM.
