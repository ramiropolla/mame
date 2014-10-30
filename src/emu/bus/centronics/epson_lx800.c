// license:MAME, GPL-2.0+
// copyright-holders:Dirk Best
/**********************************************************************

   Epson LX-800 dot matrix printer

    license: MAME, GPL-2.0+
    copyright-holders: Dirk Best
                       Ramiro Polla

    Skeleton driver

    - CPU type uPD7810HG
    - CPU PORTD and PORTF are connected to the Gate Array
    - processing gets stuck in a loop, and never gets to scan the
      input buttons and switches.
    - CPU disassembly doesn't seem to indicate conditional JR or RET.


    2014-06-10 Added LX810L, gets caught in a loop almost immediately.
               IC list:
               * uPD7810HG (cpu)
               * E05A30 (gate array)
               * 2064C (8k RAM)
               * ER59256 (EEP-ROM - serial nvram)
               * SLA7020M (step motor driver)
               * uPC494C (pulse width modulation control)
               May need to be split off to another driver.

    2014-06-10 Added AP2000, gets caught in the same place as LX810L.

**********************************************************************/

#include "epson_lx800.h"
#include "lx800.lh"


//#define AP2000DEBUG
#ifdef AP2000DEBUG
#define AP2000LOG(...) fprintf(stderr, __VA_ARGS__)
#else
#define AP2000LOG(...)
#endif

//**************************************************************************
//  DEVICE DEFINITIONS
//**************************************************************************

const device_type EPSON_LX800 = &device_creator<epson_lx800_t>;
const device_type EPSON_LX810L = &device_creator<epson_lx810l_t>;
const device_type EPSON_AP2000 = &device_creator<epson_ap2000_t>;


//-------------------------------------------------
//  ROM( lx800 )
//-------------------------------------------------

ROM_START( lx800 )
	ROM_REGION(0x8000, "maincpu", 0)
	ROM_LOAD("lx800.ic3c", 0x0000, 0x8000, CRC(da06c45b) SHA1(9618c940dd10d5b43cd1edd5763b90e6447de667) )
ROM_END


//-------------------------------------------------
//  ROM( lx810l )
//-------------------------------------------------

ROM_START( lx810l )
	ROM_REGION(0x8000, "maincpu", 0)
	ROM_LOAD("lx810l.ic3c", 0x0000, 0x8000, CRC(a66454e1) SHA1(8e6f2f98abcbd8af6e34b9ba746edf0d18aef843) )
ROM_END


//-------------------------------------------------
//  ROM( ap2000 )
//-------------------------------------------------

ROM_START( ap2000 )
	ROM_REGION(0x8000, "maincpu", 0)
	ROM_LOAD("ap2k.ic3c", 0x0000, 0x8000, CRC(ee7294b7) SHA1(219ffa6ff661ce95d5772c9fc1967093718f04e9) )
	ROM_REGION(0x20, "eeprom", 0)
	ROM_LOAD( "at93c06", 0x00, 0x20, NO_DUMP )
ROM_END


//-------------------------------------------------
//  rom_region - device-specific ROM region
//-------------------------------------------------

const rom_entry *epson_lx800_t::device_rom_region() const
{
	return ROM_NAME( lx800 );
}


//-------------------------------------------------
//  rom_region - device-specific ROM region
//-------------------------------------------------

const rom_entry *epson_lx810l_t::device_rom_region() const
{
	return ROM_NAME( lx810l );
}


//-------------------------------------------------
//  rom_region - device-specific ROM region
//-------------------------------------------------

const rom_entry *epson_ap2000_t::device_rom_region() const
{
	return ROM_NAME( ap2000 );
}


/***************************************************************************
    FF READ/WRITE
***************************************************************************/

READ8_MEMBER(epson_ap2000_t::fakemem_r)
{
	return m_fakemem;
}

WRITE8_MEMBER(epson_ap2000_t::fakemem_w)
{
	m_fakemem = data;
}


//-------------------------------------------------
//  ADDRESS_MAP( lx800_mem )
//-------------------------------------------------

static ADDRESS_MAP_START( lx800_mem, AS_PROGRAM, 8, epson_lx800_t )
	AM_RANGE(0x0000, 0x7fff) AM_ROM /* 32k firmware */
	AM_RANGE(0x8000, 0x9fff) AM_RAM /* 8k external RAM */
	AM_RANGE(0xa000, 0xbfff) AM_NOP /* not used */
	AM_RANGE(0xc000, 0xdfff) AM_MIRROR(0x1ff8) AM_DEVREADWRITE("ic3b", e05a03_device, read, write)
	AM_RANGE(0xe000, 0xfeff) AM_NOP /* not used */
	AM_RANGE(0xff00, 0xffff) AM_RAM /* internal CPU RAM */
