-- license:BSD-3-Clause
-- copyright-holders:MAMEdev Team

---------------------------------------------------------------------------
--
--   dmcntr.lua
--
--   Small driver-specific example makefile
--   Use make SUBTARGET=dmcntr to build
--
---------------------------------------------------------------------------


--------------------------------------------------
-- Specify all the CPU cores necessary for the
-- drivers referenced in dmcntr.lst.
--------------------------------------------------

CPUS["M6805"] = true
CPUS["UPD7810"] = true

--------------------------------------------------
-- Specify all the sound cores necessary for the
-- drivers referenced in dmcntr.lst.
--------------------------------------------------

SOUNDS["BEEP"] = true
SOUNDS["DAC"] = true

--------------------------------------------------
-- specify available video cores
--------------------------------------------------

--------------------------------------------------
-- specify available machine cores
--------------------------------------------------

MACHINES["E05A03"] = true
MACHINES["E05A30"] = true
MACHINES["EEPROMDEV"] = true
MACHINES["STEPPERS"] = true

--------------------------------------------------
-- specify available bus cores
--------------------------------------------------

BUSES["CENTRONICS"] = true

--------------------------------------------------
-- This is the list of files that are necessary
-- for building all of the drivers referenced
-- in dmcntr.lst
--------------------------------------------------

function createProjects_mame_dmcntr(_target, _subtarget)
	project ("mame_dmcntr")
	targetsubdir(_target .."_" .. _subtarget)
	kind (LIBTYPE)
	uuid (os.uuid("drv-mame-dmcntr"))
	
	options {
		"ForceCPP",
	}
	
	includedirs {
		MAME_DIR .. "src/osd",
		MAME_DIR .. "src/emu",
		MAME_DIR .. "src/devices",
		MAME_DIR .. "src/mame",
		MAME_DIR .. "src/lib",
		MAME_DIR .. "src/lib/util",
		MAME_DIR .. "3rdparty",
		GEN_DIR  .. "mame/layout",
	}

	files{
		MAME_DIR .. "src/mess/drivers/dummy_centronics.c",
	}
end

function linkProjects_mame_dmcntr(_target, _subtarget)
	links {
		"mame_dmcntr",
	}
end
