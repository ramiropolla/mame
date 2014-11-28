###########################################################################
#
#   mess.mak
#
#   MESS target makefile
#
###########################################################################

ifeq ($(TARGET),mess)
# In order to keep dependencies reasonable, we exclude objects in the base of
# $(SRC)/emu, as well as all the OSD objects and anything in the $(OBJ) tree
depend: maketree $(MAKEDEP_TARGET)
	@echo Rebuilding depend_emu.mak...
	$(MAKEDEP) -I. $(INCPATH) -X$(SRC)/emu -X$(SRC)/osd/... -X$(OBJ)/... $(SRC)/emu > depend_emu.mak
	@echo Rebuilding depend_$(TARGET).mak...
	$(MAKEDEP) -I. $(INCPATH) -X$(SRC)/emu -X$(SRC)/osd/... -X$(OBJ)/... $(SRC)/$(TARGET) > depend_$(TARGET).mak
endif

# include MESS core defines
include $(SRC)/mess/messcore.mak


#-------------------------------------------------
# specify available CPU cores
#-------------------------------------------------

CPUS += Z80
CPUS += Z180
CPUS += I8085
CPUS += I8089
CPUS += M6502
CPUS += H6280
CPUS += I86
CPUS += I386
CPUS += NEC
CPUS += V30MZ
CPUS += V60
CPUS += MCS48
CPUS += MCS51
CPUS += MCS96
CPUS += M6800
CPUS += M6805
CPUS += HD6309
CPUS += M6809
CPUS += KONAMI
CPUS += M680X0
CPUS += T11
CPUS += S2650
CPUS += TMS340X0
CPUS += TMS9900
CPUS += TMS9995
CPUS += TMS9900L
CPUS += Z8000
CPUS += Z8001
CPUS += TMS32010
CPUS += TMS32025
CPUS += TMS32031
CPUS += TMS32051
CPUS += TMS32082
CPUS += TMS57002
CPUS += CCPU
CPUS += ADSP21XX
CPUS += ASAP
CPUS += AM29000
CPUS += UPD7810
CPUS += ARM
CPUS += ARM7
CPUS += JAGUAR
CPUS += CUBEQCPU
CPUS += ESRIP
CPUS += MIPS
CPUS += PSX
CPUS += SH2
CPUS += SH4
CPUS += DSP16A
CPUS += DSP32C
CPUS += PIC16C5X
CPUS += PIC16C62X
CPUS += G65816
CPUS += SPC700
CPUS += E1
CPUS += I860
CPUS += I960
CPUS += H8
CPUS += V810
CPUS += M37710
CPUS += POWERPC
CPUS += SE3208
CPUS += MC68HC11
CPUS += ADSP21062
CPUS += DSP56156
CPUS += RSP
CPUS += ALPHA8201
CPUS += COP400
CPUS += TLCS90
CPUS += TLCS900
CPUS += MB88XX
CPUS += MB86233
CPUS += MB86235
CPUS += SSP1601
CPUS += APEXC
CPUS += CP1610
CPUS += F8
CPUS += LH5801
CPUS += PDP1
CPUS += SATURN
CPUS += SC61860
CPUS += LR35902
CPUS += TMS7000
CPUS += SM8500
CPUS += MINX
CPUS += SSEM
CPUS += AVR8
CPUS += TMS0980
CPUS += I4004
CPUS += SUPERFX
CPUS += Z8
CPUS += I8008
CPUS += SCMP
CPUS += MN10200
CPUS += COSMAC
CPUS += UNSP
CPUS += HCD62121
CPUS += PPS4
CPUS += UPD7725
CPUS += HD61700
CPUS += LC8670
CPUS += SCORE
CPUS += ES5510
CPUS += SCUDSP
CPUS += IE15
CPUS += 8X300
CPUS += ALTO2
#CPUS += W65816

#-------------------------------------------------
# specify available sound cores; some of these are
# only for MAME and so aren't included
#-------------------------------------------------

#SOUNDS += SAMPLES
SOUNDS += DAC
SOUNDS += DMADAC
SOUNDS += SPEAKER
SOUNDS += BEEP
SOUNDS += DISCRETE
SOUNDS += AY8910
SOUNDS += YM2151
SOUNDS += YM2203
SOUNDS += YM2413
SOUNDS += YM2608
SOUNDS += YM2610
SOUNDS += YM2610B
SOUNDS += YM2612
#SOUNDS += YM3438
SOUNDS += YM3812
SOUNDS += YM3526
SOUNDS += Y8950
SOUNDS += YMF262
#SOUNDS += YMF271
#SOUNDS += YMF278B
#SOUNDS += YMZ280B
SOUNDS += SN76477
SOUNDS += SN76496
SOUNDS += POKEY
SOUNDS += TIA
SOUNDS += NES_APU
SOUNDS += AMIGA
SOUNDS += ASTROCADE
#SOUNDS += NAMCO
#SOUNDS += NAMCO_15XX
#SOUNDS += NAMCO_CUS30
#SOUNDS += NAMCO_52XX
#SOUNDS += NAMCO_63701X
SOUNDS += T6W28
#SOUNDS += SNKWAVE
#SOUNDS += C140
#SOUNDS += C352
#SOUNDS += TMS36XX
#SOUNDS += TMS3615
#SOUNDS += TMS5110
SOUNDS += TMS5220
SOUNDS += VLM5030
#SOUNDS += ADPCM
SOUNDS += MSM5205
#SOUNDS += MSM5232
SOUNDS += OKIM6258
SOUNDS += OKIM6295
#SOUNDS += OKIM6376
#SOUNDS += OKIM9810
SOUNDS += UPD7752
SOUNDS += UPD7759
SOUNDS += HC55516
#SOUNDS += TC8830F
#SOUNDS += K005289
#SOUNDS += K007232
SOUNDS += K051649
#SOUNDS += K053260
#SOUNDS += K054539
#SOUNDS += K056800
#SOUNDS += SEGAPCM
#SOUNDS += MULTIPCM
SOUNDS += SCSP
SOUNDS += AICA
SOUNDS += RF5C68
#SOUNDS += RF5C400
#SOUNDS += CEM3394
SOUNDS += QSOUND
#SOUNDS += QS1000
SOUNDS += SAA1099
#SOUNDS += IREMGA20
SOUNDS += ES5503
SOUNDS += ES5505
SOUNDS += ES5506
#SOUNDS += BSMT2000
#SOUNDS += GAELCO_CG1V
#SOUNDS += GAELCO_GAE1
SOUNDS += C6280
#SOUNDS += SP0250
SOUNDS += SPU
SOUNDS += CDDA
#SOUNDS += ICS2115
#SOUNDS += I5000_SND
#SOUNDS += ST0016
#SOUNDS += NILE
#SOUNDS += X1_010
#SOUNDS += VRENDER0
SOUNDS += VOTRAX
#SOUNDS += ES8712
SOUNDS += CDP1869
SOUNDS += S14001A
SOUNDS += WAVE
SOUNDS += SID6581
SOUNDS += SID8580
SOUNDS += SP0256
#SOUNDS += DIGITALKER
SOUNDS += CDP1863
SOUNDS += CDP1864
#SOUNDS += ZSG2
SOUNDS += MOS656X
SOUNDS += ASC
#SOUNDS += MAS3507D
SOUNDS += SOCRATES
SOUNDS += TMC0285
SOUNDS += TMS5200
#SOUNDS += CD2801
#SOUNDS += CD2802
#SOUNDS += M58817
#SOUNDS += TMC0281
#SOUNDS += TMS5100
#SOUNDS += TMS5110A
SOUNDS += LMC1992
SOUNDS += AWACS
#SOUNDS += YMZ770
SOUNDS += T6721A
SOUNDS += MOS7360
SOUNDS += ESQPUMP
SOUNDS += VRC6

#-------------------------------------------------
# specify available video cores
#-------------------------------------------------

VIDEOS += SEGA315_5124
VIDEOS += SEGA315_5313
#VIDEOS += BUFSPRITE
VIDEOS += CDP1861
VIDEOS += CDP1862
VIDEOS += CRT9007
VIDEOS += CRT9021
VIDEOS += CRT9212
VIDEOS += CRTC_EGA
VIDEOS += DL1416
VIDEOS += DM9368
VIDEOS += EF9340_1
VIDEOS += EF9345
VIDEOS += GF4500
#VIDEOS += EPIC12
#VIDEOS += FIXFREQ
#VIDEOS += H63484
VIDEOS += HD44102
VIDEOS += HD44352
VIDEOS += HD44780
VIDEOS += HD61830
#VIDEOS += HD63484
VIDEOS += HD66421
VIDEOS += HUC6202
VIDEOS += HUC6260
VIDEOS += HUC6261
VIDEOS += HUC6270
VIDEOS += HUC6272
VIDEOS += I8244
VIDEOS += I8275
#VIDEOS += M50458
#VIDEOS += MB90082
#VIDEOS += MB_VCU
VIDEOS += MC6845
VIDEOS += MC6847
VIDEOS += MSM6222B
VIDEOS += MSM6255
VIDEOS += MOS6566
VIDEOS += PC_VGA
#VIDEOS += POLY
VIDEOS += PSX
VIDEOS += RAMDAC
VIDEOS += S2636
VIDEOS += SAA5050
VIDEOS += SED1200
VIDEOS += SED1330
VIDEOS += SED1520
VIDEOS += SNES_PPU
VIDEOS += STVVDP
VIDEOS += T6A04
#VIDEOS += TLC34076
#VIDEOS += TMS34061
VIDEOS += TMS3556
VIDEOS += TMS9927
VIDEOS += TMS9928A
VIDEOS += UPD3301
VIDEOS += UPD7220
VIDEOS += UPD7227
VIDEOS += V9938
VIDEOS += VIC4567
#VIDEOS += VOODOO

#-------------------------------------------------
# specify available machine cores
#-------------------------------------------------

MACHINES += AKIKO
MACHINES += AUTOCONFIG
MACHINES += CR511B
MACHINES += DMAC
MACHINES += GAYLE
#MACHINES += NCR53C7XX
#MACHINES += LSI53C810
MACHINES += 6522VIA
#MACHINES += TPI6525
#MACHINES += RIOT6532
MACHINES += 6821PIA
MACHINES += 6840PTM
MACHINES += 68561MPCC
#MACHINES += ACIA6850
MACHINES += 68681
MACHINES += 7200FIFO
MACHINES += 8530SCC
#MACHINES += TTL74123
#MACHINES += TTL74145
#MACHINES += TTL74148
#MACHINES += TTL74153
#MACHINES += TTL74181
#MACHINES += TTL7474
#MACHINES += KBDC8042
#MACHINES += I8257
MACHINES += AAKARTDEV
MACHINES += ACIA6850
MACHINES += ADC0808
MACHINES += ADC083X
MACHINES += ADC1038
MACHINES += ADC1213X
MACHINES += AICARTC
MACHINES += AM53CF96
MACHINES += AM9517A
MACHINES += AMIGAFDC
MACHINES += AT_KEYBC
MACHINES += AT28C16
MACHINES += AT29040
MACHINES += AT45DBXX
MACHINES += ATAFLASH
MACHINES += AY31015
MACHINES += BANKDEV
MACHINES += CDP1852
MACHINES += CDP1871
MACHINES += CMOS40105
#MACHINES += CDU76S
MACHINES += COM8116
MACHINES += CR589
MACHINES += CS4031
MACHINES += CS8221
MACHINES += DP8390
#MACHINES += DS1204
MACHINES += DS1302
MACHINES += DS1315
MACHINES += DS2401
MACHINES += DS2404
MACHINES += DS75160A
MACHINES += DS75161A
MACHINES += E0516
MACHINES += E05A03
MACHINES += E05A30
MACHINES += EEPROMDEV
MACHINES += ER2055
MACHINES += F3853
MACHINES += HD63450
MACHINES += HD64610
MACHINES += I2CMEM
MACHINES += I80130
MACHINES += I8089
MACHINES += I8155
MACHINES += I8212
MACHINES += I8214
MACHINES += I8243
MACHINES += I8251
MACHINES += I8255
MACHINES += I8257
MACHINES += I8271
MACHINES += I8279
MACHINES += I8355
MACHINES += IDE
MACHINES += IM6402
MACHINES += INS8154
MACHINES += INS8250
MACHINES += INTELFLASH
MACHINES += JVS
MACHINES += K033906
MACHINES += K053252
MACHINES += K056230
MACHINES += KB3600
MACHINES += KBDC8042
MACHINES += KR2376
MACHINES += LATCH8
MACHINES += LC89510
MACHINES += LDPR8210
MACHINES += LDSTUB
MACHINES += LDV1000
MACHINES += LDVP931
MACHINES += LH5810
MACHINES += LINFLASH
#MACHINES += LPCI
MACHINES += LSI53C810
MACHINES += M68307
MACHINES += M68340
MACHINES += M6M80011AP
MACHINES += MATSUCD
MACHINES += MB14241
MACHINES += MB3773
MACHINES += MB8421
MACHINES += MB87078
MACHINES += MB8795
MACHINES += MB89352
MACHINES += MB89371
MACHINES += MC146818
MACHINES += MC2661
MACHINES += MC6843
MACHINES += MC6846
MACHINES += MC6852
MACHINES += MC6854
MACHINES += MC68328
MACHINES += MC68901
MACHINES += MCCS1850
#MACHINES += M68307
#MACHINES += M68340
MACHINES += MCF5206E
MACHINES += MICROTOUCH
MACHINES += MIOT6530
MACHINES += MM58167
MACHINES += MM58274C
MACHINES += MM74C922
MACHINES += MOS6526
MACHINES += MOS6529
#MACHINES += MIOT6530
MACHINES += MOS6551
MACHINES += MOS6702
MACHINES += MOS8706
MACHINES += MOS8722
MACHINES += MOS8726
MACHINES += MPU401
MACHINES += MSM5832
MACHINES += MSM58321
MACHINES += MSM6242
MACHINES += NCR5380
MACHINES += NCR5380N
MACHINES += NCR5390
MACHINES += NCR539x
MACHINES += NCR53C7XX
MACHINES += NMC9306
MACHINES += NSC810
MACHINES += NSCSI
MACHINES += OMTI5100
MACHINES += PC_FDC
MACHINES += PC_LPT
MACHINES += PCCARD
MACHINES += PCF8593
MACHINES += PCKEYBRD
MACHINES += PIC8259
MACHINES += PIT8253
MACHINES += PLA
#MACHINES += PROFILE
MACHINES += R64H156
MACHINES += RF5C296
MACHINES += RIOT6532
MACHINES += ROC10937
MACHINES += RP5C01
MACHINES += RP5C15
MACHINES += RP5H01
MACHINES += RTC4543
MACHINES += RTC65271
MACHINES += RTC9701
#MACHINES += S2636
MACHINES += S3520CF
MACHINES += S3C2400
MACHINES += S3C2410
MACHINES += S3C2440
MACHINES += S3C44B0
MACHINES += SATURN
#MACHINES += SCSI
MACHINES += SCUDSP
MACHINES += SECFLASH
MACHINES += SEIBU_COP
#MACHINES += SERFLASH
MACHINES += SMC91C9X
MACHINES += SMPC
MACHINES += STVCD
MACHINES += TC0091LVC
MACHINES += TIMEKPR
MACHINES += TMP68301
MACHINES += TMS5501
MACHINES += TMS6100
MACHINES += TMS9901
MACHINES += TMS9902
MACHINES += TPI6525
MACHINES += TTL74123
MACHINES += TTL74145
MACHINES += TTL74148
MACHINES += TTL74153
MACHINES += TTL74181
MACHINES += TTL7474
MACHINES += UPD1990A
#MACHINES += UPD4992
MACHINES += UPD4701
MACHINES += UPD7002
MACHINES += UPD71071
MACHINES += UPD765
MACHINES += V3021
MACHINES += WD_FDC
MACHINES += WD11C00_17
MACHINES += WD17XX
MACHINES += WD2010
MACHINES += WD33C93
MACHINES += WD7600
MACHINES += X2212
MACHINES += X76F041
MACHINES += X76F100
MACHINES += YM2148
MACHINES += Z80CTC
MACHINES += Z80DART
MACHINES += Z80DMA
MACHINES += Z80PIO
MACHINES += Z80STI
MACHINES += Z8536
#MACHINES += SECFLASH
#MACHINES += PCCARD
MACHINES += SMC92X4
MACHINES += HDC9234
MACHINES += TI99_HD
MACHINES += STRATA
MACHINES += STEPPERS
MACHINES += CORVUSHD
MACHINES += WOZFDC
MACHINES += DIABLO_HD

#-------------------------------------------------
# specify available bus cores
#-------------------------------------------------