ADDRESS_MAP_END


//-------------------------------------------------
//  ADDRESS_MAP( lx800_io )
//-------------------------------------------------

static ADDRESS_MAP_START( lx800_io, AS_IO, 8, epson_lx800_t )
	AM_RANGE(UPD7810_PORTA, UPD7810_PORTA) AM_READWRITE(porta_r, porta_w)
	AM_RANGE(UPD7810_PORTB, UPD7810_PORTB) AM_READ_PORT("DIPSW1")
	AM_RANGE(UPD7810_PORTC, UPD7810_PORTC) AM_READWRITE(portc_r, portc_w)
ADDRESS_MAP_END


//-------------------------------------------------
//  ADDRESS_MAP( ap2000_mem )
//-------------------------------------------------

static ADDRESS_MAP_START( ap2000_mem, AS_PROGRAM, 8, epson_ap2000_t )
	AM_RANGE(0x0000, 0x7fff) AM_ROM /* 32k firmware */
	AM_RANGE(0x8000, 0x9fff) AM_RAM /* 8k external RAM */
	AM_RANGE(0xa000, 0xbfff) AM_READWRITE(fakemem_r, fakemem_w) /* fake memory, write one, set all */
	AM_RANGE(0xc000, 0xdfff) AM_MIRROR(0x1ff0) AM_DEVREADWRITE("ic3b", e05a30_device, read, write)
	AM_RANGE(0xe000, 0xfeff) AM_NOP /* not used */
	AM_RANGE(0xff00, 0xffff) AM_RAM /* internal CPU RAM */
ADDRESS_MAP_END


//-------------------------------------------------
//  ADDRESS_MAP( ap2000_io )
//-------------------------------------------------

static ADDRESS_MAP_START( ap2000_io, AS_IO, 8, epson_ap2000_t )
	AM_RANGE(UPD7810_PORTA, UPD7810_PORTA) AM_READWRITE(porta_r, porta_w)
	AM_RANGE(UPD7810_PORTB, UPD7810_PORTB) AM_READWRITE(portb_r, portb_w)
	AM_RANGE(UPD7810_PORTC, UPD7810_PORTC) AM_READWRITE(portc_r, portc_w)
ADDRESS_MAP_END


//-------------------------------------------------
//  MACHINE_DRIVER( epson_lx800 )
//-------------------------------------------------

static MACHINE_CONFIG_FRAGMENT( epson_lx800 )
	/* basic machine hardware */
	MCFG_CPU_ADD("maincpu", UPD7810, XTAL_14_7456MHz)
	MCFG_CPU_PROGRAM_MAP(lx800_mem)
	MCFG_CPU_IO_MAP(lx800_io)
	MCFG_UPD7810_AN0(READLINE(epson_lx800_t, an0_r))
	MCFG_UPD7810_AN1(READLINE(epson_lx800_t, an1_r))
	MCFG_UPD7810_AN2(READLINE(epson_lx800_t, an2_r))
	MCFG_UPD7810_AN3(READLINE(epson_lx800_t, an3_r))
	MCFG_UPD7810_AN4(READLINE(epson_lx800_t, an4_r))
	MCFG_UPD7810_AN5(READLINE(epson_lx800_t, an5_r))

	MCFG_DEFAULT_LAYOUT(layout_lx800)

	/* audio hardware */
	MCFG_SPEAKER_STANDARD_MONO("mono")
	MCFG_SOUND_ADD("beeper", BEEP, 0)
	MCFG_SOUND_ROUTE(ALL_OUTPUTS, "mono", 0.05)

	/* gate array */
	MCFG_DEVICE_ADD("ic3b", E05A03, 0)
	MCFG_E05A03_PE_LP_CALLBACK(WRITELINE(epson_lx800_t, paperempty_led_w))
	MCFG_E05A03_RESO_CALLBACK(WRITELINE(epson_lx800_t, reset_w))
	MCFG_E05A03_PE_CALLBACK(WRITELINE(epson_lx800_t, centronics_pe_w))
	MCFG_E05A03_DATA_CALLBACK(READ8(epson_lx800_t, centronics_data_r))
