# Neurolucida application
Converts neuronal morphologies exported from Neurolucida to ProMesh compatible grid files

Please install/clone this repository through UG4's package manager
[ughub](https://github.com/UG4/ughub):

    ughub install Neurolucida_app

If you have not installed the corresponding UG4 plugin, then 
you need to install an additional package:
    
    ughub install Neurolucida

## How to use the example scripts ##
Once you compiled UG4 and after sourcing 'ugbash'
(cf. https://github.com/UG4/ughub/wiki#compilation-of-ug4),
you may execute a script e.g. like this (from any folder you like):

    ugshell -ex Neurolucida_app/convert.lua