BUSES += A1BUS
BUSES += A2BUS
BUSES += A7800
BUSES += A800
BUSES += ABCBUS
BUSES += ABCKB
BUSES += ADAM
BUSES += ADAMNET
BUSES += APF
BUSES += ARCADIA
BUSES += ASTROCADE
BUSES += BML3
BUSES += BW2
BUSES += C64
BUSES += CBM2
BUSES += CBMIEC
BUSES += CENTRONICS
BUSES += CHANNELF
BUSES += COCO
BUSES += COLECO
BUSES += COMPUCOLOR
BUSES += COMX35
BUSES += CPC
BUSES += CRVISION
BUSES += DMV
BUSES += ECBBUS
BUSES += ECONET
BUSES += EP64
BUSES += EPSON_SIO
BUSES += GAMEBOY
BUSES += GBA
BUSES += GENERIC
BUSES += IEEE488
BUSES += IMI7000
BUSES += INTV
BUSES += IQ151
BUSES += ISA
BUSES += ISBX
BUSES += KC
BUSES += LPCI
BUSES += MACPDS
BUSES += MIDI
BUSES += MEGADRIVE
BUSES += MSX_SLOT
BUSES += NEOGEO
BUSES += NES
BUSES += NUBUS
BUSES += O2
BUSES += ORICEXT
BUSES += PCE
BUSES += PC_JOY
BUSES += PC_KBD
BUSES += PET
BUSES += PLUS4
BUSES += PSX_CONTROLLER
BUSES += QL
BUSES += RS232
BUSES += S100
BUSES += SATURN
BUSES += SCSI
BUSES += SCV
BUSES += SEGA8
BUSES += SMS_CTRL
BUSES += SMS_EXP
BUSES += SNES
BUSES += SPC1000
BUSES += TI99PEB
BUSES += TVC
BUSES += VBOY
BUSES += VC4000
BUSES += VCS
BUSES += VCS_CTRL
BUSES += VECTREX
BUSES += VIC10
BUSES += VIC20
BUSES += VIDBRAIN
BUSES += VIP
BUSES += VTECH_IOEXP
BUSES += VTECH_MEMEXP
BUSES += WANGPC
BUSES += WSWAN
BUSES += X68K
BUSES += Z88
BUSES += ZORRO

#-------------------------------------------------
# this is the list of driver libraries that
# comprise MESS plus messdriv.o which contains
# the list of drivers
#-------------------------------------------------

DRVLIBS += \
	$(MESSOBJ)/acorn.a \
	$(MESSOBJ)/act.a \
	$(MESSOBJ)/adc.a \
	$(MESSOBJ)/alesis.a \
	$(MESSOBJ)/altos.a \
	$(MESSOBJ)/amiga.a \
	$(MESSOBJ)/amstrad.a \
	$(MESSOBJ)/apf.a \
	$(MESSOBJ)/apollo.a \
	$(MESSOBJ)/apple.a \
	$(MESSOBJ)/applied.a \
	$(MESSOBJ)/arcadia.a \
	$(MESSOBJ)/ascii.a \
	$(MESSOBJ)/at.a \
	$(MESSOBJ)/atari.a \
	$(MESSOBJ)/att.a \
	$(MESSOBJ)/bally.a \
	$(MESSOBJ)/bandai.a \
	$(MESSOBJ)/be.a \
	$(MESSOBJ)/bnpo.a \
	$(MESSOBJ)/bondwell.a \
	$(MESSOBJ)/booth.a \
	$(MESSOBJ)/camputers.a \
	$(MESSOBJ)/canon.a \
	$(MESSOBJ)/cantab.a \
	$(MESSOBJ)/casio.a \
	$(MESSOBJ)/cbm.a \
	$(MESSOBJ)/cccp.a \
	$(MESSOBJ)/cce.a \
	$(MESSOBJ)/ccs.a \
	$(MESSOBJ)/chromatics.a \
	$(MESSOBJ)/coleco.a \
	$(MESSOBJ)/cromemco.a \
	$(MESSOBJ)/comx.a \
	$(MESSOBJ)/concept.a \
	$(MESSOBJ)/conitec.a \
	$(MESSOBJ)/cybiko.a \
	$(MESSOBJ)/dai.a \
	$(MESSOBJ)/ddr.a \
	$(MESSOBJ)/dec.a \
	$(MESSOBJ)/dicksmth.a \
	$(MESSOBJ)/dms.a \
	$(MESSOBJ)/dragon.a \
	$(MESSOBJ)/drc.a \
	$(MESSOBJ)/eaca.a \
	$(MESSOBJ)/einis.a \
	$(MESSOBJ)/elektor.a \
	$(MESSOBJ)/elektrka.a \
	$(MESSOBJ)/ensoniq.a \
	$(MESSOBJ)/enterprise.a \
	$(MESSOBJ)/entex.a \
	$(MESSOBJ)/epoch.a \
	$(MESSOBJ)/epson.a \
	$(MESSOBJ)/exidy.a \
	$(MESSOBJ)/fairch.a \
	$(MESSOBJ)/fidelity.a \
	$(MESSOBJ)/fujitsu.a \
	$(MESSOBJ)/funtech.a \
	$(MESSOBJ)/galaxy.a \
	$(MESSOBJ)/gamepark.a \
	$(MESSOBJ)/grundy.a \
	$(MESSOBJ)/hartung.a \
	$(MESSOBJ)/heathkit.a \
	$(MESSOBJ)/hec2hrp.a \
	$(MESSOBJ)/hegener.a \
	$(MESSOBJ)/hitachi.a \
	$(MESSOBJ)/homebrew.a \
	$(MESSOBJ)/homelab.a \
	$(MESSOBJ)/hp.a \
	$(MESSOBJ)/imp.a \
	$(MESSOBJ)/intel.a \
	$(MESSOBJ)/interton.a \
	$(MESSOBJ)/intv.a \
	$(MESSOBJ)/isc.a \
	$(MESSOBJ)/kaypro.a \
	$(MESSOBJ)/koei.a \
	$(MESSOBJ)/kyocera.a \
	$(MESSOBJ)/luxor.a \
	$(MESSOBJ)/magnavox.a \
	$(MESSOBJ)/makerbot.a \
	$(MESSOBJ)/matsushi.a \
	$(MESSOBJ)/mattel.a \
	$(MESSOBJ)/mb.a \
	$(MESSOBJ)/mchester.a \
	$(MESSOBJ)/memotech.a \
	$(MESSOBJ)/mgu.a \
	$(MESSOBJ)/microkey.a \
	$(MESSOBJ)/mit.a \
	$(MESSOBJ)/mits.a \
	$(MESSOBJ)/mitsubishi.a \
	$(MESSOBJ)/morrow.a \
	$(MESSOBJ)/mos.a \
	$(MESSOBJ)/motorola.a \
	$(MESSOBJ)/multitch.a \
	$(MESSOBJ)/nakajima.a \
	$(MESSOBJ)/nascom.a \
	$(MESSOBJ)/ne.a \
	$(MESSOBJ)/nec.a \
	$(MESSOBJ)/netronic.a \
	$(MESSOBJ)/next.a \
	$(MESSOBJ)/nintendo.a \
	$(MESSOBJ)/nokia.a \
	$(MESSOBJ)/northstar.a \
	$(MESSOBJ)/novag.a \
	$(MESSOBJ)/olivetti.a \
	$(MESSOBJ)/omnibyte.a \
	$(MESSOBJ)/orion.a \
	$(MESSOBJ)/osborne.a \
	$(MESSOBJ)/osi.a \
	$(MESSOBJ)/palm.a \
	$(MESSOBJ)/parker.a \
	$(MESSOBJ)/pc.a \
	$(MESSOBJ)/pdp1.a \
	$(MESSOBJ)/pel.a \
	$(MESSOBJ)/philips.a \
	$(MESSOBJ)/pitronic.a \
	$(MESSOBJ)/poly88.a \
	$(MESSOBJ)/psion.a \
	$(MESSOBJ)/radio.a \
	$(MESSOBJ)/rca.a \
	$(MESSOBJ)/rm.a \
	$(MESSOBJ)/robotron.a \
	$(MESSOBJ)/rockwell.a \
	$(MESSOBJ)/roland.a \
	$(MESSOBJ)/sage.a \
	$(MESSOBJ)/samcoupe.a \
	$(MESSOBJ)/samsung.a \
	$(MESSOBJ)/sanyo.a \
	$(MESSOBJ)/sega.a \
	$(MESSOBJ)/sgi.a \
	$(MESSOBJ)/sharp.a \
	$(MESSOBJ)/siemens.a \
	$(MESSOBJ)/sinclair.a \
	$(MESSOBJ)/skeleton.a \
	$(MESSOBJ)/snk.a \
	$(MESSOBJ)/sony.a \
	$(MESSOBJ)/sord.a \
	$(MESSOBJ)/special.a \
	$(MESSOBJ)/sun.a \
	$(MESSOBJ)/svi.a \
	$(MESSOBJ)/svision.a \
	$(MESSOBJ)/swtpc09.a \
	$(MESSOBJ)/synertec.a \
	$(MESSOBJ)/ta.a \
	$(MESSOBJ)/tandberg.a \
	$(MESSOBJ)/tangerin.a \
	$(MESSOBJ)/tatung.a \
	$(MESSOBJ)/teamconc.a \
	$(MESSOBJ)/tektroni.a \
	$(MESSOBJ)/telenova.a \
	$(MESSOBJ)/telercas.a \
	$(MESSOBJ)/televideo.a \
	$(MESSOBJ)/tem.a \
	$(MESSOBJ)/tesla.a \
	$(MESSOBJ)/test.a \
	$(MESSOBJ)/thomson.a \
	$(MESSOBJ)/ti.a \
	$(MESSOBJ)/tiger.a \
	$(MESSOBJ)/tigertel.a \
	$(MESSOBJ)/tiki.a \
	$(MESSOBJ)/tomy.a \
	$(MESSOBJ)/toshiba.a \
	$(MESSOBJ)/trainer.a \
	$(MESSOBJ)/trs.a \
	$(MESSOBJ)/ultratec.a \
	$(MESSOBJ)/unisys.a \
	$(MESSOBJ)/veb.a \
	$(MESSOBJ)/vidbrain.a \
	$(MESSOBJ)/videoton.a \
	$(MESSOBJ)/visual.a \
	$(MESSOBJ)/votrax.a \
	$(MESSOBJ)/vtech.a \
	$(MESSOBJ)/wang.a \
	$(MESSOBJ)/wavemate.a \
	$(MESSOBJ)/xerox.a \
	$(MESSOBJ)/xussrpc.a \
	$(MESSOBJ)/yamaha.a \
	$(MESSOBJ)/zenith.a \
	$(MESSOBJ)/zpa.a \
	$(MESSOBJ)/zvt.a \
	$(MESSOBJ)/shared.a \
	$(MESSOBJ)/mame.a

#-------------------------------------------------
# the following files are MAME components and
# shared across a number of drivers
#
# a310.c (MESS), aristmk5.c, ertictac.c (MAME)
# amiga.c (MESS), alg.c, arcadia.c, cubo.c, mquake.c, upscope.c (MAME)
# a2600.c (MESS), tourtabl.c (MAME)
# atari400.c (MESS), bartop52.c, maxaflex.c (MAME)
# jaguar.c (MAME)
# astrocde.c (MAME+MESS), g627.c
# cps1.c (MAME + MESS), cbaseball.c, mitchell.c (MAME)
# pk8000.c (MESS), photon.c (MAME)
# nes.c (MESS), cham23.c, famibox.c, multigam.c, playch10.c, vsnes.c (MAME)
# snes.c (MESS), nss.c, sfcbox.c, snesb.c (MAME)
# n64.c (MESS), aleck64.c (MAME)
# megadriv.c, segapico.c (MESS), hshavoc.c, megadrvb.c, megaplay.c, megatech.c, puckpkmn.c, segac2.c, segas18.c (MAME)
# dccons.c (MESS), naomi.c (MAME)
# ng_aes.c (MESS), midas.c, neogeo.c, neogeo_noslot.c, neoprint.c (MAME)
# cdi.c (MESS + MAME)
# 3do.c (MESS + MAME), konamim2.c (MAME)
# vectrex.c (MESS + MAME)
# cps1.c (MESS + MAME)
#-------------------------------------------------

DRVLIBOBJS_MAME =      \
	$(MAME_MACHINE)/archimds.o  \
	$(MAME_VIDEO)/archimds.o    \
	$(MAME_MACHINE)/amiga.o     \
	$(MAME_VIDEO)/amiga.o       \
	$(MAME_VIDEO)/amigaaga.o    \
	$(MAME_VIDEO)/tia.o         \
	$(MAME_MACHINE)/atari.o     \
	$(MAME_VIDEO)/atari.o       \
	$(MAME_VIDEO)/antic.o       \
	$(MAME_VIDEO)/gtia.o        \
	$(MAME_DRIVERS)/jaguar.o    \
	$(MAME_AUDIO)/jaguar.o      \
	$(MAME_VIDEO)/jaguar.o      \
	$(MAME_VIDEO)/astrocde.o    \
	$(MAME_MACHINE)/kabuki.o    \
	$(MAME_VIDEO)/pk8000.o      \
	$(MAME_VIDEO)/ppu2c0x.o     \
	$(MAME_MACHINE)/snes.o      \
	$(MAME_AUDIO)/snes_snd.o    \
	$(MAME_MACHINE)/n64.o       \
	$(MAME_VIDEO)/n64.o         \
	$(MAME_VIDEO)/rdpblend.o    \
	$(MAME_VIDEO)/rdptpipe.o    \
	$(MAME_VIDEO)/rdpspn16.o    \
	$(MAME_MACHINE)/megadriv.o  \
	$(MAME_DRIVERS)/naomi.o     \
	$(MAME_MACHINE)/awboard.o   \
	$(MAME_MACHINE)/dc.o        \
	$(MAME_MACHINE)/dc-ctrl.o   \
	$(MAME_MACHINE)/gdrom.o     \
	$(MAME_MACHINE)/jvs13551.o  \
	$(MAME_MACHINE)/maple-dc.o  \
	$(MAME_MACHINE)/mapledev.o  \
	$(MAME_MACHINE)/mie.o       \
	$(MAME_MACHINE)/naomi.o     \
	$(MAME_MACHINE)/naomibd.o   \
	$(MAME_MACHINE)/naomig1.o   \
	$(MAME_MACHINE)/naomigd.o   \
	$(MAME_MACHINE)/naomim1.o   \
	$(MAME_MACHINE)/naomim2.o   \
	$(MAME_MACHINE)/naomim4.o   \
	$(MAME_MACHINE)/naomirom.o  \
	$(MAME_MACHINE)/315-5881_crypt.o  \
	$(MAME_VIDEO)/powervr2.o    \
	$(MAME_DRIVERS)/neogeo.o    \
	$(MAME_MACHINE)/neoboot.o   \
	$(MAME_MACHINE)/neocrypt.o  \
	$(MAME_MACHINE)/neoprot.o   \
	$(MAME_MACHINE)/ng_memcard.o\
	$(MAME_VIDEO)/neogeo.o      \
	$(MAME_VIDEO)/neogeo_spr.o  \
	$(MAME_DRIVERS)/cdi.o       \
	$(MAME_MACHINE)/cdi070.o    \
	$(MAME_MACHINE)/cdicdic.o   \
	$(MAME_MACHINE)/cdislave.o  \
	$(MAME_VIDEO)/mcd212.o      \
	$(MAME_DRIVERS)/3do.o       \
	$(MAME_MACHINE)/3do.o       \
	$(MAME_DRIVERS)/konamim2.o  \
	$(MAME_DRIVERS)/vectrex.o   \
	$(MAME_MACHINE)/vectrex.o   \
	$(MAME_VIDEO)/vectrex.o     \
	$(MAME_DRIVERS)/cps1.o      \
	$(MAME_VIDEO)/cps1.o        \


#-------------------------------------------------
# the following files are general components and
# shared across a number of drivers
#-------------------------------------------------

DRVLIBOBJS_SHARED =      \
	$(MESS_AUDIO)/mea8000.o     \
	$(MESS_MACHINE)/appldriv.o  \
	$(MESS_MACHINE)/applefdc.o  \
	$(MESS_MACHINE)/microdrv.o  \
	$(MESS_MACHINE)/smartmed.o  \
	$(MESS_MACHINE)/sonydriv.o  \
	$(MESS_MACHINE)/teleprinter.o \
	$(MESS_MACHINE)/z80bin.o    \

#-------------------------------------------------
# manufacturer-specific groupings for drivers
#-------------------------------------------------

DRVLIBOBJS_ACORN =                  \
	$(MESS_DRIVERS)/a310.o      \
	$(MESS_DRIVERS)/a6809.o     \
	$(MESS_DRIVERS)/acrnsys1.o  \
	$(MESS_DRIVERS)/atom.o      \
	$(MESS_DRIVERS)/bbc.o $(MESS_MACHINE)/bbc.o $(MESS_VIDEO)/bbc.o \
	$(MESS_DRIVERS)/bbcbc.o     \
	$(MESS_DRIVERS)/electron.o $(MESS_MACHINE)/electron.o $(MESS_VIDEO)/electron.o \
	$(MESS_DRIVERS)/riscpc.o    \
	$(MESS_DRIVERS)/z88.o $(MESS_MACHINE)/upd65031.o $(MESS_VIDEO)/z88.o \

DRVLIBOBJS_ACT =                    \
	$(MESS_DRIVERS)/apricot.o   \
	$(MESS_DRIVERS)/apricotf.o  \
	$(MESS_DRIVERS)/apricotp.o  \
	$(MESS_MACHINE)/apricotkb.o \
	$(MESS_DRIVERS)/victor9k.o $(MESS_MACHINE)/victor9kb.o $(MESS_MACHINE)/victor9k_fdc.o \

DRVLIBOBJS_ADC =                    \
	$(MESS_DRIVERS)/super6.o    \
	$(MESS_DRIVERS)/superslave.o\

DRVLIBOBJS_ALESIS =                 \
	$(MESS_DRIVERS)/alesis.o $(MESS_AUDIO)/alesis.o $(MESS_VIDEO)/alesis.o \

DRVLIBOBJS_ALTOS =                  \
	$(MESS_DRIVERS)/altos5.o    \

DRVLIBOBJS_AMIGA =                  \
	$(MESS_DRIVERS)/amiga.o $(MESS_MACHINE)/amigakbd.o \