MACHINE_CONFIG_END


//-------------------------------------------------
//  machine_config_additions - device-specific
//  machine configurations
//-------------------------------------------------

machine_config_constructor epson_lx800_t::device_mconfig_additions() const
{
	return MACHINE_CONFIG_NAME( epson_lx800 );
}

//-------------------------------------------------
//  MACHINE_DRIVER( epson_ap2000 )
//-------------------------------------------------

static MACHINE_CONFIG_FRAGMENT( epson_ap2000 )
	/* basic machine hardware */
	MCFG_CPU_ADD("maincpu", UPD7810, XTAL_14_7456MHz)
	MCFG_CPU_PROGRAM_MAP(ap2000_mem)
	MCFG_CPU_IO_MAP(ap2000_io)
	MCFG_UPD7810_AN0(READ8(epson_ap2000_t, an0_r))
	MCFG_UPD7810_AN1(READ8(epson_ap2000_t, an1_r))
	MCFG_UPD7810_AN2(READ8(epson_ap2000_t, an2_r))
	MCFG_UPD7810_AN3(READ8(epson_ap2000_t, an3_r))
	MCFG_UPD7810_AN4(READ8(epson_ap2000_t, an4_r))
	MCFG_UPD7810_AN5(READ8(epson_ap2000_t, an5_r))
	MCFG_UPD7810_AN6(READ8(epson_ap2000_t, an6_r))
	MCFG_UPD7810_AN7(READ8(epson_ap2000_t, an7_r))
	MCFG_UPD7810_CO0(WRITELINE(epson_ap2000_t, co0_w))
	MCFG_UPD7810_CO1(WRITELINE(epson_ap2000_t, co1_w))

	MCFG_DEFAULT_LAYOUT(layout_lx800)

	/* audio hardware */
	MCFG_SPEAKER_STANDARD_MONO("mono")
	MCFG_SOUND_ADD("beeper", BEEP, 0)
	MCFG_SOUND_ADD("speaker", SPEAKER_SOUND, 0)
	MCFG_SOUND_ROUTE(ALL_OUTPUTS, "mono", 0.25)

	/* gate array */
	MCFG_DEVICE_ADD("ic3b", E05A30, 0)
	MCFG_E05A30_PF_STEPPER_CALLBACK(WRITE8(epson_ap2000_t, pf_stepper))
	MCFG_E05A30_CR_STEPPER_CALLBACK(WRITE8(epson_ap2000_t, cr_stepper))
	MCFG_E05A30_READY_CALLBACK(WRITELINE(epson_ap2000_t, e05a30_ready))

	/* 256-bit eeprom */
	MCFG_EEPROM_SERIAL_93C06_ADD("eeprom")
MACHINE_CONFIG_END

//-------------------------------------------------
//  machine_config_additions - device-specific
//  machine configurations
//-------------------------------------------------

machine_config_constructor epson_ap2000_t::device_mconfig_additions() const
{
	return MACHINE_CONFIG_NAME( epson_ap2000 );
}


//-------------------------------------------------
//  INPUT_PORTS( epson_lx800 )
//-------------------------------------------------

