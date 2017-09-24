# Compile PS
#purs repl .psc-package/psc-0.11.5/*/*/src/*.purs .psc-package/psc-0.11.5/*/*/src/*/*.purs .psc-package/psc-0.11.5/*/*/src/*/*/*.purs .psc-package/psc-0.11.5/*/*/src/*/*/*/*.purs
set -f
purs compile `psc-package sources` "src/**/*.purs"