DRVLIBOBJS_AMSTRAD =                \
	$(MESS_DRIVERS)/amstrad.o $(MESS_MACHINE)/amstrad.o \
	$(MESS_DRIVERS)/amstr_pc.o  \
	$(MESS_DRIVERS)/nc.o $(MESS_MACHINE)/nc.o $(MESS_VIDEO)/nc.o \
	$(MESS_DRIVERS)/pc1512.o $(MESS_MACHINE)/pc1512kb.o $(MESS_VIDEO)/pc1512.o \
	$(MESS_DRIVERS)/pcw.o $(MESS_VIDEO)/pcw.o \
	$(MESS_DRIVERS)/pcw16.o $(MESS_VIDEO)/pcw16.o \
	$(MESS_DRIVERS)/pda600.o    \

DRVLIBOBJS_APF =                    \
	$(MESS_DRIVERS)/apf.o       \

DRVLIBOBJS_APOLLO =                 \
	$(MESS_DRIVERS)/apollo.o $(MESS_MACHINE)/apollo.o $(MESS_MACHINE)/apollo_dbg.o $(MESS_MACHINE)/apollo_kbd.o $(MESS_VIDEO)/apollo.o \

DRVLIBOBJS_APPLE =                  \
	$(MESS_DRIVERS)/apple1.o $(MESS_MACHINE)/apple1.o $(MESS_VIDEO)/apple1.o \
	$(MESS_DRIVERS)/apple2.o $(MESS_DRIVERS)/apple2e.o $(MESS_MACHINE)/apple2.o $(MESS_VIDEO)/apple2.o \
	$(MESS_DRIVERS)/tk2000.o \
	$(MESS_DRIVERS)/apple2gs.o $(MESS_MACHINE)/apple2gs.o $(MESS_VIDEO)/apple2gs.o \
	$(MESS_DRIVERS)/apple3.o $(MESS_MACHINE)/apple3.o $(MESS_VIDEO)/apple3.o \
	$(MESS_DRIVERS)/lisa.o $(MESS_MACHINE)/lisa.o \
	$(MESS_DRIVERS)/mac.o $(MESS_AUDIO)/mac.o $(MESS_MACHINE)/egret.o $(MESS_MACHINE)/mac.o $(MESS_MACHINE)/macadb.o $(MESS_MACHINE)/macrtc.o $(MESS_MACHINE)/mackbd.o $(MESS_MACHINE)/swim.o $(MESS_VIDEO)/mac.o \
	$(MESS_DRIVERS)/macpci.o $(MESS_MACHINE)/macpci.o \
	$(MESS_MACHINE)/cuda.o      \

DRVLIBOBJS_APPLIED =                \
	$(MESS_DRIVERS)/mbee.o $(MESS_MACHINE)/mbee.o $(MESS_VIDEO)/mbee.o \

DRVLIBOBJS_ARCADIA =                \
	$(MESS_DRIVERS)/arcadia.o $(MESS_AUDIO)/arcadia.o $(MESS_VIDEO)/arcadia.o \

DRVLIBOBJS_ASCII =                  \
	$(MESS_DRIVERS)/msx.o $(MESS_MACHINE)/msx.o $(MESS_MACHINE)/msx_matsushita.o $(MESS_MACHINE)/msx_s1985.o $(MESS_MACHINE)/msx_switched.o $(MESS_MACHINE)/msx_systemflags.o \

DRVLIBOBJS_AT =                     \
	$(MESS_DRIVERS)/at.o $(MESS_MACHINE)/at.o \
	$(MESS_DRIVERS)/ct486.o     \

DRVLIBOBJS_ATARI =                  \
	$(MESS_DRIVERS)/a2600.o     \
	$(MESS_DRIVERS)/a7800.o $(MESS_VIDEO)/maria.o \
	$(MESS_DRIVERS)/atari400.o $(MESS_MACHINE)/atarifdc.o \
	$(MESS_DRIVERS)/atarist.o $(MESS_VIDEO)/atarist.o \
	$(MESS_DRIVERS)/lynx.o $(MESS_AUDIO)/lynx.o $(MESS_MACHINE)/lynx.o \
	$(MESS_DRIVERS)/portfoli.o  \

DRVLIBOBJS_ATT =                    \
	$(MESS_DRIVERS)/unixpc.o    \

DRVLIBOBJS_BALLY =                  \
	$(MESS_DRIVERS)/astrocde.o  \

DRVLIBOBJS_BANDAI =                 \
	$(MESS_DRIVERS)/sv8000.o    \
	$(MESS_DRIVERS)/rx78.o      \
	$(MESS_DRIVERS)/wswan.o $(MESS_AUDIO)/wswan_snd.o $(MESS_MACHINE)/wswan.o $(MESS_VIDEO)/wswan_video.o \

DRVLIBOBJS_BE =                     \
	$(MESS_DRIVERS)/bebox.o $(MESS_MACHINE)/bebox.o \

DRVLIBOBJS_BNPO =                   \
	$(MESS_DRIVERS)/b2m.o $(MESS_MACHINE)/b2m.o $(MESS_VIDEO)/b2m.o \

DRVLIBOBJS_BONDWELL =               \
	$(MESS_DRIVERS)/bw12.o      \
	$(MESS_DRIVERS)/bw2.o       \

DRVLIBOBJS_BOOTH =                  \
	$(MESS_DRIVERS)/apexc.o     \

DRVLIBOBJS_CAMPUTERS =              \
	$(MESS_DRIVERS)/camplynx.o  \

DRVLIBOBJS_CANON =                  \
	$(MESS_DRIVERS)/cat.o       \
	$(MESS_DRIVERS)/x07.o       \

DRVLIBOBJS_CANTAB =                 \
	$(MESS_DRIVERS)/ace.o       \

DRVLIBOBJS_CASIO =                  \
	$(MESS_DRIVERS)/casloopy.o  \
	$(MESS_DRIVERS)/cfx9850.o   \
	$(MESS_DRIVERS)/fp200.o     \
	$(MESS_DRIVERS)/fp1100.o    \
	$(MESS_DRIVERS)/fp6000.o    \
	$(MESS_DRIVERS)/pb1000.o    \
	$(MESS_DRIVERS)/pv1000.o    \
	$(MESS_DRIVERS)/pv2000.o    \

DRVLIBOBJS_CBM =                    \
	$(MESS_DRIVERS)/c128.o      \
	$(MESS_DRIVERS)/c64.o       \
	$(MESS_DRIVERS)/c64dtv.o    \
	$(MESS_DRIVERS)/c65.o $(MESS_MACHINE)/c65.o \
	$(MESS_DRIVERS)/c900.o      \
	$(MESS_DRIVERS)/cbm2.o      \
	$(MESS_DRIVERS)/clcd.o      \
	$(MESS_DRIVERS)/pet.o       \
	$(MESS_DRIVERS)/plus4.o     \
	$(MESS_DRIVERS)/vic10.o     \
	$(MESS_DRIVERS)/vic20.o     \
	$(MESS_MACHINE)/cbm_snqk.o  \

DRVLIBOBJS_CCCP =                   \
	$(MESS_DRIVERS)/argo.o      \
	$(MESS_DRIVERS)/cm1800.o    \
	$(MESS_DRIVERS)/lviv.o $(MESS_MACHINE)/lviv.o $(MESS_VIDEO)/lviv.o \
	$(MESS_DRIVERS)/mikro80.o $(MESS_MACHINE)/mikro80.o $(MESS_VIDEO)/mikro80.o \
	$(MESS_DRIVERS)/pk8000.o    \
	$(MESS_DRIVERS)/pk8020.o $(MESS_MACHINE)/pk8020.o $(MESS_VIDEO)/pk8020.o \
	$(MESS_DRIVERS)/pyl601.o    \
	$(MESS_DRIVERS)/sm1800.o    \
	$(MESS_DRIVERS)/uknc.o      \
	$(MESS_DRIVERS)/unior.o     \
	$(MESS_DRIVERS)/ut88.o $(MESS_MACHINE)/ut88.o $(MESS_VIDEO)/ut88.o \
	$(MESS_DRIVERS)/vector06.o $(MESS_MACHINE)/vector06.o $(MESS_VIDEO)/vector06.o \
	$(MESS_DRIVERS)/vta2000.o   \

DRVLIBOBJS_CCE =                    \
	$(MESS_DRIVERS)/mc1000.o    \

DRVLIBOBJS_CCS =                    \
	$(MESS_DRIVERS)/ccs2810.o   \
	$(MESS_DRIVERS)/ccs300.o    \

DRVLIBOBJS_CHROMATICS =             \
	$(MESS_DRIVERS)/cgc7900.o $(MESS_VIDEO)/cgc7900.o \

DRVLIBOBJS_COLECO =                 \
	$(MESS_DRIVERS)/adam.o      \
	$(MESS_DRIVERS)/coleco.o    \
	$(MESS_MACHINE)/coleco.o    \

DRVLIBOBJS_CROMEMCO =               \
	$(MESS_DRIVERS)/c10.o       \
	$(MESS_DRIVERS)/mcb216.o    \

DRVLIBOBJS_COMX =                   \
	$(MESS_DRIVERS)/comx35.o $(MESS_VIDEO)/comx35.o \

DRVLIBOBJS_CONCEPT =                \
	$(MESS_DRIVERS)/concept.o $(MESS_MACHINE)/concept.o \

DRVLIBOBJS_CONITEC =                \
	$(MESS_DRIVERS)/prof180x.o  \
	$(MESS_DRIVERS)/prof80.o $(MESS_MACHINE)/prof80mmu.o \

DRVLIBOBJS_CYBIKO =                 \
	$(MESS_DRIVERS)/cybiko.o $(MESS_MACHINE)/cybiko.o \

DRVLIBOBJS_DAI =                    \
	$(MESS_DRIVERS)/dai.o $(MESS_AUDIO)/dai_snd.o $(MESS_MACHINE)/dai.o $(MESS_VIDEO)/dai.o \

DRVLIBOBJS_DDR =                    \
	$(MESS_DRIVERS)/ac1.o $(MESS_MACHINE)/ac1.o $(MESS_VIDEO)/ac1.o \
	$(MESS_DRIVERS)/bcs3.o      \
	$(MESS_DRIVERS)/c80.o       \
	$(MESS_DRIVERS)/huebler.o   \
	$(MESS_DRIVERS)/jtc.o       \
	$(MESS_DRIVERS)/kramermc.o $(MESS_MACHINE)/kramermc.o $(MESS_VIDEO)/kramermc.o \
	$(MESS_DRIVERS)/llc.o $(MESS_MACHINE)/llc.o $(MESS_VIDEO)/llc.o \
	$(MESS_DRIVERS)/nanos.o     \
	$(MESS_DRIVERS)/pcm.o       \
	$(MESS_DRIVERS)/vcs80.o     \
	$(MESS_MACHINE)/k7659kb.o   \

DRVLIBOBJS_DEC =                    \
	$(MESS_DRIVERS)/dct11em.o   \
	$(MESS_DRIVERS)/dectalk.o   \
	$(MESS_DRIVERS)/pdp11.o     \
	$(MESS_DRIVERS)/vax11.o     \
	$(MESS_DRIVERS)/rainbow.o   \
	$(MESS_DRIVERS)/vk100.o     \
	$(MESS_DRIVERS)/vt100.o     \
	$(MESS_DRIVERS)/vt220.o     \
	$(MESS_DRIVERS)/vt240.o     \
	$(MESS_DRIVERS)/vt320.o     \
	$(MESS_DRIVERS)/vt520.o     \
	$(MESS_MACHINE)/dec_lk201.o \
	$(MESS_MACHINE)/rx01.o      \
	$(MESS_VIDEO)/vtvideo.o     \

DRVLIBOBJS_DICKSMTH =               \
	$(MESS_DRIVERS)/super80.o $(MESS_MACHINE)/super80.o $(MESS_VIDEO)/super80.o \

DRVLIBOBJS_DMS =                    \
	$(MESS_DRIVERS)/dms5000.o   \
	$(MESS_DRIVERS)/dms86.o     \
	$(MESS_DRIVERS)/zsbc3.o     \

DRVLIBOBJS_DRAGON =                 \
	$(MESS_DRIVERS)/dgn_beta.o $(MESS_MACHINE)/dgn_beta.o $(MESS_VIDEO)/dgn_beta.o \

DRVLIBOBJS_DRC =                    \
	$(MESS_DRIVERS)/zrt80.o     \

DRVLIBOBJS_EACA =                   \
	$(MESS_DRIVERS)/cgenie.o $(MESS_MACHINE)/cgenie.o $(MESS_VIDEO)/cgenie.o \

DRVLIBOBJS_EINIS =                  \
	$(MESS_DRIVERS)/pecom.o $(MESS_MACHINE)/pecom.o $(MESS_VIDEO)/pecom.o \

DRVLIBOBJS_ELEKTRKA =               \
	$(MESS_DRIVERS)/bk.o $(MESS_MACHINE)/bk.o $(MESS_VIDEO)/bk.o \
	$(MESS_DRIVERS)/dvk_ksm.o $(MESS_MACHINE)/ms7004.o \
	$(MESS_DRIVERS)/mk85.o      \
	$(MESS_DRIVERS)/mk90.o      \

DRVLIBOBJS_ELEKTOR =                \
	$(MESS_DRIVERS)/ec65.o      \
	$(MESS_DRIVERS)/elekscmp.o  \
	$(MESS_DRIVERS)/junior.o    \

DRVLIBOBJS_ENSONIQ =                \
	$(MESS_DRIVERS)/esq1.o      \
	$(MESS_DRIVERS)/esq5505.o   \
	$(MESS_DRIVERS)/esqasr.o    \
	$(MESS_DRIVERS)/esqkt.o     \
	$(MESS_DRIVERS)/esqmr.o     \
	$(MESS_DRIVERS)/mirage.o    \
	$(MESS_MACHINE)/esqpanel.o  \
	$(MESS_MACHINE)/esqvfd.o    \

DRVLIBOBJS_ENTERPRISE =             \
	$(MESS_DRIVERS)/ep64.o $(MESS_AUDIO)/dave.o $(MESS_VIDEO)/nick.o \

DRVLIBOBJS_ENTEX =                  \
	$(MESS_DRIVERS)/advision.o $(MESS_MACHINE)/advision.o $(MESS_VIDEO)/advision.o \

DRVLIBOBJS_EPOCH =                  \
	$(MESS_DRIVERS)/gamepock.o $(MESS_MACHINE)/gamepock.o \
	$(MESS_DRIVERS)/scv.o $(MESS_AUDIO)/upd1771.o \

DRVLIBOBJS_EPSON =                  \
	$(MESS_DRIVERS)/hx20.o      \
	$(MESS_DRIVERS)/px4.o       \
	$(MESS_DRIVERS)/px8.o       \
	$(MESS_DRIVERS)/qx10.o $(MESS_MACHINE)/qx10kbd.o \

DRVLIBOBJS_EXIDY =                  \
	$(MESS_MACHINE)/sorcerer.o $(MESS_DRIVERS)/sorcerer.o \
	$(MESS_MACHINE)/micropolis.o\

DRVLIBOBJS_FAIRCH =                 \
	$(MESS_DRIVERS)/channelf.o $(MESS_AUDIO)/channelf.o $(MESS_VIDEO)/channelf.o \

DRVLIBOBJS_FIDELITY =               \
	$(MESS_DRIVERS)/csc.o       \
	$(MESS_DRIVERS)/fidelz80.o  \

DRVLIBOBJS_FUJITSU =                \
	$(MESS_DRIVERS)/fmtowns.o $(MESS_VIDEO)/fmtowns.o $(MESS_MACHINE)/fm_scsi.o \
	$(MESS_DRIVERS)/fm7.o $(MESS_VIDEO)/fm7.o \

DRVLIBOBJS_FUNTECH =                \
	$(MESS_DRIVERS)/supracan.o  \

DRVLIBOBJS_GALAXY =                 \
	$(MESS_DRIVERS)/galaxy.o $(MESS_MACHINE)/galaxy.o $(MESS_VIDEO)/galaxy.o \

DRVLIBOBJS_GAMEPARK =               \
	$(MESS_DRIVERS)/gp2x.o      \
	$(MESS_DRIVERS)/gp32.o      \

DRVLIBOBJS_GRUNDY =                 \
	$(MESS_DRIVERS)/newbrain.o $(MESS_VIDEO)/newbrain.o \

DRVLIBOBJS_HARTUNG =                \
	$(MESS_DRIVERS)/gmaster.o   \

DRVLIBOBJS_HEATHKIT =               \
	$(MESS_DRIVERS)/et3400.o    \
	$(MESS_DRIVERS)/h8.o        \
	$(MESS_DRIVERS)/h19.o       \
	$(MESS_DRIVERS)/h89.o       \

DRVLIBOBJS_HEGENER =                \
	$(MESS_DRIVERS)/glasgow.o   \
	$(MESS_DRIVERS)/mephisto.o  \
	$(MESS_DRIVERS)/mmodular.o  \
	$(MESS_DRIVERS)/stratos.o   \
	$(MESS_MACHINE)/mboard.o    \

DRVLIBOBJS_HITACHI =                \
	$(MESS_DRIVERS)/b16.o       \
	$(MESS_DRIVERS)/bmjr.o      \
	$(MESS_DRIVERS)/bml3.o      \