INPUT_PORTS_START( epson_lx800 )
	PORT_START("ONLINE")
	PORT_BIT(0x01, IP_ACTIVE_LOW, IPT_KEYBOARD) PORT_NAME("On Line") PORT_CODE(KEYCODE_O)

	PORT_START("FORMFEED")
	PORT_BIT(0x01, IP_ACTIVE_LOW, IPT_KEYBOARD) PORT_NAME("Form Feed") PORT_CODE(KEYCODE_F)

	PORT_START("LINEFEED")
	PORT_BIT(0x01, IP_ACTIVE_LOW, IPT_KEYBOARD) PORT_NAME("Line Feed") PORT_CODE(KEYCODE_L)

	PORT_START("DIPSW1")
	PORT_DIPNAME(0x01, 0x00, "Typeface")
	PORT_DIPLOCATION("DIP:8")
	PORT_DIPSETTING(0x01, "Condensed")
	PORT_DIPSETTING(0x00, DEF_STR(Normal))
	PORT_DIPNAME(0x02, 0x00, "ZERO font")
	PORT_DIPLOCATION("DIP:7")
	PORT_DIPSETTING(0x02, "0")
	PORT_DIPSETTING(0x00, "0")
	PORT_DIPNAME(0x04, 0x00, "Character Table")
	PORT_DIPLOCATION("DIP:6")
	PORT_DIPSETTING(0x04, "Graphic")
	PORT_DIPSETTING(0x00, "Italic")
	PORT_DIPNAME(0x08, 0x00, "Paper-out detection")
	PORT_DIPLOCATION("DIP:5")
	PORT_DIPSETTING(0x08, "Valid")
	PORT_DIPSETTING(0x00, "Invalid")
	PORT_DIPNAME(0x10, 0x00, "Printing quality")
	PORT_DIPLOCATION("DIP:4")
	PORT_DIPSETTING(0x10, "NLQ")
	PORT_DIPSETTING(0x00, "Draft")
	PORT_DIPNAME(0xe0, 0xe0, "International character set")
	PORT_DIPLOCATION("DIP:3,2,1")
	PORT_DIPSETTING(0xe0, "U.S.A.")
	PORT_DIPSETTING(0x60, "France")
	PORT_DIPSETTING(0xa0, "Germany")
	PORT_DIPSETTING(0x20, "U.K.")
	PORT_DIPSETTING(0xc0, "Denmark")
	PORT_DIPSETTING(0x40, "Sweden")
	PORT_DIPSETTING(0x80, "Italy")
	PORT_DIPSETTING(0x00, "Spain")

	PORT_START("DIPSW2")
	PORT_DIPNAME(0x01, 0x00, "Page length")
	PORT_DIPLOCATION("DIP:4")
	PORT_DIPSETTING(0x01, "12\"")
	PORT_DIPSETTING(0x00, "11\"")
	PORT_DIPNAME(0x02, 0x00, "Cut sheet feeder mode")
	PORT_DIPLOCATION("DIP:3")
	PORT_DIPSETTING(0x02, "Valid")
	PORT_DIPSETTING(0x00, "Invalid")
	PORT_DIPNAME(0x04, 0x00, "1\" skip over perforation")
	PORT_DIPLOCATION("DIP:2")
	PORT_DIPSETTING(0x04, "Valid")
	PORT_DIPSETTING(0x00, "Invalid")
	PORT_DIPNAME(0x08, 0x00, "AUTO FEED XT control")
	PORT_DIPLOCATION("DIP:1")
	PORT_DIPSETTING(0x08, "Fix to LOW")
	PORT_DIPSETTING(0x00, "Depends on external signal")
INPUT_PORTS_END


//-------------------------------------------------
//  input_ports - device-specific input ports
//-------------------------------------------------

ioport_constructor epson_lx800_t::device_input_ports() const
{
	return INPUT_PORTS_NAME( epson_lx800 );
}

/***************************************************************************
    INPUT PORTS
***************************************************************************/

