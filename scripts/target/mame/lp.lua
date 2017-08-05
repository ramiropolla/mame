CPUS["M6805"] = true
CPUS["UPD7810"] = true
CPUS["NEC"] = true

SOUNDS["BEEP"] = true
SOUNDS["DAC"] = true
SOUNDS["SPEAKER"] = true
SOUNDS["VOLT_REG"] = true

MACHINES["E05A03"] = true
MACHINES["E05A30"] = true
MACHINES["EEPROMDEV"] = true
MACHINES["STEPPERS"] = true

BUSES["CENTRONICS"] = true

function createProjects_mame_lp(_target, _subtarget)
	project ("mame_lp")
	targetsubdir(_target .."_" .. _subtarget)
	kind (LIBTYPE)
	uuid (os.uuid("drv-mame-lp"))
	addprojectflags()
	precompiledheaders()

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
	MAME_DIR .. "src/mame/drivers/dmcntr.cpp",
}
end

function linkProjects_mame_lp(_target, _subtarget)
	links {
		"mame_lp",
	}
end