DRVLIBOBJS_HOMEBREW =               \
	$(MESS_DRIVERS)/4004clk.o   \
	$(MESS_DRIVERS)/68ksbc.o    \
	$(MESS_DRIVERS)/craft.o     \
	$(MESS_DRIVERS)/homez80.o   \
	$(MESS_DRIVERS)/p112.o      \
	$(MESS_DRIVERS)/phunsy.o    \
	$(MESS_DRIVERS)/pimps.o     \
	$(MESS_DRIVERS)/ravens.o    \
	$(MESS_DRIVERS)/sbc6510.o   \
	$(MESS_DRIVERS)/sitcom.o    \
	$(MESS_DRIVERS)/slc1.o      \
	$(MESS_DRIVERS)/uzebox.o    \
	$(MESS_DRIVERS)/z80dev.o    \

DRVLIBOBJS_HOMELAB =                \
	$(MESS_DRIVERS)/homelab.o   \

DRVLIBOBJS_HP =                     \
	$(MESS_DRIVERS)/hp16500.o   \
	$(MESS_DRIVERS)/hp48.o      \
	$(MESS_MACHINE)/hp48.o      \
	$(MESS_VIDEO)/hp48.o        \
	$(MESS_DRIVERS)/hp49gp.o    \
	$(MESS_DRIVERS)/hp9845.o    \
	$(MESS_DRIVERS)/hp9k.o      \

DRVLIBOBJS_HEC2HRP =                \
	$(MESS_DRIVERS)/hec2hrp.o   \
	$(MESS_MACHINE)/hec2hrp.o   \
	$(MESS_MACHINE)/hecdisk2.o  \
	$(MESS_VIDEO)/hec2video.o   \
	$(MESS_DRIVERS)/interact.o  \

DRVLIBOBJS_INTEL =                  \
	$(MESS_DRIVERS)/basic52.o   \
	$(MESS_DRIVERS)/imds.o      \
	$(MESS_DRIVERS)/ipc.o       \
	$(MESS_DRIVERS)/ipds.o      \
	$(MESS_DRIVERS)/isbc.o $(MESS_MACHINE)/isbc_215g.o \
	$(MESS_DRIVERS)/rex6000.o   \
	$(MESS_DRIVERS)/sdk85.o     \
	$(MESS_DRIVERS)/sdk86.o     \

DRVLIBOBJS_IMP =                    \
	$(MESS_DRIVERS)/tim011.o    \
	$(MESS_DRIVERS)/tim100.o    \

DRVLIBOBJS_INTERTON =               \
	$(MESS_DRIVERS)/vc4000.o $(MESS_AUDIO)/vc4000snd.o $(MESS_VIDEO)/vc4000.o \

DRVLIBOBJS_INTV =                   \
	$(MESS_DRIVERS)/intv.o $(MESS_MACHINE)/intv.o $(MESS_VIDEO)/intv.o $(MESS_VIDEO)/stic.o \

DRVLIBOBJS_ISC =                    \
	$(MESS_DRIVERS)/compucolor.o\

DRVLIBOBJS_KAYPRO =                 \
	$(MESS_DRIVERS)/kaypro.o $(MESS_MACHINE)/kaypro.o $(MESS_MACHINE)/kay_kbd.o $(MESS_VIDEO)/kaypro.o \

DRVLIBOBJS_KOEI =                   \
	$(MESS_DRIVERS)/pasogo.o    \

DRVLIBOBJS_KYOCERA =                \
	$(MESS_DRIVERS)/kyocera.o $(MESS_VIDEO)/kyocera.o \

DRVLIBOBJS_LUXOR =                  \
	$(MESS_DRIVERS)/abc80.o $(MESS_MACHINE)/abc80kb.o $(MESS_VIDEO)/abc80.o \
	$(MESS_DRIVERS)/abc80x.o $(MESS_VIDEO)/abc800.o $(MESS_VIDEO)/abc802.o $(MESS_VIDEO)/abc806.o \
	$(MESS_DRIVERS)/abc1600.o $(MESS_MACHINE)/abc1600mac.o $(MESS_VIDEO)/abc1600.o \

DRVLIBOBJS_MAGNAVOX =               \
	$(MESS_DRIVERS)/odyssey2.o  \

DRVLIBOBJS_MAKERBOT =               \
	$(MESS_DRIVERS)/replicator.o\

DRVLIBOBJS_MATTEL =                 \
	$(MESS_DRIVERS)/aquarius.o $(MESS_VIDEO)/aquarius.o \
	$(MESS_DRIVERS)/juicebox.o  \
	$(MESS_DRIVERS)/hyperscan.o \

DRVLIBOBJS_MATSUSHI =               \
	$(MESS_DRIVERS)/jr100.o     \
	$(MESS_DRIVERS)/jr200.o     \
	$(MESS_DRIVERS)/myb3k.o     \

DRVLIBOBJS_MB =                     \
	$(MESS_DRIVERS)/comp4.o     \
	$(MESS_DRIVERS)/microvsn.o  \
	$(MESS_DRIVERS)/simon.o     \

DRVLIBOBJS_MCHESTER =               \
	$(MESS_DRIVERS)/ssem.o      \

DRVLIBOBJS_MEMOTECH =               \
	$(MESS_DRIVERS)/mtx.o $(MESS_MACHINE)/mtx.o \

DRVLIBOBJS_MGU =                    \
	$(MESS_DRIVERS)/irisha.o    \

DRVLIBOBJS_MICROKEY =               \
	$(MESS_DRIVERS)/primo.o $(MESS_MACHINE)/primo.o $(MESS_VIDEO)/primo.o \

DRVLIBOBJS_MIT =                    \
	$(MESS_DRIVERS)/tx0.o $(MESS_VIDEO)/crt.o $(MESS_VIDEO)/tx0.o \

DRVLIBOBJS_MITS =                   \
	$(MESS_DRIVERS)/altair.o    \
	$(MESS_DRIVERS)/mits680b.o  \

DRVLIBOBJS_MITSUBISHI =             \
	$(MESS_DRIVERS)/multi8.o    \
	$(MESS_DRIVERS)/multi16.o   \

DRVLIBOBJS_MORROW =                 \
	$(MESS_DRIVERS)/microdec.o  \
	$(MESS_DRIVERS)/mpz80.o     \
	$(MESS_DRIVERS)/tricep.o    \

DRVLIBOBJS_MOS =                    \
	$(MESS_DRIVERS)/kim1.o      \

DRVLIBOBJS_MOTOROLA =               \
	$(MESS_DRIVERS)/m6805evs.o  \
	$(MESS_DRIVERS)/mekd2.o     \

DRVLIBOBJS_MULTITCH =               \
	$(MESS_DRIVERS)/mkit09.o    \
	$(MESS_DRIVERS)/mpf1.o      \

DRVLIBOBJS_NAKAJIMA =               \
	$(MESS_DRIVERS)/nakajies.o  \

DRVLIBOBJS_NASCOM =                 \
	$(MESS_DRIVERS)/nascom1.o $(MESS_MACHINE)/nascom1.o $(MESS_VIDEO)/nascom1.o \

DRVLIBOBJS_NE =                     \
	$(MESS_DRIVERS)/z80ne.o $(MESS_MACHINE)/z80ne.o \

DRVLIBOBJS_NEC =                    \
	$(MESS_DRIVERS)/apc.o       \
	$(MESS_DRIVERS)/pce.o $(MESS_MACHINE)/pce.o $(MESS_MACHINE)/pce_cd.o \
	$(MESS_DRIVERS)/pcfx.o      \
	$(MESS_DRIVERS)/pc6001.o    \
	$(MESS_DRIVERS)/pc8401a.o $(MESS_VIDEO)/pc8401a.o $(MESS_DRIVERS)/pc8001.o \
	$(MESS_DRIVERS)/pc8801.o    \
	$(MESS_DRIVERS)/pc88va.o    \
	$(MESS_DRIVERS)/pc100.o     \
	$(MESS_DRIVERS)/pc9801.o $(MESS_MACHINE)/pc9801_26.o $(MESS_MACHINE)/pc9801_86.o $(MESS_MACHINE)/pc9801_118.o $(MESS_MACHINE)/pc9801_cbus.o $(MESS_MACHINE)/pc9801_kbd.o \
	$(MESS_DRIVERS)/tk80bs.o    \

DRVLIBOBJS_NETRONIC =               \
	$(MESS_DRIVERS)/elf.o       \
	$(MESS_DRIVERS)/exp85.o     \

DRVLIBOBJS_NEXT =                   \
	$(MESS_DRIVERS)/next.o $(MESS_MACHINE)/nextkbd.o $(MESS_MACHINE)/nextmo.o \

DRVLIBOBJS_NINTENDO =               \
	$(MESS_DRIVERS)/gb.o $(MESS_AUDIO)/gb.o $(MESS_MACHINE)/gb.o $(MESS_VIDEO)/gb_lcd.o \
	$(MESS_DRIVERS)/gba.o $(MESS_VIDEO)/gba.o \
	$(MESS_DRIVERS)/n64.o       \
	$(MESS_DRIVERS)/nes.o $(MESS_MACHINE)/nes.o $(MESS_VIDEO)/nes.o \
	$(MESS_DRIVERS)/pokemini.o  \
	$(MESS_DRIVERS)/snes.o $(MESS_MACHINE)/snescx4.o \
	$(MESS_DRIVERS)/vboy.o $(MESS_AUDIO)/vboy.o \

DRVLIBOBJS_NOKIA =                  \
	$(MESS_DRIVERS)/mikromik.o $(MESS_MACHINE)/mm1kb.o $(MESS_VIDEO)/mikromik.o \

DRVLIBOBJS_NORTHSTAR =              \
	$(MESS_DRIVERS)/horizon.o   \

DRVLIBOBJS_NOVAG =                  \
	$(MESS_DRIVERS)/mk1.o       \
	$(MESS_DRIVERS)/mk2.o       \
	$(MESS_DRIVERS)/ssystem3.o $(MESS_VIDEO)/ssystem3.o \
	$(MESS_DRIVERS)/supercon.o  \

DRVLIBOBJS_OLIVETTI =               \
	$(MESS_DRIVERS)/m20.o       \

DRVLIBOBJS_OMNIBYTE =               \
	$(MESS_DRIVERS)/msbc1.o     \
	$(MESS_DRIVERS)/ob68k1a.o   \

DRVLIBOBJS_ORION =                  \
	$(MESS_DRIVERS)/orion.o $(MESS_MACHINE)/orion.o $(MESS_VIDEO)/orion.o \

DRVLIBOBJS_OSBORNE =                \
	$(MESS_DRIVERS)/osborne1.o $(MESS_MACHINE)/osborne1.o \
	$(MESS_DRIVERS)/osbexec.o   \
	$(MESS_DRIVERS)/vixen.o     \

DRVLIBOBJS_OSI =                    \
	$(MESS_DRIVERS)/osi.o $(MESS_VIDEO)/osi.o \

DRVLIBOBJS_PALM =                   \
	$(MESS_DRIVERS)/palm.o      \
	$(MESS_DRIVERS)/palmz22.o   \

DRVLIBOBJS_PARKER =                 \
	$(MESS_DRIVERS)/merlin.o    \
	$(MESS_DRIVERS)/stopthie.o  \

DRVLIBOBJS_PITRONIC =               \
	$(MESS_DRIVERS)/beta.o      \

DRVLIBOBJS_PC =                     \
	$(MESS_DRIVERS)/asst128.o   \
	$(MESS_DRIVERS)/europc.o    \
	$(MESS_DRIVERS)/genpc.o $(MESS_MACHINE)/genpc.o \
	$(MESS_DRIVERS)/ibmpc.o     \
	$(MESS_DRIVERS)/ibmpcjr.o   \
	$(MESS_DRIVERS)/pc.o        \
	$(MESS_DRIVERS)/tandy1t.o $(MESS_VIDEO)/pc_t1t.o \

DRVLIBOBJS_PDP1 =                   \
	$(MESS_DRIVERS)/pdp1.o $(MESS_VIDEO)/pdp1.o \

DRVLIBOBJS_PEL =                    \
	$(MESS_DRIVERS)/galeb.o $(MESS_VIDEO)/galeb.o \
		$(MESS_DRIVERS)/orao.o $(MESS_MACHINE)/orao.o $(MESS_VIDEO)/orao.o \

DRVLIBOBJS_PHILIPS =                \
	$(MESS_DRIVERS)/p2000t.o $(MESS_MACHINE)/p2000t.o $(MESS_VIDEO)/p2000m.o \
	$(MESS_DRIVERS)/vg5k.o      \

DRVLIBOBJS_POLY88 =                 \
	$(MESS_DRIVERS)/poly88.o $(MESS_MACHINE)/poly88.o $(MESS_VIDEO)/poly88.o \

DRVLIBOBJS_PSION =                  \
	$(MESS_DRIVERS)/psion.o $(MESS_MACHINE)/psion_pack.o \

DRVLIBOBJS_RADIO =                  \
	$(MESS_DRIVERS)/apogee.o    \
	$(MESS_DRIVERS)/mikrosha.o  \
	$(MESS_DRIVERS)/partner.o $(MESS_MACHINE)/partner.o \
	$(MESS_DRIVERS)/radio86.o $(MESS_MACHINE)/radio86.o \

DRVLIBOBJS_RCA =                    \
	$(MESS_DRIVERS)/microkit.o  \
	$(MESS_DRIVERS)/studio2.o   \
	$(MESS_DRIVERS)/vip.o       \

DRVLIBOBJS_RM =                     \
	$(MESS_DRIVERS)/rm380z.o $(MESS_MACHINE)/rm380z.o $(MESS_VIDEO)/rm380z.o \
	$(MESS_DRIVERS)/rmnimbus.o $(MESS_MACHINE)/rmnimbus.o $(MESS_VIDEO)/rmnimbus.o $(MESS_MACHINE)/rmnkbd.o \

DRVLIBOBJS_ROBOTRON =               \
	$(MESS_DRIVERS)/a5105.o     \
	$(MESS_DRIVERS)/a51xx.o     \
	$(MESS_DRIVERS)/a7150.o     \
	$(MESS_DRIVERS)/k1003.o     \
	$(MESS_DRIVERS)/k8915.o     \
	$(MESS_DRIVERS)/rt1715.o    \
	$(MESS_DRIVERS)/z1013.o     \
	$(MESS_DRIVERS)/z9001.o     \

DRVLIBOBJS_ROLAND =                 \
	$(MESS_DRIVERS)/rmt32.o     \
	$(MESS_DRIVERS)/rd110.o     \
	$(MESS_DRIVERS)/rsc55.o     \

DRVLIBOBJS_ROCKWELL =               \
	$(MESS_DRIVERS)/aim65.o $(MESS_MACHINE)/aim65.o \
	$(MESS_DRIVERS)/aim65_40.o  \

DRVLIBOBJS_SAGE =                   \
	$(MESS_DRIVERS)/sage2.o     \

DRVLIBOBJS_SAMCOUPE =               \
	$(MESS_DRIVERS)/samcoupe.o $(MESS_MACHINE)/samcoupe.o $(MESS_VIDEO)/samcoupe.o \

DRVLIBOBJS_SAMSUNG =                \
	$(MESS_DRIVERS)/spc1000.o   \

DRVLIBOBJS_SANYO =                  \
	$(MESS_DRIVERS)/mbc200.o    \
	$(MESS_DRIVERS)/mbc55x.o    \
	$(MESS_MACHINE)/mbc55x.o    \
	$(MESS_VIDEO)/mbc55x.o      \
	$(MESS_DRIVERS)/phc25.o     \

DRVLIBOBJS_SEGA =                   \
	$(MESS_DRIVERS)/dccons.o $(MESS_MACHINE)/dccons.o \
	$(MESS_DRIVERS)/megadriv.o  \
	$(MESS_DRIVERS)/saturn.o    \
	$(MESS_DRIVERS)/segapico.o  \
	$(MESS_DRIVERS)/sg1000.o    \
	$(MESS_DRIVERS)/sms.o $(MESS_MACHINE)/sms.o \
	$(MESS_DRIVERS)/svmu.o      \
	$(MESS_MACHINE)/mega32x.o   \
	$(MESS_MACHINE)/megacd.o    \
	$(MESS_MACHINE)/megacdcd.o  \

DRVLIBOBJS_SGI =                    \
	$(MESS_MACHINE)/sgi.o       \
	$(MESS_DRIVERS)/sgi_ip2.o   \
	$(MESS_DRIVERS)/sgi_ip6.o   \
	$(MESS_DRIVERS)/ip20.o      \
	$(MESS_DRIVERS)/ip22.o      \
	$(MESS_VIDEO)/newport.o     \

DRVLIBOBJS_SHARP =                  \
	$(MESS_VIDEO)/mz700.o       \
	$(MESS_DRIVERS)/mz700.o     \
	$(MESS_DRIVERS)/pc1500.o    \
	$(MESS_DRIVERS)/pocketc.o   \
	$(MESS_VIDEO)/pc1401.o      \
	$(MESS_MACHINE)/pc1401.o    \
	$(MESS_VIDEO)/pc1403.o      \
	$(MESS_MACHINE)/pc1403.o    \
	$(MESS_VIDEO)/pc1350.o      \
	$(MESS_MACHINE)/pc1350.o    \
	$(MESS_VIDEO)/pc1251.o      \
	$(MESS_MACHINE)/pc1251.o    \
	$(MESS_VIDEO)/pocketc.o     \
	$(MESS_MACHINE)/mz700.o     \
	$(MESS_DRIVERS)/x68k.o      \
	$(MESS_VIDEO)/x68k.o        \
	$(MESS_MACHINE)/x68k_hdc.o  \
	$(MESS_MACHINE)/x68k_kbd.o  \
	$(MESS_DRIVERS)/mz80.o      \
	$(MESS_VIDEO)/mz80.o        \
	$(MESS_MACHINE)/mz80.o      \
	$(MESS_DRIVERS)/mz2000.o    \
	$(MESS_DRIVERS)/x1.o        \
	$(MESS_MACHINE)/x1.o        \
	$(MESS_DRIVERS)/x1twin.o    \
	$(MESS_DRIVERS)/mz2500.o    \
	$(MESS_DRIVERS)/mz3500.o    \
	$(MESS_DRIVERS)/pce220.o    \
	$(MESS_MACHINE)/pce220_ser.o\
	$(MESS_DRIVERS)/mz6500.o    \
	$(MESS_DRIVERS)/zaurus.o    \