static INPUT_PORTS_START( epson_ap2000 )

	/* Buttons on printer */
	PORT_START("ONLINE")
	PORT_BIT(0x01, IP_ACTIVE_LOW, IPT_KEYBOARD) PORT_NAME("On Line") PORT_CODE(KEYCODE_O) PORT_CHANGED_MEMBER(DEVICE_SELF, epson_ap2000_t, online_sw, NULL)
	PORT_START("FORMFEED")
	PORT_BIT(0x01, IP_ACTIVE_LOW, IPT_KEYBOARD) PORT_NAME("Form Feed") PORT_CODE(KEYCODE_F)
	PORT_START("LINEFEED")
	PORT_BIT(0x01, IP_ACTIVE_LOW, IPT_KEYBOARD) PORT_NAME("Line Feed") PORT_CODE(KEYCODE_L)
	PORT_START("LOAD_EJECT")
	PORT_BIT(0x01, IP_ACTIVE_LOW, IPT_KEYBOARD) PORT_NAME("Load/Eject") PORT_CODE(KEYCODE_E)

	/* DIPSW1 */
	PORT_START("DIPSW1")

	PORT_DIPNAME(0x01, 0x01, "Character spacing")
	PORT_DIPLOCATION("DIP:1")
	PORT_DIPSETTING(0x01, "12 cpi") /* default */
	PORT_DIPSETTING(0x00, "10 cpi")

	PORT_DIPNAME(0x02, 0x00, "Shape of zero")
	PORT_DIPLOCATION("DIP:2")
	PORT_DIPSETTING(0x02, "Slashed")
	PORT_DIPSETTING(0x00, "Not slashed") /* default */

	PORT_DIPNAME(0x0c, 0x08, "Page length")
	PORT_DIPLOCATION("DIP:3,4")
	PORT_DIPSETTING(0x00, "11 inches")
	PORT_DIPSETTING(0x04, "12 inches")
	PORT_DIPSETTING(0x08, "8.5 inches") /* default */
	PORT_DIPSETTING(0x0c, "11.7 inches")

	PORT_DIPNAME(0x10, 0x10, "Character table")
	PORT_DIPLOCATION("DIP:5")
	PORT_DIPSETTING(0x10, "Graphics") /* default */
	PORT_DIPSETTING(0x00, "Italics")

	PORT_DIPNAME(0xe0, 0xe0, "International characters and PC selection")
	PORT_DIPLOCATION("DIP:6,7,8")
	PORT_DIPSETTING(0xe0, "United States") /* default */
	PORT_DIPSETTING(0x60, "France")
	PORT_DIPSETTING(0xa0, "Germany")
	PORT_DIPSETTING(0x20, "United Kingdom")
	PORT_DIPSETTING(0xc0, "Denmark")
	PORT_DIPSETTING(0x40, "Sweden")
	PORT_DIPSETTING(0x80, "Italy")
	PORT_DIPSETTING(0x00, "Spain")

	/* DIPSW2 */
	PORT_START("DIPSW2")

	PORT_DIPNAME(0x01, 0x01, "Short tear-off")
	PORT_DIPLOCATION("DIP:1")
	PORT_DIPSETTING(0x01, "Invalid") /* default */
	PORT_DIPSETTING(0x00, "Valid")

	PORT_DIPNAME(0x02, 0x00, "Cut-sheet feeder mode")
	PORT_DIPLOCATION("DIP:2")
	PORT_DIPSETTING(0x02, "ON")
	PORT_DIPSETTING(0x00, "OFF") /* default */

	PORT_DIPNAME(0x04, 0x00, "Skip-over-perforation")
	PORT_DIPLOCATION("DIP:3")
	PORT_DIPSETTING(0x04, "ON")
	PORT_DIPSETTING(0x00, "OFF") /* default */

	PORT_DIPNAME(0x08, 0x00, "Auto line feed")
	PORT_DIPLOCATION("DIP:4")
	PORT_DIPSETTING(0x08, "ON")
	PORT_DIPSETTING(0x00, "OFF") /* default */

INPUT_PORTS_END


//-------------------------------------------------
//  input_ports - device-specific input ports
//-------------------------------------------------

ioport_constructor epson_ap2000_t::device_input_ports() const
{
	return INPUT_PORTS_NAME( epson_ap2000 );
}

INPUT_CHANGED_MEMBER(epson_ap2000_t::online_sw)
{
	m_maincpu->set_input_line(UPD7810_INTF2, newval ? CLEAR_LINE : ASSERT_LINE);
}


//**************************************************************************
//  LIVE DEVICE
//**************************************************************************

//-------------------------------------------------
//  epson_lx800_t - constructor
//-------------------------------------------------

epson_lx800_t::epson_lx800_t(const machine_config &mconfig, const char *tag, device_t *owner, UINT32 clock) :
	device_t(mconfig, EPSON_LX800, "Epson LX-800", tag, owner, clock, "lx800", __FILE__),
	device_centronics_peripheral_interface(mconfig, *this),
	m_maincpu(*this, "maincpu"),
	m_beep(*this, "beeper")
{
}

epson_lx800_t::epson_lx800_t(const machine_config &mconfig, device_type type, const char *name, const char *tag, device_t *owner, UINT32 clock, const char *shortname, const char *source) :
	device_t(mconfig, type, name, tag, owner, clock, shortname, __FILE__),
	device_centronics_peripheral_interface(mconfig, *this),
	m_maincpu(*this, "maincpu"),
	m_beep(*this, "beeper")
{
}

epson_lx810l_t::epson_lx810l_t(const machine_config &mconfig, const char *tag, device_t *owner, UINT32 clock)
	: epson_lx800_t(mconfig, EPSON_LX810L, "Epson LX-810L", tag, owner, clock, "lx810l", __FILE__) { }

