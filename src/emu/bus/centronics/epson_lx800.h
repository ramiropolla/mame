// license:MAME, GPL-2.0+
// copyright-holders:Dirk Best
/**********************************************************************

    Epson LX-800 dot matrix printer emulation

    Copyright MESS Team.
    Visit http://mamedev.org for licensing and usage restrictions.

**********************************************************************/

#pragma once

#ifndef __EPSON_LX800__
#define __EPSON_LX800__

#include "emu.h"
#include "ctronics.h"
#include "cpu/upd7810/upd7810.h"
#include "machine/e05a03.h"
#include "machine/e05a30.h"
#include "machine/eepromser.h"
#include "machine/steppers.h"
#include "sound/beep.h"
#include "sound/speaker.h"



//**************************************************************************
//  TYPE DEFINITIONS
//**************************************************************************

// ======================> epson_lx800_t

class epson_lx800_t :  public device_t,
						public device_centronics_peripheral_interface
{
public:
	// construction/destruction
	epson_lx800_t(const machine_config &mconfig, const char *tag, device_t *owner, UINT32 clock);
	epson_lx800_t(const machine_config &mconfig, device_type type, const char *name, const char *tag, device_t *owner, UINT32 clock, const char *shortname, const char *source);

	// optional information overrides
	virtual const rom_entry *device_rom_region() const;
	virtual machine_config_constructor device_mconfig_additions() const;
	virtual ioport_constructor device_input_ports() const;

	DECLARE_READ8_MEMBER(porta_r);
	DECLARE_WRITE8_MEMBER(porta_w);
	DECLARE_READ8_MEMBER(portc_r);
	DECLARE_WRITE8_MEMBER(portc_w);
	DECLARE_READ8_MEMBER(centronics_data_r);
	DECLARE_WRITE_LINE_MEMBER(centronics_pe_w);
	DECLARE_WRITE_LINE_MEMBER(paperempty_led_w);
	DECLARE_WRITE_LINE_MEMBER(reset_w);
	DECLARE_READ_LINE_MEMBER(an0_r);
	DECLARE_READ_LINE_MEMBER(an1_r);
	DECLARE_READ_LINE_MEMBER(an2_r);
	DECLARE_READ_LINE_MEMBER(an3_r);
	DECLARE_READ_LINE_MEMBER(an4_r);
	DECLARE_READ_LINE_MEMBER(an5_r);

protected:
	// device-level overrides
	virtual void device_start();
	virtual void device_reset();

	required_device<cpu_device> m_maincpu;
	required_device<beep_device> m_beep;
};


// ======================> epson_lx810l_t

class epson_lx810l_t :  public epson_lx800_t
{
public:
	// construction/destruction
	epson_lx810l_t(const machine_config &mconfig, const char *tag, device_t *owner, UINT32 clock);

	// optional information overrides
	virtual const rom_entry *device_rom_region() const;
};


// ======================> epson_ap2000_t

class epson_ap2000_t :  public epson_lx800_t
{
public:
	// construction/destruction
	epson_ap2000_t(const machine_config &mconfig, const char *tag, device_t *owner, UINT32 clock);

	// optional information overrides
	virtual const rom_entry *device_rom_region() const;
	virtual machine_config_constructor device_mconfig_additions() const;
	virtual ioport_constructor device_input_ports() const;

	required_device<eeprom_serial_93cxx_device> m_eeprom;

	DECLARE_READ8_MEMBER(porta_r);
	DECLARE_WRITE8_MEMBER(porta_w);
	DECLARE_READ8_MEMBER(portb_r);
	DECLARE_WRITE8_MEMBER(portb_w);
	DECLARE_READ8_MEMBER(portc_r);
	DECLARE_WRITE8_MEMBER(portc_w);

	/* Extended Timer Output */
	DECLARE_WRITE_LINE_MEMBER(co0_w);
	DECLARE_WRITE_LINE_MEMBER(co1_w);

	/* ADC */
	DECLARE_READ8_MEMBER(an0_r);
	DECLARE_READ8_MEMBER(an1_r);
	DECLARE_READ8_MEMBER(an2_r);
	DECLARE_READ8_MEMBER(an3_r);
	DECLARE_READ8_MEMBER(an4_r);
	DECLARE_READ8_MEMBER(an5_r);
	DECLARE_READ8_MEMBER(an6_r);
	DECLARE_READ8_MEMBER(an7_r);

	/* fake memory I/O to get past memory reset check */
	DECLARE_READ8_MEMBER(fakemem_r);
	DECLARE_WRITE8_MEMBER(fakemem_w);

	/* GATE ARRAY */
	DECLARE_WRITE8_MEMBER(pf_stepper);
	DECLARE_WRITE8_MEMBER(cr_stepper);
	DECLARE_WRITE_LINE_MEMBER(e05a30_ready);

	/* Panel buttons */
	DECLARE_INPUT_CHANGED_MEMBER(online_sw);

protected:
	// device-level overrides
	virtual void device_start();
	virtual void device_reset();

	required_device<speaker_sound_device> m_speaker;

private:
	int m_93c06_clk;
	int m_93c06_cs;
	int m_pf_pos_abs;
	int m_pf_pos_prev;
	int m_cr_pos_abs;
	int m_cr_pos_prev;
	UINT8 m_fakemem;
};



// device type definition
extern const device_type EPSON_LX800;
extern const device_type EPSON_LX810L;
extern const device_type EPSON_AP2000;



#endif