DRVLIBOBJS_SINCLAIR =               \
	$(MESS_VIDEO)/spectrum.o    \
	$(MESS_VIDEO)/timex.o       \
	$(MESS_VIDEO)/zx.o          \
	$(MESS_DRIVERS)/zx.o        \
	$(MESS_MACHINE)/zx.o        \
	$(MESS_DRIVERS)/spectrum.o  \
	$(MESS_DRIVERS)/spec128.o   \
	$(MESS_DRIVERS)/timex.o     \
	$(MESS_DRIVERS)/specpls3.o  \
	$(MESS_DRIVERS)/scorpion.o  \
	$(MESS_DRIVERS)/atm.o       \
	$(MESS_DRIVERS)/pentagon.o  \
	$(MESS_MACHINE)/beta.o      \
	$(MESS_MACHINE)/spec_snqk.o \
	$(MESS_DRIVERS)/ql.o        \
	$(MESS_MACHINE)/qimi.o      \
	$(MESS_VIDEO)/zx8301.o      \
	$(MESS_MACHINE)/zx8302.o    \

DRVLIBOBJS_SIEMENS =                \
	$(MESS_DRIVERS)/pcd.o       \

DRVLIBOBJS_SNK =                    \
	$(MESS_DRIVERS)/ng_aes.o    \
	$(MESS_DRIVERS)/ngp.o $(MESS_VIDEO)/k1ge.o \

DRVLIBOBJS_SONY =                   \
	$(MESS_DRIVERS)/pockstat.o $(MESS_DRIVERS)/psx.o $(MESS_MACHINE)/psxcd.o \
	$(MESS_DRIVERS)/pve500.o    \
	$(MESS_DRIVERS)/smc777.o    \

DRVLIBOBJS_SORD =                   \
	$(MESS_DRIVERS)/m5.o        \

DRVLIBOBJS_SPECIAL =                \
	$(MESS_DRIVERS)/special.o $(MESS_AUDIO)/specimx_snd.o $(MESS_MACHINE)/special.o $(MESS_VIDEO)/special.o \

DRVLIBOBJS_SUN =                    \
	$(MESS_DRIVERS)/sun1.o      \
	$(MESS_DRIVERS)/sun2.o      \
	$(MESS_DRIVERS)/sun3.o      \
	$(MESS_DRIVERS)/sun4.o      \

DRVLIBOBJS_SVI =                    \
	$(MESS_DRIVERS)/svi318.o $(MESS_MACHINE)/svi318.o \

DRVLIBOBJS_SVISION =                \
	$(MESS_DRIVERS)/svision.o $(MESS_AUDIO)/svis_snd.o \

DRVLIBOBJS_SWTPC09 =                \
	$(MESS_DRIVERS)/swtpc09.o $(MESS_MACHINE)/swtpc09.o \

DRVLIBOBJS_SYNERTEC =               \
	$(MESS_DRIVERS)/sym1.o      \

DRVLIBOBJS_TA =                     \
	$(MESS_DRIVERS)/alphatro.o  \

DRVLIBOBJS_TANDBERG =               \
	$(MESS_DRIVERS)/tdv2324.o   \

DRVLIBOBJS_TANGERIN =               \
	$(MESS_DRIVERS)/microtan.o $(MESS_MACHINE)/microtan.o $(MESS_VIDEO)/microtan.o \
	$(MESS_DRIVERS)/oric.o

DRVLIBOBJS_TATUNG =                 \
	$(MESS_DRIVERS)/einstein.o $(MESS_MACHINE)/einstein.o \

DRVLIBOBJS_TEAMCONC =               \
	$(MESS_DRIVERS)/comquest.o $(MESS_VIDEO)/comquest.o \

DRVLIBOBJS_TEKTRONI =               \
	$(MESS_DRIVERS)/tek405x.o   \
	$(MESS_DRIVERS)/tek410x.o   \

DRVLIBOBJS_TELENOVA =               \
	$(MESS_DRIVERS)/compis.o $(MESS_MACHINE)/compiskb.o \

DRVLIBOBJS_TELERCAS =               \
	$(MESS_DRIVERS)/tmc1800.o $(MESS_VIDEO)/tmc1800.o \
	$(MESS_DRIVERS)/tmc600.o $(MESS_VIDEO)/tmc600.o \
	$(MESS_DRIVERS)/tmc2000e.o  \

DRVLIBOBJS_TELEVIDEO =              \
	$(MESS_DRIVERS)/ts802.o     \
	$(MESS_DRIVERS)/ts803.o     \
	$(MESS_DRIVERS)/ts816.o     \
	$(MESS_DRIVERS)/tv950.o     \

DRVLIBOBJS_TEM =                    \
	$(MESS_DRIVERS)/tec1.o      \

DRVLIBOBJS_TESLA =                  \
	$(MESS_DRIVERS)/ondra.o $(MESS_MACHINE)/ondra.o $(MESS_VIDEO)/ondra.o \
	$(MESS_DRIVERS)/pmd85.o $(MESS_MACHINE)/pmd85.o $(MESS_VIDEO)/pmd85.o \
	$(MESS_DRIVERS)/pmi80.o     \
	$(MESS_DRIVERS)/sapi1.o     \

DRVLIBOBJS_TEST =                   \
	$(MESS_DRIVERS)/test_t400.o \
	$(MESS_DRIVERS)/zexall.o    \

DRVLIBOBJS_THOMSON =                \
	$(MESS_DRIVERS)/thomson.o $(MESS_MACHINE)/thomson.o $(MESS_MACHINE)/thomflop.o $(MESS_VIDEO)/thomson.o \

DRVLIBOBJS_TI =                     \
	$(MESS_DRIVERS)/avigo.o $(MESS_VIDEO)/avigo.o \
	$(MESS_DRIVERS)/cc40.o      \
	$(MESS_DRIVERS)/evmbug.o    \
	$(MESS_DRIVERS)/exelv.o     \
	$(MESS_DRIVERS)/geneve.o    \
	$(MESS_DRIVERS)/ticalc1x.o  \
	$(MESS_DRIVERS)/ti74.o      \
	$(MESS_DRIVERS)/ti85.o $(MESS_MACHINE)/ti85.o $(MESS_VIDEO)/ti85.o \
	$(MESS_DRIVERS)/ti89.o      \
	$(MESS_DRIVERS)/ti99_2.o    \
	$(MESS_DRIVERS)/ti99_4x.o   \
	$(MESS_DRIVERS)/ti99_4p.o   \
	$(MESS_DRIVERS)/ti99_8.o    \
	$(MESS_DRIVERS)/ti990_4.o   \
	$(MESS_DRIVERS)/ti990_10.o  \
	$(MESS_DRIVERS)/tm990189.o  \
	$(MESS_MACHINE)/ti99/990_dk.o \
	$(MESS_MACHINE)/ti99/990_hd.o \
	$(MESS_MACHINE)/ti99/990_tap.o \
	$(MESS_MACHINE)/ti99/datamux.o \
	$(MESS_MACHINE)/ti99/genboard.o \
	$(MESS_MACHINE)/ti99/grom.o \
	$(MESS_MACHINE)/ti99/gromport.o \
	$(MESS_MACHINE)/ti99/handset.o \
	$(MESS_MACHINE)/ti99/joyport.o \
	$(MESS_MACHINE)/ti99/mapper8.o \
	$(MESS_MACHINE)/ti99/mecmouse.o \
	$(MESS_MACHINE)/ti99/speech8.o \
	$(MESS_MACHINE)/ti99/videowrp.o \
	$(MESS_VIDEO)/733_asr.o     \
	$(MESS_VIDEO)/911_vdt.o     \

DRVLIBOBJS_TIGER =                  \
	$(MESS_DRIVERS)/gamecom.o $(MESS_MACHINE)/gamecom.o $(MESS_VIDEO)/gamecom.o \

DRVLIBOBJS_TIGERTEL =               \
	$(MESS_DRIVERS)/gizmondo.o $(MESS_MACHINE)/docg3.o \

DRVLIBOBJS_TIKI =                   \
	$(MESS_DRIVERS)/tiki100.o   \

DRVLIBOBJS_TOMY =                   \
	$(MESS_DRIVERS)/tutor.o     \

DRVLIBOBJS_TOSHIBA =                \
	$(MESS_DRIVERS)/pasopia.o   \
	$(MESS_DRIVERS)/pasopia7.o  \
	$(MESS_DRIVERS)/paso1600.o  \

DRVLIBOBJS_TRAINER =      \
	$(MESS_DRIVERS)/amico2k.o   \
	$(MESS_DRIVERS)/babbage.o   \
	$(MESS_DRIVERS)/bob85.o     \
	$(MESS_DRIVERS)/cvicny.o    \
	$(MESS_DRIVERS)/dolphunk.o  \
	$(MESS_DRIVERS)/instruct.o  \
	$(MESS_DRIVERS)/mk14.o      \
	$(MESS_DRIVERS)/pro80.o     \
	$(MESS_DRIVERS)/savia84.o   \
	$(MESS_DRIVERS)/selz80.o    \
	$(MESS_DRIVERS)/tk80.o      \

DRVLIBOBJS_TRS =                    \
	$(MESS_DRIVERS)/coco12.o    \
	$(MESS_DRIVERS)/coco3.o     \
	$(MESS_DRIVERS)/dragon.o    \
	$(MESS_DRIVERS)/mc10.o      \
	$(MESS_MACHINE)/6883sam.o   \
	$(MESS_MACHINE)/coco.o      \
	$(MESS_MACHINE)/coco12.o    \
	$(MESS_MACHINE)/coco3.o     \
	$(MESS_MACHINE)/coco_vhd.o  \
	$(MESS_MACHINE)/dragon.o    \
	$(MESS_MACHINE)/dgnalpha.o  \
	$(MESS_VIDEO)/gime.o        \
	$(MESS_DRIVERS)/trs80.o $(MESS_MACHINE)/trs80.o $(MESS_VIDEO)/trs80.o \
	$(MESS_DRIVERS)/trs80m2.o $(MESS_MACHINE)/trs80m2kb.o \
	$(MESS_DRIVERS)/tandy2k.o $(MESS_MACHINE)/tandy2kb.o \

DRVLIBOBJS_ULTRATEC =             \
	$(MESS_DRIVERS)/minicom.o   \

DRVLIBOBJS_UNISYS =                 \
	$(MESS_DRIVERS)/univac.o    \

DRVLIBOBJS_VEB =                    \
	$(MESS_DRIVERS)/chessmst.o  \
	$(MESS_DRIVERS)/kc.o $(MESS_MACHINE)/kc.o $(MESS_MACHINE)/kc_keyb.o $(MESS_VIDEO)/kc.o \
	$(MESS_DRIVERS)/lc80.o      \
	$(MESS_DRIVERS)/mc80.o $(MESS_MACHINE)/mc80.o $(MESS_VIDEO)/mc80.o \
	$(MESS_DRIVERS)/poly880.o   \
	$(MESS_DRIVERS)/sc1.o       \
	$(MESS_DRIVERS)/sc2.o       \

DRVLIBOBJS_VIDBRAIN =               \
	$(MESS_DRIVERS)/vidbrain.o $(MESS_VIDEO)/uv201.o \

DRVLIBOBJS_VIDEOTON =               \
	$(MESS_DRIVERS)/tvc.o $(MESS_AUDIO)/tvc_snd.o \

DRVLIBOBJS_VISUAL =                 \
	$(MESS_DRIVERS)/v1050.o $(MESS_MACHINE)/v1050kb.o $(MESS_VIDEO)/v1050.o \

DRVLIBOBJS_VOTRAX =                 \
	$(MESS_DRIVERS)/votrpss.o   \
	$(MESS_DRIVERS)/votrtnt.o   \

DRVLIBOBJS_VTECH =                  \
	$(MESS_DRIVERS)/crvision.o  \
	$(MESS_DRIVERS)/geniusiq.o  \
	$(MESS_DRIVERS)/laser3k.o   \
	$(MESS_DRIVERS)/lcmate2.o   \
	$(MESS_DRIVERS)/pc4.o $(MESS_VIDEO)/pc4.o \
	$(MESS_DRIVERS)/pc2000.o    \
	$(MESS_DRIVERS)/pitagjr.o   \
	$(MESS_DRIVERS)/prestige.o  \
	$(MESS_DRIVERS)/vtech1.o    \
	$(MESS_DRIVERS)/vtech2.o $(MESS_MACHINE)/vtech2.o $(MESS_VIDEO)/vtech2.o \
	$(MESS_DRIVERS)/socrates.o $(MESS_AUDIO)/socrates.o \

DRVLIBOBJS_WANG =                   \
	$(MESS_DRIVERS)/wangpc.o $(MESS_MACHINE)/wangpckb.o \

DRVLIBOBJS_WAVEMATE =               \
	$(MESS_DRIVERS)/bullet.o    \
	$(MESS_DRIVERS)/jupiter.o   \

DRVLIBOBJS_XEROX =                  \
	$(MESS_DRIVERS)/xerox820.o $(MESS_MACHINE)/x820kb.o \
	$(MESS_DRIVERS)/bigbord2.o  \
	$(MESS_DRIVERS)/alto2.o     \

DRVLIBOBJS_XUSSRPC =                 \
	$(MESS_DRIVERS)/ec184x.o    \
	$(MESS_DRIVERS)/iskr103x.o  \
	$(MESS_DRIVERS)/mc1502.o    \
	$(MESS_DRIVERS)/poisk1.o $(MESS_VIDEO)/poisk1.o \

DRVLIBOBJS_YAMAHA =                 \
	$(MESS_DRIVERS)/ymmu100.o   \
	$(MESS_DRIVERS)/fb01.o      \

$(MESS_DRIVERS)/ymmu100.o: $(MESS_DRIVERS)/ymmu100.inc
$(MESS_DRIVERS)/ymmu100.inc: $(MESSSRC)/drivers/ymmu100.ppm $(FILE2STR_TARGET)
	@echo Converting $<...
	@$(FILE2STR) $(MESSSRC)/drivers/ymmu100.ppm $@ ymmu100_bkg UINT8

DRVLIBOBJS_ZENITH =                 \
	$(MESS_DRIVERS)/z100.o      \

DRVLIBOBJS_ZPA =                    \
	$(MESS_DRIVERS)/iq151.o     \

DRVLIBOBJS_ZVT =                    \
	$(MESS_DRIVERS)/pp01.o $(MESS_MACHINE)/pp01.o $(MESS_VIDEO)/pp01.o \