epson_ap2000_t::epson_ap2000_t(const machine_config &mconfig, const char *tag, device_t *owner, UINT32 clock)
	: epson_lx800_t(mconfig, EPSON_AP2000, "Epson ActionPrinter 2000", tag, owner, clock, "ap2000", __FILE__),
	m_eeprom(*this, "eeprom"),
	m_speaker(*this, "speaker"),
	m_93c06_clk(0),
	m_93c06_cs(0),
	m_pf_pos_abs(200),
	m_pf_pos_prev(0),
	m_cr_pos_abs(200),
	m_cr_pos_prev(0)
{
}


//-------------------------------------------------
//  device_start - device-specific startup
//-------------------------------------------------

void epson_lx800_t::device_start()
{
}

static const stepper_interface ap2000_pf_stepper =
{
	STARPOINT_48STEP_REEL,
	16,
	24,
	0x00,
	0
};

static const stepper_interface ap2000_cr_stepper =
{
	STARPOINT_48STEP_REEL,
	16,
	24,
	0x00,
	2
};

void epson_ap2000_t::device_start()
{
	stepper_config(machine(), 0, &ap2000_pf_stepper);
	stepper_config(machine(), 1, &ap2000_cr_stepper);
}


//-------------------------------------------------
//  device_reset - device-specific reset
//-------------------------------------------------

void epson_lx800_t::device_reset()
{
	m_beep->set_state(0);
	m_beep->set_frequency(4000); /* ? */
}

void epson_ap2000_t::device_reset()
{
	m_speaker->level_w(0);
}


/***************************************************************************
    I/O PORTS
***************************************************************************/

/* PA0   W  CRCOM  carriage motor, 0 = holding voltage, 1 = drive voltage
 * PA1             not used
 * PA2   W  PFCOM  paper feed motor, 0 = holding voltage, 1 = drive voltage
 * PA3  R   LF SW  line feed switch
 * PA4  R   FF SW  form feed switch
 * PA5  R   PE SW  paper end sensor, 0 = no paper, 1 = paper
 * PA6             not used
 * PA7  R   P/S    P/S signal from the optional interface
 */
READ8_MEMBER( epson_lx800_t::porta_r )
{
	UINT8 result = 0;

	logerror("%s: lx800_porta_r(%02x)\n", machine().describe_context(), offset);

	result |= ioport("LINEFEED")->read() << 3;
	result |= ioport("FORMFEED")->read() << 4;
	result |= 1 << 5;

	result |= 1 << 7;

	return result;
}

WRITE8_MEMBER( epson_lx800_t::porta_w )
{
	logerror("%s: lx800_porta_w(%02x): %02x\n", machine().describe_context(), offset, data);
	logerror("--> carriage: %d, paper feed: %d\n", BIT(data, 0), BIT(data, 2));
}

/* PC0   W  TXD        serial i/o txd
 * PC1  R   RXD        serial i/o rxd
 * PC2   W  ONLINE LP  online led
 * PC3  R   ONLINE SW  online switch
 * PC4   W  ERR        centronics error
 * PC5   W  ACK        centronics acknowledge
 * PC6   W  FIRE       drive pulse width signal
 * PC7   W  BUZZER     buzzer signal
 */
READ8_MEMBER( epson_lx800_t::portc_r )
{
	UINT8 result = 0;

	logerror("%s: lx800_portc_r(%02x)\n", machine().describe_context(), offset);

	result |= ioport("ONLINE")->read() << 3;

	return result;
}

WRITE8_MEMBER( epson_lx800_t::portc_w )
{
	logerror("%s: lx800_portc_w(%02x): %02x\n", machine().describe_context(), offset, data);
	logerror("--> err: %d, ack: %d, fire: %d, buzzer: %d\n", BIT(data, 4), BIT(data, 5), BIT(data, 6), BIT(data, 7));

	output_set_value("online_led", !BIT(data, 2));
	m_beep->set_state(!BIT(data, 7));
}

READ_LINE_MEMBER( epson_lx800_t::an0_r )
{
	return BIT(ioport("DIPSW2")->read(), 0);
}

READ_LINE_MEMBER( epson_lx800_t::an1_r )
{
	return BIT(ioport("DIPSW2")->read(), 1);
}

READ_LINE_MEMBER( epson_lx800_t::an2_r )
{
	return BIT(ioport("DIPSW2")->read(), 2);
}

READ_LINE_MEMBER( epson_lx800_t::an3_r )
{
	return BIT(ioport("DIPSW2")->read(), 3); // can also read an external line AUTO_FEED_XT
}

READ_LINE_MEMBER( epson_lx800_t::an4_r )
{
	return 0; // Printer select line (0=always selected)
}

