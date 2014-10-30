#include "bus/centronics/ctronics.h"

class dmcntr_state : public driver_device
{
public:
	dmcntr_state(const machine_config &mconfig, device_type type, const char *tag)
	       : driver_device(mconfig, type, tag)
	{ }
};

static MACHINE_CONFIG_START( dmcntr, dmcntr_state )
	MCFG_CENTRONICS_ADD("centronics", centronics_devices, "printer")
MACHINE_CONFIG_END

ROM_START( dmcntr )
ROM_END

COMP( 2014, dmcntr, 0, 0, dmcntr, 0, driver_device, 0, "Dummy Centronics", "Dummy Centronics", GAME_NOT_WORKING )