DRVLIBOBJS_SKELETON =               \
	$(MESS_DRIVERS)/alphasma.o  \
	$(MESS_DRIVERS)/ampro.o     \
	$(MESS_DRIVERS)/amust.o     \
	$(MESS_DRIVERS)/applix.o    \
	$(MESS_DRIVERS)/attache.o   \
	$(MESS_DRIVERS)/ax20.o      \
	$(MESS_DRIVERS)/beehive.o   \
	$(MESS_DRIVERS)/binbug.o    \
	$(MESS_DRIVERS)/besta.o     \
	$(MESS_DRIVERS)/br8641.o    \
	$(MESS_DRIVERS)/busicom.o $(MESS_VIDEO)/busicom.o \
	$(MESS_DRIVERS)/chaos.o     \
	$(MESS_DRIVERS)/chesstrv.o  \
	$(MESS_DRIVERS)/cd2650.o    \
	$(MESS_DRIVERS)/cdc721.o    \
	$(MESS_DRIVERS)/codata.o    \
	$(MESS_DRIVERS)/cortex.o    \
	$(MESS_DRIVERS)/cosmicos.o  \
	$(MESS_DRIVERS)/cp1.o       \
	$(MESS_DRIVERS)/cxhumax.o   \
	$(MESS_DRIVERS)/czk80.o     \
	$(MESS_DRIVERS)/d6800.o     \
	$(MESS_DRIVERS)/d6809.o     \
	$(MESS_DRIVERS)/digel804.o  \
	$(MESS_DRIVERS)/dim68k.o    \
	$(MESS_DRIVERS)/dm7000.o    \
	$(MESS_DRIVERS)/dmv.o $(MESS_MACHINE)/dmv_keyb.o \
	$(MESS_DRIVERS)/dps1.o      \
	$(MESS_DRIVERS)/dsb46.o     \
	$(MESS_DRIVERS)/dual68.o    \
	$(MESS_DRIVERS)/eacc.o      \
	$(MESS_DRIVERS)/elwro800.o  \
	$(MESS_DRIVERS)/eti660.o    \
	$(MESS_DRIVERS)/fanucs15.o  \
	$(MESS_DRIVERS)/fanucspmg.o \
	$(MESS_DRIVERS)/fc100.o     \
	$(MESS_DRIVERS)/fk1.o       \
	$(MESS_DRIVERS)/ft68m.o     \
	$(MESS_DRIVERS)/gamate.o    \
	$(MESS_DRIVERS)/gameking.o  \
	$(MESS_DRIVERS)/gimix.o     \
	$(MESS_DRIVERS)/grfd2301.o  \
	$(MESS_DRIVERS)/harriet.o   \
	$(MESS_DRIVERS)/hprot1.o    \
	$(MESS_DRIVERS)/hpz80unk.o  \
	$(MESS_DRIVERS)/ht68k.o     \
	$(MESS_DRIVERS)/hunter2.o $(EMU_MACHINE)/nsc810.o \
	$(MESS_DRIVERS)/ibm6580.o   \
	$(MESS_DRIVERS)/ie15.o $(MESS_MACHINE)/ie15_kbd.o \
	$(MESS_DRIVERS)/if800.o     \
	$(MESS_DRIVERS)/imsai.o     \
	$(MESS_DRIVERS)/indiana.o   \
	$(MESS_DRIVERS)/itt3030.o   \
	$(MESS_DRIVERS)/jade.o      \
	$(MESS_DRIVERS)/jonos.o     \
	$(MESS_DRIVERS)/konin.o     \
	$(MESS_DRIVERS)/leapster.o  \
	$(MESS_DRIVERS)/lft.o       \
	$(MESS_DRIVERS)/lola8a.o    \
	$(MESS_DRIVERS)/m79152pc.o  \
	$(MESS_DRIVERS)/mccpm.o     \
	$(MESS_DRIVERS)/mes.o       \
	$(MESS_DRIVERS)/mice.o      \
	$(MESS_DRIVERS)/micronic.o  \
	$(MESS_DRIVERS)/mini2440.o  \
	$(MESS_DRIVERS)/mmd1.o      \
	$(MESS_DRIVERS)/mod8.o      \
	$(MESS_DRIVERS)/modellot.o  \
	$(MESS_DRIVERS)/molecular.o \
	$(MESS_DRIVERS)/ms0515.o    \
	$(MESS_DRIVERS)/ms9540.o    \
	$(MESS_DRIVERS)/mstation.o  \
	$(MESS_DRIVERS)/mx2178.o    \
	$(MESS_DRIVERS)/mycom.o     \
	$(MESS_DRIVERS)/myvision.o  \
	$(MESS_DRIVERS)/ngen.o      \
	$(MESS_DRIVERS)/octopus.o   \
	$(MESS_DRIVERS)/onyx.o      \
	$(MESS_DRIVERS)/okean240.o  \
	$(MESS_DRIVERS)/p8k.o       \
	$(MESS_DRIVERS)/pegasus.o   \
	$(MESS_DRIVERS)/pencil2.o   \
	$(MESS_DRIVERS)/pes.o       \
	$(MESS_DRIVERS)/pipbug.o    \
	$(MESS_DRIVERS)/plan80.o    \
	$(MESS_DRIVERS)/pm68k.o     \
	$(MESS_DRIVERS)/poly.o      \
	$(MESS_DRIVERS)/pt68k4.o    \
	$(MESS_DRIVERS)/ptcsol.o    \
	$(MESS_DRIVERS)/pulsar.o    \
	$(MESS_DRIVERS)/pv9234.o    \
	$(MESS_DRIVERS)/qtsbc.o     \
	$(MESS_DRIVERS)/rvoice.o    \
	$(MESS_DRIVERS)/sacstate.o  \
	$(MESS_DRIVERS)/sbrain.o    \
	$(MESS_DRIVERS)/seattle.o   \
	$(MESS_DRIVERS)/sh4robot.o  \
	$(MESS_DRIVERS)/softbox.o   \
	$(MESS_DRIVERS)/swtpc.o     \
	$(MESS_DRIVERS)/sys2900.o   \
	$(MESS_DRIVERS)/systec.o    \
	$(MESS_DRIVERS)/tavernie.o  \
	$(MESS_DRIVERS)/tecnbras.o  \
	$(MESS_DRIVERS)/terak.o     \
	$(MESS_DRIVERS)/ti630.o     \
	$(MESS_DRIVERS)/tsispch.o   \
	$(MESS_DRIVERS)/unistar.o   \
	$(MESS_DRIVERS)/v6809.o     \
	$(MESS_DRIVERS)/vector4.o   \
	$(MESS_DRIVERS)/vii.o       \
	$(MESS_DRIVERS)/wicat.o     \
	$(MESS_DRIVERS)/xor100.o    \
	$(MESS_DRIVERS)/xavix.o     \
	$(MESS_DRIVERS)/zorba.o     \




#-------------------------------------------------
# miscellaneous dependencies
#-------------------------------------------------

$(MESS_MACHINE)/snescx4.o: $(MESSSRC)/machine/cx4ops.inc \
				$(MESSSRC)/machine/cx4oam.inc \
				$(MESSSRC)/machine/cx4fn.inc \
				$(MESSSRC)/machine/cx4data.inc \

$(MESS_MACHINE)/nes_slot.o:  $(MESSSRC)/machine/nes_ines.inc \
				$(MESSSRC)/machine/nes_pcb.inc \
				$(MESSSRC)/machine/nes_unif.inc \

$(MESS_AUDIO)/mac.o:        $(MESSSRC)/audio/mac.c \
				$(MESSSRC)/includes/mac.h $(MESSSRC)/machine/egret.h $(MESSSRC)/machine/cuda.h

$(MESS_VIDEO)/mac.o:        $(MESSSRC)/video/mac.c \
				$(MESSSRC)/includes/mac.h $(MESSSRC)/machine/egret.h $(MESSSRC)/machine/cuda.h

$(MESS_MACHINE)/mac.o:      $(MESSSRC)/machine/mac.c \
				$(MESSSRC)/includes/mac.h $(MESSSRC)/machine/egret.h $(MESSSRC)/machine/cuda.h

$(MESS_MACHINE)/macadb.o:   $(MESSSRC)/machine/macadb.c \
				$(MESSSRC)/includes/mac.h $(MESSSRC)/machine/egret.h $(MESSSRC)/machine/cuda.h

$(MESS_MACHINE)/macrtc.o:   $(MESSSRC)/machine/macrtc.c \
				$(MESSSRC)/includes/mac.h $(MESSSRC)/machine/egret.h $(MESSSRC)/machine/cuda.h

$(MESS_DRIVERS)/mac.o:      $(MESSSRC)/drivers/mac.c \
				$(MESSSRC)/includes/mac.h $(MESSSRC)/machine/egret.h $(MESSSRC)/machine/cuda.h

$(MESS_MACHINE)/egret.o:    $(MESSSRC)/machine/egret.c\
				$(MESSSRC)/machine/egret.h

$(MESS_DRIVERS)/apple2.o:   $(MESSSRC)/video/apple2.h
$(MESS_DRIVERS)/apple2e.o:  $(MESSSRC)/video/apple2.h
$(MESS_MACHINE)/apple2.o:   $(MESSSRC)/includes/apple2.h
$(MESS_VIDEO)/apple2.o:     $(MESSSRC)/includes/apple2.h $(MESSSRC)/video/apple2.h
$(MESS_DRIVERS)/apple2gs.o: $(MESSSRC)/includes/apple2.h $(MESSSRC)/includes/apple2gs.h
$(MESS_MACHINE)/apple2gs.o: $(MESSSRC)/includes/apple2.h $(MESSSRC)/includes/apple2gs.h
$(MESS_VIDEO)/apple2gs.o:   $(MESSSRC)/includes/apple2.h $(MESSSRC)/includes/apple2gs.h
$(MESS_DRIVERS)/apple3.o:   $(MESSSRC)/includes/apple3.h
$(MESS_MACHINE)/apple3.o:   $(MESSSRC)/includes/apple3.h
$(MESS_VIDEO)/apple3.o:     $(MESSSRC)/includes/apple3.h


# $(MESSSRC)/drivers/apollo.c includes m68kcpu.h and m68kcpu.h now includes m68kops.h
$(MESS_DRIVERS)/apollo.o:   $(EMUSRC)/cpu/m68000/m68kcpu.h
$(MESS_MACHINE)/apollo_dbg.o:   $(EMUSRC)/cpu/m68000/m68kcpu.h

# when we compile source files we need to include generated files from the OBJ directory
$(MESS_DRIVERS)/apollo.o:   $(MESSSRC)/drivers/apollo.c | $(OSPREBUILD)
	@echo Compiling $<...
	$(CC) $(CDEFS) $(CFLAGS) -I$(CPUOBJ)/m68000 -c $< -o $@

$(MESS_MACHINE)/apollo_dbg.o: $(MESSSRC)/machine/apollo_dbg.c | $(OSPREBUILD)
	@echo Compiling $<...
	$(CC) $(CDEFS) $(CFLAGS) -I$(CPUOBJ)/m68000 -c $< -o $@

#-------------------------------------------------
# layout dependencies
#-------------------------------------------------

$(MESS_DRIVERS)/4004clk.o:  $(MESS_LAYOUT)/4004clk.lh
$(MESS_VIDEO)/abc1600.o:    $(MESS_LAYOUT)/abc1600.lh
$(MESS_DRIVERS)/acrnsys1.o: $(MESS_LAYOUT)/acrnsys1.lh
$(MESS_DRIVERS)/aim65.o:    $(MESS_LAYOUT)/aim65.lh
$(MESS_DRIVERS)/aim65_40.o: $(MESS_LAYOUT)/aim65_40.lh
$(MESS_DRIVERS)/alesis.o:   $(MESS_LAYOUT)/sr16.lh
$(MESS_DRIVERS)/amico2k.o:  $(MESS_LAYOUT)/amico2k.lh
$(MESS_DRIVERS)/amiga.o:    $(MESS_LAYOUT)/amiga.lh
$(MESS_VIDEO)/apollo.o:     $(MESS_LAYOUT)/apollo.lh \
							$(MESS_LAYOUT)/apollo_15i.lh
$(MESS_DRIVERS)/apollo.o:   $(MESS_LAYOUT)/apollo_dsp.lh
$(MESS_DRIVERS)/apricotp.o: $(MESS_LAYOUT)/apricotp.lh
$(MESS_DRIVERS)/avigo.o:    $(MESS_LAYOUT)/avigo.lh
$(MESS_DRIVERS)/babbage.o:  $(MESS_LAYOUT)/babbage.lh
$(MESS_DRIVERS)/bbc.o:      $(MESS_LAYOUT)/bbc.lh
$(MESS_DRIVERS)/beta.o:     $(MESS_LAYOUT)/beta.lh
$(MESS_DRIVERS)/bob85.o:    $(MESS_LAYOUT)/bob85.lh
$(MESS_DRIVERS)/cc40.o:     $(MESS_LAYOUT)/cc40.lh
$(MAME_DRIVERS)/cdi.o:      $(MAME_LAYOUT)/cdi.lh
$(MESS_DRIVERS)/chessmst.o: $(MESS_LAYOUT)/chessmst.lh
$(MESS_DRIVERS)/chesstrv.o: $(MESS_LAYOUT)/chesstrv.lh \
							$(MESS_LAYOUT)/borisdpl.lh
$(MESS_DRIVERS)/cp1.o:      $(MESS_LAYOUT)/cp1.lh
$(MESS_DRIVERS)/cvicny.o:   $(MESS_LAYOUT)/cvicny.lh
$(MESS_DRIVERS)/coco3.o:    $(MESS_LAYOUT)/coco3.lh
$(MESS_DRIVERS)/cosmicos.o: $(MESS_LAYOUT)/cosmicos.lh
$(MESS_DRIVERS)/c80.o:      $(MESS_LAYOUT)/c80.lh
$(MESS_DRIVERS)/digel804.o: $(MESS_LAYOUT)/digel804.lh
$(MESS_DRIVERS)/dmv.o:      $(MESS_LAYOUT)/dmv.lh
$(MESS_DRIVERS)/dolphunk.o: $(MESS_LAYOUT)/dolphunk.lh
$(MESS_DRIVERS)/eacc.o:     $(MESS_LAYOUT)/eacc.lh
$(MESS_DRIVERS)/elf.o:      $(MESS_LAYOUT)/elf2.lh
$(MESS_DRIVERS)/elekscmp.o: $(MESS_LAYOUT)/elekscmp.lh
$(MESS_MACHINE)/esqvfd.o:   $(MESS_LAYOUT)/esq2by40.lh \
							$(MESS_LAYOUT)/esq1by22.lh
$(MESS_DRIVERS)/et3400.o:   $(MESS_LAYOUT)/et3400.lh
$(MESS_DRIVERS)/fb01.o:     $(MESS_LAYOUT)/fb01.lh
$(MESS_DRIVERS)/fidelz80.o: $(MESS_LAYOUT)/fidelz80.lh \
							$(MESS_LAYOUT)/bridgec3.lh \
							$(MESS_LAYOUT)/vsc.lh
$(MESS_DRIVERS)/gamecom.o:  $(MESS_LAYOUT)/gamecom.lh
$(MESS_DRIVERS)/glasgow.o:  $(MESS_LAYOUT)/glasgow.lh
$(MESS_DRIVERS)/h8.o:       $(MESS_LAYOUT)/h8.lh
$(MESS_DRIVERS)/ie15.o:     $(MESS_LAYOUT)/ie15.lh
$(MESS_DRIVERS)/instruct.o: $(MESS_LAYOUT)/instruct.lh
$(MESS_DRIVERS)/k1003.o:    $(MESS_LAYOUT)/k1003.lh
$(MESS_DRIVERS)/kim1.o:     $(MESS_LAYOUT)/kim1.lh
$(MESS_DRIVERS)/junior.o:   $(MESS_LAYOUT)/junior.lh
$(MESS_DRIVERS)/lc80.o:     $(MESS_LAYOUT)/lc80.lh
$(MESS_DRIVERS)/llc.o:      $(MESS_LAYOUT)/llc1.lh
$(MESS_DRIVERS)/lynx.o:     $(MESS_LAYOUT)/lynx.lh
$(MESS_DRIVERS)/mac.o:      $(MESS_LAYOUT)/mac.lh
$(MESS_MACHINE)/megacd.o:   $(MESS_LAYOUT)/megacd.lh
$(MESS_DRIVERS)/mekd2.o:    $(MESS_LAYOUT)/mekd2.lh
$(MESS_DRIVERS)/mephisto.o: $(MESS_LAYOUT)/mephisto.lh
$(MESS_DRIVERS)/merlin.o:   $(MESS_LAYOUT)/merlin.lh
$(MESS_DRIVERS)/minicom.o:  $(MESS_LAYOUT)/minicom.lh
$(MESS_DRIVERS)/mirage.o:   $(MESS_LAYOUT)/mirage.lh
$(MESS_DRIVERS)/mk1.o:      $(MESS_LAYOUT)/mk1.lh
$(MESS_DRIVERS)/mk14.o:     $(MESS_LAYOUT)/mk14.lh
$(MESS_DRIVERS)/mk2.o:      $(MESS_LAYOUT)/mk2.lh
$(MESS_DRIVERS)/mkit09.o:   $(MESS_LAYOUT)/mkit09.lh
$(MESS_DRIVERS)/mmd1.o:     $(MESS_LAYOUT)/mmd1.lh \
							$(MESS_LAYOUT)/mmd2.lh
$(MESS_DRIVERS)/mpf1.o:     $(MESS_LAYOUT)/mpf1.lh \
							$(MESS_LAYOUT)/mpf1b.lh \
							$(MESS_LAYOUT)/mpf1p.lh
$(MESS_VIDEO)/newbrain.o:   $(MESS_LAYOUT)/newbrain.lh
$(MAME_DRIVERS)/neogeo.o:   $(MAME_LAYOUT)/neogeo.lh
$(MESS_DRIVERS)/pc1500.o:   $(MESS_LAYOUT)/pc1500.lh
$(MESS_DRIVERS)/pc2000.o:   $(MESS_LAYOUT)/gl3000s.lh
$(MESS_VIDEO)/pc8401a.o:    $(MESS_LAYOUT)/pc8500.lh
$(MESS_DRIVERS)/pcw.o:      $(MESS_LAYOUT)/pcw.lh
$(MESS_DRIVERS)/pmi80.o:    $(MESS_LAYOUT)/pmi80.lh
$(MESS_DRIVERS)/poly880.o:  $(MESS_LAYOUT)/poly880.lh
$(MESS_DRIVERS)/pro80.o:    $(MESS_LAYOUT)/pro80.lh
$(MESS_DRIVERS)/pve500.o:   $(MESS_LAYOUT)/pve500.lh
$(MESS_DRIVERS)/px4.o:      $(MESS_LAYOUT)/px4.lh
$(MESS_DRIVERS)/px8.o:      $(MESS_LAYOUT)/px8.lh
$(MESS_DRIVERS)/ravens.o:   $(MESS_LAYOUT)/ravens.lh
$(MESS_DRIVERS)/rainbow.o:  $(MESS_LAYOUT)/rainbow.lh
$(MESS_DRIVERS)/savia84.o:  $(MESS_LAYOUT)/savia84.lh
$(MESS_DRIVERS)/sc1.o:      $(MESS_LAYOUT)/sc1.lh
$(MESS_DRIVERS)/sc2.o:      $(MESS_LAYOUT)/sc2.lh
$(MESS_DRIVERS)/sdk85.o:    $(MESS_LAYOUT)/sdk85.lh
$(MESS_DRIVERS)/sdk86.o:    $(MESS_LAYOUT)/sdk86.lh
$(MESS_DRIVERS)/selz80.o:   $(MESS_LAYOUT)/selz80.lh
$(MESS_DRIVERS)/simon.o:    $(MESS_LAYOUT)/simon.lh
$(MESS_DRIVERS)/sitcom.o:   $(MESS_LAYOUT)/sitcom.lh
$(MESS_DRIVERS)/slc1.o:     $(MESS_LAYOUT)/slc1.lh
$(MESS_DRIVERS)/sms.o:      $(MESS_LAYOUT)/sms1.lh
$(MESS_DRIVERS)/stopthie.o: $(MESS_LAYOUT)/stopthie.lh
$(MESS_DRIVERS)/super80.o:  $(MESS_LAYOUT)/super80.lh
$(MESS_DRIVERS)/supercon.o: $(MESS_LAYOUT)/supercon.lh
$(MESS_DRIVERS)/svision.o:  $(MESS_LAYOUT)/svision.lh
$(MESS_DRIVERS)/svmu.o:     $(MESS_LAYOUT)/svmu.lh
$(MESS_DRIVERS)/sym1.o:     $(MESS_LAYOUT)/sym1.lh
$(MESS_DRIVERS)/tavernie.o: $(MESS_LAYOUT)/tavernie.lh
$(MESS_DRIVERS)/tec1.o:     $(MESS_LAYOUT)/tec1.lh
$(MESS_DRIVERS)/tecnbras.o: $(MESS_LAYOUT)/tecnbras.lh
$(MESS_DRIVERS)/ti74.o:     $(MESS_LAYOUT)/ti74.lh \
							$(MESS_LAYOUT)/ti95.lh