READ_LINE_MEMBER( epson_lx800_t::an5_r )
{
	return 1; // Monitors 24v line, should return 4.08 volts
}


/***************************************************************************
    I/O PORTS
***************************************************************************/

/*
 * PA0  R   CN7 sensor (Home Position, HP, active low)
 * PA1  R   CN6 sensor (Paper-End, PE, active low)
 * PA2  R   CN4 sensor (Release, low = tractor)
 * PA3   W  Stepper motor voltage reference (these 3 pins make up one voltage)
 * PA4   W  Stepper motor voltage reference (these 3 pins make up one voltage)
 * PA5   W  Stepper motor voltage reference (these 3 pins make up one voltage)
 * PA6  R   Line Feed SWITCH
 * PA7  R   Form Feed SWITCH
 */
READ8_MEMBER( epson_ap2000_t::porta_r )
{
	UINT8 result = 0;
	UINT8 hp_sensor = m_cr_pos_abs <= 0 ? 0 : 1;
	UINT8 pe_sensor = m_pf_pos_abs <= 0 ? 1 : 0;

	result |= hp_sensor; /* home position */
	result |= pe_sensor << 1; /* paper end */
	result |= ioport("LINEFEED")->read() << 6;
	result |= ioport("FORMFEED")->read() << 7;

	AP2000LOG("%s: ap2000_PA_r(%02x): result %02x\n", machine().describe_context(), offset, result);

	return result;
}

WRITE8_MEMBER( epson_ap2000_t::porta_w )
{
	AP2000LOG("%s: ap2000_PA_w(%02x): %02x: stepper vref %d\n", machine().describe_context(), offset, data, BIT(data, 3) | (BIT(data, 4)<<1) | (BIT(data, 5)<<2));
}

/*
 * PB0  R   DIP1.0 & 93C06.DO
 * PB1  RW  DIP1.1 & 93C06.DI
 * PB2  R   DIP1.2
 * PB3  R   DIP1.3
 * PB4  R   DIP1.4
 * PB5  R   DIP1.5
 * PB6  R   DIP1.6
 * PB7  R   DIP1.7
 */
READ8_MEMBER( epson_ap2000_t::portb_r )
{
	UINT8 result = ioport("LINEFEED")->read();

	/* if 93C06 is selected */
	if (m_93c06_cs) {
		UINT8 do_r = m_eeprom->do_read();
		result &= 0xfe;
		result |= do_r;
	}

	AP2000LOG("%s: ap2000_PB_r(%02x): result %02x\n", machine().describe_context(), offset, result);

	return result;
}

WRITE8_MEMBER( epson_ap2000_t::portb_w )
{
	UINT8 data_in = BIT(data, 1);

	/* if 93C06 is selected */
	if (m_93c06_cs)
		m_eeprom->di_write(data_in);

	AP2000LOG("%s: ap2000_PB_w(%02x): %02x: 93c06 data %d\n", machine().describe_context(), offset, data, data_in);
}

/*
 * PC0   W  TXD        serial i/o txd, also TAMA.25
 * PC1  R   RXD        serial i/o rxd, also E05A30.28
 * PC2   W  ????????  W  ONLINE LP  online led
 * PC3  R   ONLINE SW  online switch
 * PC4   W  93C06.SK
 * PC5   W  93C06.CS
 * PC6   W  E05A30.57 ???????? W  FIRE       drive pulse width signal
 * PC7   W  BUZZER     buzzer signal
 */
READ8_MEMBER( epson_ap2000_t::portc_r )
{
	UINT8 result = 0;

//	MCC   = b11001011; /* 0 = port mode; 1 = control mode; CO1 output, CO0 output, TI Input, RxD, TxD */

	/* result |= ioport("serial")->read() << 1; */
	result |= !ioport("ONLINE")->read() << 3;
	result |= m_93c06_clk << 4;
	result |= m_93c06_cs  << 5;

	AP2000LOG("%s: ap2000_PC_r(%02x): %02x\n", machine().describe_context(), offset, result);

	return result;
}

WRITE8_MEMBER( epson_ap2000_t::portc_w )
{
	/* ioport("serial")->write(BIT(data, 0)); */

	m_93c06_clk = BIT(data, 4);
	m_93c06_cs  = BIT(data, 5);

	AP2000LOG("%s: PC_w(%02x): %02x 93c06 clk: %d cs: %d\n", machine().describe_context(), offset, data, m_93c06_clk, m_93c06_cs);

	m_eeprom->clk_write(m_93c06_clk ? ASSERT_LINE : CLEAR_LINE);
	m_eeprom->cs_write (m_93c06_cs  ? ASSERT_LINE : CLEAR_LINE);

	output_set_value("online_led", !BIT(data, 2));
}


