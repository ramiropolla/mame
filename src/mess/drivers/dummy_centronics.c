#include "bus/centronics/ctronics.h"

#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <errno.h>

class dmcntr_state : public driver_device
{
public:
	dmcntr_state(const machine_config &mconfig, device_type type, const char *tag)
	       : driver_device(mconfig, type, tag),
	         m_centronics(*this, "centronics"),
	         m_pipe(-1),
	         m_keepalive(-1),
	         m_fp(NULL),
	         m_busy(0)
	{ }

	DECLARE_WRITE_LINE_MEMBER(write_centronics_busy)
	{
		m_busy = state;
	}

protected:
	virtual void device_reset()
	{
		const char *fname = "/dev/lp0";

		if (m_keepalive != -1)
			close(m_keepalive);
		if (m_pipe != -1)
			close(m_pipe);

		m_pipe      = open(fname, O_RDONLY | O_NONBLOCK);
		m_keepalive = open(fname, O_WRONLY | O_NONBLOCK);
		m_fp        = fdopen(m_pipe, "r");

		if (m_pipe != -1 && m_keepalive != -1 && m_fp) {
			fprintf(stderr, "pipe open\n");
			timer_set(attotime::from_msec(1000), TIMER_CHECK, 0);
		} else {
			fprintf(stderr, "ERROR: COULD NOT OPEN PIPE\n");
		}

		m_centronics->write_strobe(TRUE);
	}
	virtual void device_timer(emu_timer &timer, device_timer_id id, int param, void *ptr)
	{
		switch (id) {
		case TIMER_CHECK:
			if (!m_busy) {
				char c;
				int bytes = fread(&c, sizeof(c), 1, m_fp);
				if (bytes > 0) {
					m_centronics->write_data0(!!(c & 0x01));
					m_centronics->write_data1(!!(c & 0x02));
					m_centronics->write_data2(!!(c & 0x04));
					m_centronics->write_data3(!!(c & 0x08));
					m_centronics->write_data4(!!(c & 0x10));
					m_centronics->write_data5(!!(c & 0x20));
					m_centronics->write_data6(!!(c & 0x40));
					m_centronics->write_data7(!!(c & 0x80));
					m_centronics->write_strobe(FALSE);
					timer_set(attotime::from_usec(5), TIMER_STROBE, TRUE);
				} else {
					timer_set(attotime::from_usec(10), TIMER_CHECK, 0);
				}
			} else {
				timer_set(attotime::from_usec(10), TIMER_CHECK, 0);
			}
			break;
		case TIMER_STROBE:
			m_centronics->write_strobe(TRUE);
			timer_set(attotime::from_usec(10), TIMER_CHECK, 0);
			break;
		}
	}

	enum
	{
		TIMER_STROBE,
		TIMER_CHECK
	};

	required_device<centronics_device> m_centronics;
	int m_pipe;
	int m_keepalive;
	FILE *m_fp;
	int m_busy;
};

static MACHINE_CONFIG_START( dmcntr, dmcntr_state )
	MCFG_CENTRONICS_ADD("centronics", centronics_devices, "printer")
	MCFG_CENTRONICS_BUSY_HANDLER(WRITELINE(dmcntr_state, write_centronics_busy))
MACHINE_CONFIG_END

ROM_START( dmcntr )
ROM_END

COMP( 2014, dmcntr, 0, 0, dmcntr, 0, driver_device, 0, "Dummy Centronics", "Dummy Centronics", MACHINE_NOT_WORKING )