$(MESS_DRIVERS)/tk80.o:     $(MESS_LAYOUT)/tk80.lh
$(MESS_DRIVERS)/tm990189.o: $(MESS_LAYOUT)/tm990189.lh \
							$(MESS_LAYOUT)/tm990189v.lh
$(MESS_DRIVERS)/unixpc.o:   $(MESS_LAYOUT)/unixpc.lh
$(MESS_DRIVERS)/ut88.o:     $(MESS_LAYOUT)/ut88mini.lh
$(MESS_DRIVERS)/vboy.o:     $(MESS_LAYOUT)/vboy.lh
$(MESS_DRIVERS)/vcs80.o:    $(MESS_LAYOUT)/vcs80.lh
$(MESS_DRIVERS)/vidbrain.o: $(MESS_LAYOUT)/vidbrain.lh
$(MESS_DRIVERS)/votrpss.o:  $(MESS_LAYOUT)/votrpss.lh
$(MESS_DRIVERS)/votrtnt.o:  $(MESS_LAYOUT)/votrtnt.lh
$(MESS_DRIVERS)/vk100.o:    $(MESS_LAYOUT)/vk100.lh
$(MESS_DRIVERS)/vt100.o:    $(MESS_LAYOUT)/vt100.lh
$(MESS_DRIVERS)/wicat.o:    $(MESS_LAYOUT)/wicat.lh
$(MESS_DRIVERS)/wswan.o:    $(MESS_LAYOUT)/wswan.lh
$(MESS_DRIVERS)/x68k.o:     $(MESS_LAYOUT)/x68000.lh
$(MESS_DRIVERS)/z80dev.o:   $(MESS_LAYOUT)/z80dev.lh
$(MESS_DRIVERS)/z80ne.o:    $(MESS_LAYOUT)/z80ne.lh \
							$(MESS_LAYOUT)/z80net.lh \
							$(MESS_LAYOUT)/z80netb.lh \
							$(MESS_LAYOUT)/z80netf.lh


$(MESSOBJ)/acorn.a: $(DRVLIBOBJS_ACORN)
$(MESSOBJ)/act.a: $(DRVLIBOBJS_ACT)
$(MESSOBJ)/adc.a: $(DRVLIBOBJS_ADC)
$(MESSOBJ)/alesis.a: $(DRVLIBOBJS_ALESIS)
$(MESSOBJ)/altos.a: $(DRVLIBOBJS_ALTOS)
$(MESSOBJ)/amiga.a: $(DRVLIBOBJS_AMIGA)
$(MESSOBJ)/amstrad.a: $(DRVLIBOBJS_AMSTRAD)
$(MESSOBJ)/apf.a: $(DRVLIBOBJS_APF)
$(MESSOBJ)/apollo.a: $(DRVLIBOBJS_APOLLO)
$(MESSOBJ)/apple.a: $(DRVLIBOBJS_APPLE)
$(MESSOBJ)/applied.a: $(DRVLIBOBJS_APPLIED)
$(MESSOBJ)/arcadia.a: $(DRVLIBOBJS_ARCADIA)
$(MESSOBJ)/ascii.a: $(DRVLIBOBJS_ASCII)
$(MESSOBJ)/at.a: $(DRVLIBOBJS_AT)
$(MESSOBJ)/atari.a: $(DRVLIBOBJS_ATARI)
$(MESSOBJ)/att.a: $(DRVLIBOBJS_ATT)
$(MESSOBJ)/bally.a: $(DRVLIBOBJS_BALLY)
$(MESSOBJ)/bandai.a: $(DRVLIBOBJS_BANDAI)
$(MESSOBJ)/be.a: $(DRVLIBOBJS_BE)
$(MESSOBJ)/bnpo.a: $(DRVLIBOBJS_BNPO)
$(MESSOBJ)/bondwell.a: $(DRVLIBOBJS_BONDWELL)
$(MESSOBJ)/booth.a: $(DRVLIBOBJS_BOOTH)
$(MESSOBJ)/camputers.a: $(DRVLIBOBJS_CAMPUTERS)
$(MESSOBJ)/canon.a: $(DRVLIBOBJS_CANON)
$(MESSOBJ)/cantab.a: $(DRVLIBOBJS_CANTAB)
$(MESSOBJ)/casio.a: $(DRVLIBOBJS_CASIO)
$(MESSOBJ)/cbm.a: $(DRVLIBOBJS_CBM)
$(MESSOBJ)/cccp.a: $(DRVLIBOBJS_CCCP)
$(MESSOBJ)/cce.a: $(DRVLIBOBJS_CCE)
$(MESSOBJ)/ccs.a: $(DRVLIBOBJS_CCS)
$(MESSOBJ)/chromatics.a: $(DRVLIBOBJS_CHROMATICS)
$(MESSOBJ)/coleco.a: $(DRVLIBOBJS_COLECO)
$(MESSOBJ)/cromemco.a: $(DRVLIBOBJS_CROMEMCO)
$(MESSOBJ)/comx.a: $(DRVLIBOBJS_COMX)
$(MESSOBJ)/concept.a: $(DRVLIBOBJS_CONCEPT)
$(MESSOBJ)/conitec.a: $(DRVLIBOBJS_CONITEC)
$(MESSOBJ)/cybiko.a: $(DRVLIBOBJS_CYBIKO)
$(MESSOBJ)/dai.a: $(DRVLIBOBJS_DAI)
$(MESSOBJ)/ddr.a: $(DRVLIBOBJS_DDR)
$(MESSOBJ)/dec.a: $(DRVLIBOBJS_DEC)
$(MESSOBJ)/dicksmth.a: $(DRVLIBOBJS_DICKSMTH)
$(MESSOBJ)/dms.a: $(DRVLIBOBJS_DMS)
$(MESSOBJ)/dragon.a: $(DRVLIBOBJS_DRAGON)
$(MESSOBJ)/drc.a: $(DRVLIBOBJS_DRC)
$(MESSOBJ)/eaca.a: $(DRVLIBOBJS_EACA)
$(MESSOBJ)/einis.a: $(DRVLIBOBJS_EINIS)
$(MESSOBJ)/elektor.a: $(DRVLIBOBJS_ELEKTOR)
$(MESSOBJ)/elektrka.a: $(DRVLIBOBJS_ELEKTRKA)
$(MESSOBJ)/ensoniq.a: $(DRVLIBOBJS_ENSONIQ)
$(MESSOBJ)/enterprise.a: $(DRVLIBOBJS_ENTERPRISE)
$(MESSOBJ)/entex.a: $(DRVLIBOBJS_ENTEX)
$(MESSOBJ)/epoch.a: $(DRVLIBOBJS_EPOCH)
$(MESSOBJ)/epson.a: $(DRVLIBOBJS_EPSON)
$(MESSOBJ)/exidy.a: $(DRVLIBOBJS_EXIDY)
$(MESSOBJ)/fairch.a: $(DRVLIBOBJS_FAIRCH)
$(MESSOBJ)/fidelity.a: $(DRVLIBOBJS_FIDELITY)
$(MESSOBJ)/fujitsu.a: $(DRVLIBOBJS_FUJITSU)
$(MESSOBJ)/funtech.a: $(DRVLIBOBJS_FUNTECH)
$(MESSOBJ)/galaxy.a: $(DRVLIBOBJS_GALAXY)
$(MESSOBJ)/gamepark.a: $(DRVLIBOBJS_GAMEPARK)
$(MESSOBJ)/grundy.a: $(DRVLIBOBJS_GRUNDY)
$(MESSOBJ)/hartung.a: $(DRVLIBOBJS_HARTUNG)
$(MESSOBJ)/heathkit.a: $(DRVLIBOBJS_HEATHKIT)
$(MESSOBJ)/hec2hrp.a: $(DRVLIBOBJS_HEC2HRP)
$(MESSOBJ)/hegener.a: $(DRVLIBOBJS_HEGENER)
$(MESSOBJ)/hitachi.a: $(DRVLIBOBJS_HITACHI)
$(MESSOBJ)/homebrew.a: $(DRVLIBOBJS_HOMEBREW)
$(MESSOBJ)/homelab.a: $(DRVLIBOBJS_HOMELAB)
$(MESSOBJ)/hp.a: $(DRVLIBOBJS_HP)
$(MESSOBJ)/imp.a: $(DRVLIBOBJS_IMP)
$(MESSOBJ)/intel.a: $(DRVLIBOBJS_INTEL)
$(MESSOBJ)/interton.a: $(DRVLIBOBJS_INTERTON)
$(MESSOBJ)/intv.a: $(DRVLIBOBJS_INTV)
$(MESSOBJ)/isc.a: $(DRVLIBOBJS_ISC)
$(MESSOBJ)/kaypro.a: $(DRVLIBOBJS_KAYPRO)
$(MESSOBJ)/koei.a: $(DRVLIBOBJS_KOEI)
$(MESSOBJ)/kyocera.a: $(DRVLIBOBJS_KYOCERA)
$(MESSOBJ)/luxor.a: $(DRVLIBOBJS_LUXOR)
$(MESSOBJ)/magnavox.a: $(DRVLIBOBJS_MAGNAVOX)
$(MESSOBJ)/makerbot.a: $(DRVLIBOBJS_MAKERBOT)
$(MESSOBJ)/matsushi.a: $(DRVLIBOBJS_MATSUSHI)
$(MESSOBJ)/mattel.a: $(DRVLIBOBJS_MATTEL)
$(MESSOBJ)/mb.a: $(DRVLIBOBJS_MB)
$(MESSOBJ)/mchester.a: $(DRVLIBOBJS_MCHESTER)
$(MESSOBJ)/memotech.a: $(DRVLIBOBJS_MEMOTECH)
$(MESSOBJ)/mgu.a: $(DRVLIBOBJS_MGU)
$(MESSOBJ)/microkey.a: $(DRVLIBOBJS_MICROKEY)
$(MESSOBJ)/mit.a: $(DRVLIBOBJS_MIT)
$(MESSOBJ)/mits.a: $(DRVLIBOBJS_MITS)
$(MESSOBJ)/mitsubishi.a: $(DRVLIBOBJS_MITSUBISHI)
$(MESSOBJ)/morrow.a: $(DRVLIBOBJS_MORROW)
$(MESSOBJ)/mos.a: $(DRVLIBOBJS_MOS)
$(MESSOBJ)/motorola.a: $(DRVLIBOBJS_MOTOROLA)
$(MESSOBJ)/multitch.a: $(DRVLIBOBJS_MULTITCH)
$(MESSOBJ)/nakajima.a: $(DRVLIBOBJS_NAKAJIMA)
$(MESSOBJ)/nascom.a: $(DRVLIBOBJS_NASCOM)
$(MESSOBJ)/ne.a: $(DRVLIBOBJS_NE)
$(MESSOBJ)/nec.a: $(DRVLIBOBJS_NEC)
$(MESSOBJ)/netronic.a: $(DRVLIBOBJS_NETRONIC)
$(MESSOBJ)/next.a: $(DRVLIBOBJS_NEXT)
$(MESSOBJ)/nintendo.a: $(DRVLIBOBJS_NINTENDO)
$(MESSOBJ)/nokia.a: $(DRVLIBOBJS_NOKIA)
$(MESSOBJ)/northstar.a: $(DRVLIBOBJS_NORTHSTAR)
$(MESSOBJ)/novag.a: $(DRVLIBOBJS_NOVAG)
$(MESSOBJ)/olivetti.a: $(DRVLIBOBJS_OLIVETTI)
$(MESSOBJ)/omnibyte.a: $(DRVLIBOBJS_OMNIBYTE)
$(MESSOBJ)/orion.a: $(DRVLIBOBJS_ORION)
$(MESSOBJ)/osborne.a: $(DRVLIBOBJS_OSBORNE)
$(MESSOBJ)/osi.a: $(DRVLIBOBJS_OSI)
$(MESSOBJ)/palm.a: $(DRVLIBOBJS_PALM)
$(MESSOBJ)/parker.a: $(DRVLIBOBJS_PARKER)
$(MESSOBJ)/pc.a: $(DRVLIBOBJS_PC)
$(MESSOBJ)/pdp1.a: $(DRVLIBOBJS_PDP1)
$(MESSOBJ)/pel.a: $(DRVLIBOBJS_PEL)
$(MESSOBJ)/philips.a: $(DRVLIBOBJS_PHILIPS)
$(MESSOBJ)/pitronic.a: $(DRVLIBOBJS_PITRONIC)
$(MESSOBJ)/poly88.a: $(DRVLIBOBJS_POLY88)
$(MESSOBJ)/psion.a: $(DRVLIBOBJS_PSION)
$(MESSOBJ)/radio.a: $(DRVLIBOBJS_RADIO)
$(MESSOBJ)/rca.a: $(DRVLIBOBJS_RCA)
$(MESSOBJ)/rm.a: $(DRVLIBOBJS_RM)
$(MESSOBJ)/robotron.a: $(DRVLIBOBJS_ROBOTRON)
$(MESSOBJ)/rockwell.a: $(DRVLIBOBJS_ROCKWELL)
$(MESSOBJ)/roland.a: $(DRVLIBOBJS_ROLAND)
$(MESSOBJ)/sage.a: $(DRVLIBOBJS_SAGE)
$(MESSOBJ)/samcoupe.a: $(DRVLIBOBJS_SAMCOUPE)
$(MESSOBJ)/samsung.a: $(DRVLIBOBJS_SAMSUNG)
$(MESSOBJ)/sanyo.a: $(DRVLIBOBJS_SANYO)
$(MESSOBJ)/sega.a: $(DRVLIBOBJS_SEGA)
$(MESSOBJ)/sgi.a: $(DRVLIBOBJS_SGI)
$(MESSOBJ)/sharp.a: $(DRVLIBOBJS_SHARP)
$(MESSOBJ)/siemens.a: $(DRVLIBOBJS_SIEMENS)
$(MESSOBJ)/sinclair.a: $(DRVLIBOBJS_SINCLAIR)
$(MESSOBJ)/skeleton.a: $(DRVLIBOBJS_SKELETON)
$(MESSOBJ)/snk.a: $(DRVLIBOBJS_SNK)
$(MESSOBJ)/sony.a: $(DRVLIBOBJS_SONY)
$(MESSOBJ)/sord.a: $(DRVLIBOBJS_SORD)
$(MESSOBJ)/special.a: $(DRVLIBOBJS_SPECIAL)
$(MESSOBJ)/sun.a: $(DRVLIBOBJS_SUN)
$(MESSOBJ)/svi.a: $(DRVLIBOBJS_SVI)
$(MESSOBJ)/svision.a: $(DRVLIBOBJS_SVISION)
$(MESSOBJ)/swtpc09.a: $(DRVLIBOBJS_SWTPC09)
$(MESSOBJ)/synertec.a: $(DRVLIBOBJS_SYNERTEC)
$(MESSOBJ)/ta.a: $(DRVLIBOBJS_TA)
$(MESSOBJ)/tandberg.a: $(DRVLIBOBJS_TANDBERG)
$(MESSOBJ)/tangerin.a: $(DRVLIBOBJS_TANGERIN)
$(MESSOBJ)/tatung.a: $(DRVLIBOBJS_TATUNG)
$(MESSOBJ)/teamconc.a: $(DRVLIBOBJS_TEAMCONC)
$(MESSOBJ)/tektroni.a: $(DRVLIBOBJS_TEKTRONI)
$(MESSOBJ)/telenova.a: $(DRVLIBOBJS_TELENOVA)
$(MESSOBJ)/telercas.a: $(DRVLIBOBJS_TELERCAS)
$(MESSOBJ)/televideo.a: $(DRVLIBOBJS_TELEVIDEO)
$(MESSOBJ)/tem.a: $(DRVLIBOBJS_TEM)
$(MESSOBJ)/tesla.a: $(DRVLIBOBJS_TESLA)
$(MESSOBJ)/test.a: $(DRVLIBOBJS_TEST)
$(MESSOBJ)/thomson.a: $(DRVLIBOBJS_THOMSON)
$(MESSOBJ)/ti.a: $(DRVLIBOBJS_TI)
$(MESSOBJ)/tiger.a: $(DRVLIBOBJS_TIGER)
$(MESSOBJ)/tigertel.a: $(DRVLIBOBJS_TIGERTEL)
$(MESSOBJ)/tiki.a: $(DRVLIBOBJS_TIKI)
$(MESSOBJ)/tomy.a: $(DRVLIBOBJS_TOMY)
$(MESSOBJ)/toshiba.a: $(DRVLIBOBJS_TOSHIBA)
$(MESSOBJ)/trainer.a: $(DRVLIBOBJS_TRAINER)
$(MESSOBJ)/trs.a: $(DRVLIBOBJS_TRS)
$(MESSOBJ)/ultratec.a: $(DRVLIBOBJS_ULTRATEC)
$(MESSOBJ)/unisys.a: $(DRVLIBOBJS_UNISYS)
$(MESSOBJ)/veb.a: $(DRVLIBOBJS_VEB)
$(MESSOBJ)/vidbrain.a: $(DRVLIBOBJS_VIDBRAIN)
$(MESSOBJ)/videoton.a: $(DRVLIBOBJS_VIDEOTON)
$(MESSOBJ)/visual.a: $(DRVLIBOBJS_VISUAL)
$(MESSOBJ)/votrax.a: $(DRVLIBOBJS_VOTRAX)
$(MESSOBJ)/vtech.a: $(DRVLIBOBJS_VTECH)
$(MESSOBJ)/wang.a: $(DRVLIBOBJS_WANG)
$(MESSOBJ)/wavemate.a: $(DRVLIBOBJS_WAVEMATE)
$(MESSOBJ)/xerox.a: $(DRVLIBOBJS_XEROX)
$(MESSOBJ)/xussrpc.a: $(DRVLIBOBJS_XUSSRPC)
$(MESSOBJ)/yamaha.a: $(DRVLIBOBJS_YAMAHA)
$(MESSOBJ)/zenith.a: $(DRVLIBOBJS_ZENITH)
$(MESSOBJ)/zpa.a: $(DRVLIBOBJS_ZPA)
$(MESSOBJ)/zvt.a: $(DRVLIBOBJS_ZVT)
$(MESSOBJ)/shared.a: $(DRVLIBOBJS_SHARED)
$(MESSOBJ)/mame.a: $(DRVLIBOBJS_MAME)