/***************************************************************************
    GATE ARRAY
***************************************************************************/

READ8_MEMBER( epson_lx800_t::centronics_data_r )
{
	logerror("centronics: data read\n");
	return 0x55;
}

WRITE_LINE_MEMBER( epson_lx800_t::centronics_pe_w )
{
	logerror("centronics: pe = %d\n", state);
}

WRITE_LINE_MEMBER( epson_lx800_t::paperempty_led_w )
{
	logerror("setting paperout led: %d\n", state);
	output_set_value("paperout_led", state);
}

WRITE_LINE_MEMBER( epson_lx800_t::reset_w )
{
	logerror("cpu reset");
	m_maincpu->reset();
}

/***************************************************************************
    GATE ARRAY
***************************************************************************/

WRITE8_MEMBER( epson_ap2000_t::pf_stepper )
{
	int prev = m_pf_pos_prev;

	stepper_update(0, data);
	int pos = stepper_get_position(0);

	AP2000LOG("%s: %s(%02x); prev %d cur %d abs %d\n", machine().describe_context(), __func__, data, prev, pos, m_pf_pos_abs);

	if      (prev == 95 && !pos) m_pf_pos_abs--;
	else if (!prev && pos == 95) m_pf_pos_abs++;
	else                         m_pf_pos_abs += prev - pos;
	m_pf_pos_prev = pos;

#if 0
	/* print pf movement to stdout */
	{
		int i;
		fprintf(stderr, "% 5d: ", m_pf_pos_abs);
		for (i = 0; i < ((m_pf_pos_abs/5) + 5); i++)
			fprintf(stderr, "y");
		for (     ; i < 149; i++)
			fprintf(stderr, "_");
		fprintf(stderr, ".\n");
	}
#endif
}

WRITE8_MEMBER( epson_ap2000_t::cr_stepper )
{
	int prev = m_cr_pos_prev;

	stepper_update(1, data);
	int pos = stepper_get_position(1);

	AP2000LOG("%s: %s(%02x); prev %d cur %d abs %d\n", machine().describe_context(), __func__, data, prev, pos, m_cr_pos_abs);

	if      (prev == 95 && !pos) m_cr_pos_abs--;
	else if (!prev && pos == 95) m_cr_pos_abs++;
	else                         m_cr_pos_abs += prev - pos;
	m_cr_pos_prev = pos;

#if 0
	/* print cr movement to stdout */
	{
		int i;
		for (i = 0; i < ((m_cr_pos_abs/5) + 5); i++)
			printf("x");
		for (     ; i < 149; i++)
			printf("_");
		printf(".\n");
	}
#endif
}

WRITE_LINE_MEMBER( epson_ap2000_t::e05a30_ready )
{
	m_maincpu->set_input_line(INPUT_LINE_NMI, PULSE_LINE);
}


/***************************************************************************
    Extended Timer Output
***************************************************************************/

WRITE_LINE_MEMBER( epson_ap2000_t::co0_w )
{
	/* FIRE */
}

WRITE_LINE_MEMBER( epson_ap2000_t::co1_w )
{
	m_speaker->level_w(state);
}


/***************************************************************************
    ADC
***************************************************************************/

READ8_MEMBER(epson_ap2000_t::an0_r)
{
	return 0xff; /* DIPSW2.1 */
}

READ8_MEMBER(epson_ap2000_t::an1_r)
{
	return 0xff; /* DIPSW2.2 */
}

READ8_MEMBER(epson_ap2000_t::an2_r)
{
	return 0xff; /* DIPSW2.3 */
}

READ8_MEMBER(epson_ap2000_t::an3_r)
{
	return 0xff; /* DIPSW2.4 */
}

READ8_MEMBER(epson_ap2000_t::an4_r)
{
	return 0xff;
}

READ8_MEMBER(epson_ap2000_t::an5_r)
{
	return 0xCB; /* motor voltage, 0xcb = 24V */
}

READ8_MEMBER(epson_ap2000_t::an6_r)
{
	return 0xff;
}

READ8_MEMBER(epson_ap2000_t::an7_r)
{
	return 0xff;
}
