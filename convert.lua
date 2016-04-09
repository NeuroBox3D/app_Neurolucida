-- Copyright (c) 2010-2016:  G-CSC, Goethe University Frankfurt
-- Authors: Andreas Vogel, Sebastian Reiter
-- 
-- This file is part of UG4.
-- 
-- UG4 is free software: you can redistribute it and/or modify it under the
-- terms of the GNU Lesser General Public License version 3 (as published by the
-- Free Software Foundation) with the following additional attribution
-- requirements (according to LGPL/GPL v3 §7):
-- 
-- (1) The following notice must be displayed in the Appropriate Legal Notices
-- of covered and combined works: "Based on UG4 (www.ug4.org/license)".
-- 
-- (2) The following notice must be displayed at a prominent place in the
-- terminal output of covered works: "Based on UG4 (www.ug4.org/license)".
-- 
-- (3) The following bibliography is recommended for citation and must be
-- preserved in all covered files:
-- "Reiter, S., Vogel, A., Heppner, I., Rupp, M., and Wittum, G. A massively
--   parallel geometric multigrid solver on hierarchically distributed grids.
--   Computing and visualization in science 16, 4 (2013), 151-164"
-- "Vogel, A., Reiter, S., Rupp, M., Nägel, A., and Wittum, G. UG4 -- a novel
--   flexible software system for simulating pde based models on high performance
--   computers. Computing and visualization in science 16, 4 (2013), 165-179"
-- 
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
-- GNU Lesser General Public License for more details.


-- input folders
dirs = {
   './draguhn/Controls\ 03012016/',
   './draguhn/VEGFD\ 03012016/'
}

-- the file type to find in the folders
file_type = 'xml'

-- convert function 
local function convert(cells, basedir)
   -- actually convert the bunch of files
   for i, name in ipairs(cells) do
      print("Converting cell #" .. i .. ": " .. name .. " -> ugx")
       local n = Neurolucida()
       --[[ 
       --   Settings
       --      Separator for subset names
       --      Scaling for coordinates and diameters
       --]]
       n:set_separator("")
       n:set_scaling(1e-6)
       n:set_VRLOutputNames(true)
       n:print_setup()
       n:convert(basedir .. name)
   end
end

-- actually convert all files in directory
for k, v in pairs(dirs) do
   print("Converting directory #" .. k .. " ( " .. v .. ")")
   convert(scandir(v, file_type), v)
end