ifdef GCCDEPS
-include $(wildcard $(DRVLIBOBJS_ACORN:.o=.d))
-include $(wildcard $(DRVLIBOBJS_ACT:.o=.d))
-include $(wildcard $(DRVLIBOBJS_ADC:.o=.d))
-include $(wildcard $(DRVLIBOBJS_ALESIS:.o=.d))
-include $(wildcard $(DRVLIBOBJS_ALTOS:.o=.d))
-include $(wildcard $(DRVLIBOBJS_AMIGA:.o=.d))
-include $(wildcard $(DRVLIBOBJS_AMSTRAD:.o=.d))
-include $(wildcard $(DRVLIBOBJS_APF:.o=.d))
-include $(wildcard $(DRVLIBOBJS_APOLLO:.o=.d))
-include $(wildcard $(DRVLIBOBJS_APPLE:.o=.d))
-include $(wildcard $(DRVLIBOBJS_APPLIED:.o=.d))
-include $(wildcard $(DRVLIBOBJS_ARCADIA:.o=.d))
-include $(wildcard $(DRVLIBOBJS_ASCII:.o=.d))
-include $(wildcard $(DRVLIBOBJS_AT:.o=.d))
-include $(wildcard $(DRVLIBOBJS_ATARI:.o=.d))
-include $(wildcard $(DRVLIBOBJS_ATT:.o=.d))
-include $(wildcard $(DRVLIBOBJS_BALLY:.o=.d))
-include $(wildcard $(DRVLIBOBJS_BANDAI:.o=.d))
-include $(wildcard $(DRVLIBOBJS_BE:.o=.d))
-include $(wildcard $(DRVLIBOBJS_BNPO:.o=.d))
-include $(wildcard $(DRVLIBOBJS_BONDWELL:.o=.d))
-include $(wildcard $(DRVLIBOBJS_BOOTH:.o=.d))
-include $(wildcard $(DRVLIBOBJS_CAMPUTERS:.o=.d))
-include $(wildcard $(DRVLIBOBJS_CANON:.o=.d))
-include $(wildcard $(DRVLIBOBJS_CANTAB:.o=.d))
-include $(wildcard $(DRVLIBOBJS_CASIO:.o=.d))
-include $(wildcard $(DRVLIBOBJS_CBM:.o=.d))
-include $(wildcard $(DRVLIBOBJS_CCCP:.o=.d))
-include $(wildcard $(DRVLIBOBJS_CCE:.o=.d))
-include $(wildcard $(DRVLIBOBJS_CCS:.o=.d))
-include $(wildcard $(DRVLIBOBJS_CHROMATICS:.o=.d))
-include $(wildcard $(DRVLIBOBJS_COLECO:.o=.d))
-include $(wildcard $(DRVLIBOBJS_CROMEMCO:.o=.d))
-include $(wildcard $(DRVLIBOBJS_COMX:.o=.d))
-include $(wildcard $(DRVLIBOBJS_CONCEPT:.o=.d))
-include $(wildcard $(DRVLIBOBJS_CONITEC:.o=.d))
-include $(wildcard $(DRVLIBOBJS_CYBIKO:.o=.d))
-include $(wildcard $(DRVLIBOBJS_DAI:.o=.d))
-include $(wildcard $(DRVLIBOBJS_DDR:.o=.d))
-include $(wildcard $(DRVLIBOBJS_DEC:.o=.d))
-include $(wildcard $(DRVLIBOBJS_DICKSMTH:.o=.d))
-include $(wildcard $(DRVLIBOBJS_DMS:.o=.d))
-include $(wildcard $(DRVLIBOBJS_DRAGON:.o=.d))
-include $(wildcard $(DRVLIBOBJS_DRC:.o=.d))
-include $(wildcard $(DRVLIBOBJS_EACA:.o=.d))
-include $(wildcard $(DRVLIBOBJS_EINIS:.o=.d))
-include $(wildcard $(DRVLIBOBJS_ELEKTOR:.o=.d))
-include $(wildcard $(DRVLIBOBJS_ELEKTRKA:.o=.d))
-include $(wildcard $(DRVLIBOBJS_ENSONIQ:.o=.d))
-include $(wildcard $(DRVLIBOBJS_ENTERPRISE:.o=.d))
-include $(wildcard $(DRVLIBOBJS_ENTEX:.o=.d))
-include $(wildcard $(DRVLIBOBJS_EPOCH:.o=.d))
-include $(wildcard $(DRVLIBOBJS_EPSON:.o=.d))
-include $(wildcard $(DRVLIBOBJS_EXIDY:.o=.d))
-include $(wildcard $(DRVLIBOBJS_FAIRCH:.o=.d))
-include $(wildcard $(DRVLIBOBJS_FIDELITY:.o=.d))
-include $(wildcard $(DRVLIBOBJS_FUJITSU:.o=.d))
-include $(wildcard $(DRVLIBOBJS_FUNTECH:.o=.d))
-include $(wildcard $(DRVLIBOBJS_GALAXY:.o=.d))
-include $(wildcard $(DRVLIBOBJS_GAMEPARK:.o=.d))
-include $(wildcard $(DRVLIBOBJS_GRUNDY:.o=.d))
-include $(wildcard $(DRVLIBOBJS_HARTUNG:.o=.d))
-include $(wildcard $(DRVLIBOBJS_HEATHKIT:.o=.d))
-include $(wildcard $(DRVLIBOBJS_HEC2HRP:.o=.d))
-include $(wildcard $(DRVLIBOBJS_HEGENER:.o=.d))
-include $(wildcard $(DRVLIBOBJS_HITACHI:.o=.d))
-include $(wildcard $(DRVLIBOBJS_HOMEBREW:.o=.d))
-include $(wildcard $(DRVLIBOBJS_HOMELAB:.o=.d))
-include $(wildcard $(DRVLIBOBJS_HP:.o=.d))
-include $(wildcard $(DRVLIBOBJS_IMP:.o=.d))
-include $(wildcard $(DRVLIBOBJS_INTEL:.o=.d))
-include $(wildcard $(DRVLIBOBJS_INTERTON:.o=.d))
-include $(wildcard $(DRVLIBOBJS_INTV:.o=.d))
-include $(wildcard $(DRVLIBOBJS_ISC:.o=.d))
-include $(wildcard $(DRVLIBOBJS_KAYPRO:.o=.d))
-include $(wildcard $(DRVLIBOBJS_KOEI:.o=.d))
-include $(wildcard $(DRVLIBOBJS_KYOCERA:.o=.d))
-include $(wildcard $(DRVLIBOBJS_LUXOR:.o=.d))
-include $(wildcard $(DRVLIBOBJS_MAGNAVOX:.o=.d))
-include $(wildcard $(DRVLIBOBJS_MAKERBOT:.o=.d))
-include $(wildcard $(DRVLIBOBJS_MATSUSHI:.o=.d))
-include $(wildcard $(DRVLIBOBJS_MATTEL:.o=.d))
-include $(wildcard $(DRVLIBOBJS_MB:.o=.d))
-include $(wildcard $(DRVLIBOBJS_MCHESTER:.o=.d))
-include $(wildcard $(DRVLIBOBJS_MEMOTECH:.o=.d))
-include $(wildcard $(DRVLIBOBJS_MGU:.o=.d))
-include $(wildcard $(DRVLIBOBJS_MICROKEY:.o=.d))
-include $(wildcard $(DRVLIBOBJS_MIT:.o=.d))
-include $(wildcard $(DRVLIBOBJS_MITS:.o=.d))
-include $(wildcard $(DRVLIBOBJS_MITSUBISHI:.o=.d))
-include $(wildcard $(DRVLIBOBJS_MORROW:.o=.d))
-include $(wildcard $(DRVLIBOBJS_MOS:.o=.d))
-include $(wildcard $(DRVLIBOBJS_MOTOROLA:.o=.d))
-include $(wildcard $(DRVLIBOBJS_MULTITCH:.o=.d))
-include $(wildcard $(DRVLIBOBJS_NAKAJIMA:.o=.d))
-include $(wildcard $(DRVLIBOBJS_NASCOM:.o=.d))
-include $(wildcard $(DRVLIBOBJS_NE:.o=.d))
-include $(wildcard $(DRVLIBOBJS_NEC:.o=.d))
-include $(wildcard $(DRVLIBOBJS_NETRONIC:.o=.d))
-include $(wildcard $(DRVLIBOBJS_NEXT:.o=.d))
-include $(wildcard $(DRVLIBOBJS_NINTENDO:.o=.d))
-include $(wildcard $(DRVLIBOBJS_NOKIA:.o=.d))
-include $(wildcard $(DRVLIBOBJS_NORTHSTAR:.o=.d))
-include $(wildcard $(DRVLIBOBJS_NOVAG:.o=.d))
-include $(wildcard $(DRVLIBOBJS_OLIVETTI:.o=.d))
-include $(wildcard $(DRVLIBOBJS_OMNIBYTE:.o=.d))
-include $(wildcard $(DRVLIBOBJS_ORION:.o=.d))
-include $(wildcard $(DRVLIBOBJS_OSBORNE:.o=.d))
-include $(wildcard $(DRVLIBOBJS_OSI:.o=.d))
-include $(wildcard $(DRVLIBOBJS_PALM:.o=.d))
-include $(wildcard $(DRVLIBOBJS_PARKER:.o=.d))
-include $(wildcard $(DRVLIBOBJS_PC:.o=.d))
-include $(wildcard $(DRVLIBOBJS_PDP1:.o=.d))
-include $(wildcard $(DRVLIBOBJS_PEL:.o=.d))
-include $(wildcard $(DRVLIBOBJS_PHILIPS:.o=.d))
-include $(wildcard $(DRVLIBOBJS_PITRONIC:.o=.d))
-include $(wildcard $(DRVLIBOBJS_POLY88:.o=.d))
-include $(wildcard $(DRVLIBOBJS_PSION:.o=.d))
-include $(wildcard $(DRVLIBOBJS_RADIO:.o=.d))
-include $(wildcard $(DRVLIBOBJS_RCA:.o=.d))
-include $(wildcard $(DRVLIBOBJS_RM:.o=.d))
-include $(wildcard $(DRVLIBOBJS_ROBOTRON:.o=.d))
-include $(wildcard $(DRVLIBOBJS_ROCKWELL:.o=.d))
-include $(wildcard $(DRVLIBOBJS_ROLAND:.o=.d))
-include $(wildcard $(DRVLIBOBJS_SAGE:.o=.d))
-include $(wildcard $(DRVLIBOBJS_SAMCOUPE:.o=.d))
-include $(wildcard $(DRVLIBOBJS_SAMSUNG:.o=.d))
-include $(wildcard $(DRVLIBOBJS_SANYO:.o=.d))
-include $(wildcard $(DRVLIBOBJS_SEGA:.o=.d))
-include $(wildcard $(DRVLIBOBJS_SGI:.o=.d))
-include $(wildcard $(DRVLIBOBJS_SHARP:.o=.d))
-include $(wildcard $(DRVLIBOBJS_SIEMENS:.o=.d))
-include $(wildcard $(DRVLIBOBJS_SINCLAIR:.o=.d))
-include $(wildcard $(DRVLIBOBJS_SKELETON:.o=.d))
-include $(wildcard $(DRVLIBOBJS_SNK:.o=.d))
-include $(wildcard $(DRVLIBOBJS_SONY:.o=.d))
-include $(wildcard $(DRVLIBOBJS_SORD:.o=.d))
-include $(wildcard $(DRVLIBOBJS_SPECIAL:.o=.d))
-include $(wildcard $(DRVLIBOBJS_SUN:.o=.d))
-include $(wildcard $(DRVLIBOBJS_SVI:.o=.d))
-include $(wildcard $(DRVLIBOBJS_SVISION:.o=.d))
-include $(wildcard $(DRVLIBOBJS_SWTPC09:.o=.d))
-include $(wildcard $(DRVLIBOBJS_SYNERTEC:.o=.d))
-include $(wildcard $(DRVLIBOBJS_TA:.o=.d))
-include $(wildcard $(DRVLIBOBJS_TANDBERG:.o=.d))
-include $(wildcard $(DRVLIBOBJS_TANGERIN:.o=.d))
-include $(wildcard $(DRVLIBOBJS_TATUNG:.o=.d))
-include $(wildcard $(DRVLIBOBJS_TEAMCONC:.o=.d))
-include $(wildcard $(DRVLIBOBJS_TEKTRONI:.o=.d))
-include $(wildcard $(DRVLIBOBJS_TELENOVA:.o=.d))
-include $(wildcard $(DRVLIBOBJS_TELERCAS:.o=.d))
-include $(wildcard $(DRVLIBOBJS_TELEVIDEO:.o=.d))
-include $(wildcard $(DRVLIBOBJS_TEM:.o=.d))
-include $(wildcard $(DRVLIBOBJS_TESLA:.o=.d))
-include $(wildcard $(DRVLIBOBJS_TEST:.o=.d))
-include $(wildcard $(DRVLIBOBJS_THOMSON:.o=.d))
-include $(wildcard $(DRVLIBOBJS_TI:.o=.d))
-include $(wildcard $(DRVLIBOBJS_TIGER:.o=.d))
-include $(wildcard $(DRVLIBOBJS_TIGERTEL:.o=.d))
-include $(wildcard $(DRVLIBOBJS_TIKI:.o=.d))
-include $(wildcard $(DRVLIBOBJS_TOMY:.o=.d))
-include $(wildcard $(DRVLIBOBJS_TOSHIBA:.o=.d))
-include $(wildcard $(DRVLIBOBJS_TRAINER:.o=.d))
-include $(wildcard $(DRVLIBOBJS_TRS:.o=.d))
-include $(wildcard $(DRVLIBOBJS_ULTRATEC:.o=.d))
-include $(wildcard $(DRVLIBOBJS_UNISYS:.o=.d))
-include $(wildcard $(DRVLIBOBJS_VEB:.o=.d))
-include $(wildcard $(DRVLIBOBJS_VIDBRAIN:.o=.d))
-include $(wildcard $(DRVLIBOBJS_VIDEOTON:.o=.d))
-include $(wildcard $(DRVLIBOBJS_VISUAL:.o=.d))
-include $(wildcard $(DRVLIBOBJS_VOTRAX:.o=.d))
-include $(wildcard $(DRVLIBOBJS_VTECH:.o=.d))
-include $(wildcard $(DRVLIBOBJS_WANG:.o=.d))
-include $(wildcard $(DRVLIBOBJS_WAVEMATE:.o=.d))
-include $(wildcard $(DRVLIBOBJS_XEROX:.o=.d))
-include $(wildcard $(DRVLIBOBJS_XUSSRPC:.o=.d))
-include $(wildcard $(DRVLIBOBJS_YAMAHA:.o=.d))
-include $(wildcard $(DRVLIBOBJS_ZENITH:.o=.d))
-include $(wildcard $(DRVLIBOBJS_ZPA:.o=.d))
-include $(wildcard $(DRVLIBOBJS_ZVT:.o=.d))
-include $(wildcard $(DRVLIBOBJS_SHARED:.o=.d))
-include $(wildcard $(DRVLIBOBJS_MAME:.o=.d))
endif

#-------------------------------------------------
# MESS-specific tools
#-------------------------------------------------

include $(MESSSRC)/tools/tools.mak

