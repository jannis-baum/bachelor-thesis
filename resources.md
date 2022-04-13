# Resources

## Retrievable information

- allele function at
  [CPIC](https://documenter.getpostman.com/view/1446428/Szt78VUJ?version=latest#2f369437-e6b5-408d-9dfc-266882acd1f1)
  - `Uncertain | No | Decreased | Normal | Increased Function` at
    `.clinicalfuncationalstatus`
  - `.activityvalue` is sometimes given (may be `null`), e.g. `0` being no
    function, `1-1.5` being normal function
    - may include non-numeric characters, e.g. `≥3` for increased function
    - may be `n/a` if `activityvalue` is given & `clinicalfuncationalstatus` is
      `Uncertain Function`
