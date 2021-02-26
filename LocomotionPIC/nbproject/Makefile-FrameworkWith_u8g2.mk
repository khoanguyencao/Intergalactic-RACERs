#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-FrameworkWith_u8g2.mk)" "nbproject/Makefile-local-FrameworkWith_u8g2.mk"
include nbproject/Makefile-local-FrameworkWith_u8g2.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=FrameworkWith_u8g2
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Locomotion.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Locomotion.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=FrameworkSource/ES_Port.c FrameworkSource/ES_Timers.c FrameworkSource/ES_LookupTables.c FrameworkSource/ES_CheckEvents.c FrameworkSource/ES_DeferRecall.c FrameworkSource/ES_Framework.c FrameworkSource/ES_Queue.c FrameworkSource/ES_PostList.c FrameworkSource/terminal.c ProjectSource/main.c ProjectSource/EventCheckers.c ProjectSource/dbprintf.c ProjectSource/Locomotion.c ProjectSource/LocomotionTestHarness.c u8g2/spi_master.c u8g2/u8g2_bitmap.c u8g2/u8g2_box.c u8g2/u8g2_buffer.c u8g2/u8g2_circle.c u8g2/u8g2_cleardisplay.c u8g2/u8g2_d_memory.c u8g2/u8g2_d_setup.c u8g2/u8g2_font.c u8g2/u8g2_fonts.c u8g2/u8g2_hvline.c u8g2/u8g2_input_value.c u8g2/u8g2_intersection.c u8g2/u8g2_kerning.c u8g2/u8g2_line.c u8g2/u8g2_ll_hvline.c u8g2/u8g2_message.c u8g2/u8g2_pic32mz.c u8g2/u8g2_polygon.c u8g2/u8g2_selection_list.c u8g2/u8g2_setup.c u8g2/u8log.c u8g2/u8log_u8g2.c u8g2/u8log_u8x8.c u8g2/u8x8_8x8.c u8g2/u8x8_byte.c u8g2/u8x8_cad.c u8g2/u8x8_d_ssd1306_128x64_noname.c u8g2/u8x8_debounce.c u8g2/u8x8_display.c u8g2/u8x8_fonts.c u8g2/u8x8_gpio.c u8g2/u8x8_input_value.c u8g2/u8x8_message.c u8g2/u8x8_selection_list.c u8g2/u8x8_setup.c u8g2/u8x8_string.c u8g2/u8x8_u16toa.c u8g2/u8x8_u8toa.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/FrameworkSource/ES_Port.o ${OBJECTDIR}/FrameworkSource/ES_Timers.o ${OBJECTDIR}/FrameworkSource/ES_LookupTables.o ${OBJECTDIR}/FrameworkSource/ES_CheckEvents.o ${OBJECTDIR}/FrameworkSource/ES_DeferRecall.o ${OBJECTDIR}/FrameworkSource/ES_Framework.o ${OBJECTDIR}/FrameworkSource/ES_Queue.o ${OBJECTDIR}/FrameworkSource/ES_PostList.o ${OBJECTDIR}/FrameworkSource/terminal.o ${OBJECTDIR}/ProjectSource/main.o ${OBJECTDIR}/ProjectSource/EventCheckers.o ${OBJECTDIR}/ProjectSource/dbprintf.o ${OBJECTDIR}/ProjectSource/Locomotion.o ${OBJECTDIR}/ProjectSource/LocomotionTestHarness.o ${OBJECTDIR}/u8g2/spi_master.o ${OBJECTDIR}/u8g2/u8g2_bitmap.o ${OBJECTDIR}/u8g2/u8g2_box.o ${OBJECTDIR}/u8g2/u8g2_buffer.o ${OBJECTDIR}/u8g2/u8g2_circle.o ${OBJECTDIR}/u8g2/u8g2_cleardisplay.o ${OBJECTDIR}/u8g2/u8g2_d_memory.o ${OBJECTDIR}/u8g2/u8g2_d_setup.o ${OBJECTDIR}/u8g2/u8g2_font.o ${OBJECTDIR}/u8g2/u8g2_fonts.o ${OBJECTDIR}/u8g2/u8g2_hvline.o ${OBJECTDIR}/u8g2/u8g2_input_value.o ${OBJECTDIR}/u8g2/u8g2_intersection.o ${OBJECTDIR}/u8g2/u8g2_kerning.o ${OBJECTDIR}/u8g2/u8g2_line.o ${OBJECTDIR}/u8g2/u8g2_ll_hvline.o ${OBJECTDIR}/u8g2/u8g2_message.o ${OBJECTDIR}/u8g2/u8g2_pic32mz.o ${OBJECTDIR}/u8g2/u8g2_polygon.o ${OBJECTDIR}/u8g2/u8g2_selection_list.o ${OBJECTDIR}/u8g2/u8g2_setup.o ${OBJECTDIR}/u8g2/u8log.o ${OBJECTDIR}/u8g2/u8log_u8g2.o ${OBJECTDIR}/u8g2/u8log_u8x8.o ${OBJECTDIR}/u8g2/u8x8_8x8.o ${OBJECTDIR}/u8g2/u8x8_byte.o ${OBJECTDIR}/u8g2/u8x8_cad.o ${OBJECTDIR}/u8g2/u8x8_d_ssd1306_128x64_noname.o ${OBJECTDIR}/u8g2/u8x8_debounce.o ${OBJECTDIR}/u8g2/u8x8_display.o ${OBJECTDIR}/u8g2/u8x8_fonts.o ${OBJECTDIR}/u8g2/u8x8_gpio.o ${OBJECTDIR}/u8g2/u8x8_input_value.o ${OBJECTDIR}/u8g2/u8x8_message.o ${OBJECTDIR}/u8g2/u8x8_selection_list.o ${OBJECTDIR}/u8g2/u8x8_setup.o ${OBJECTDIR}/u8g2/u8x8_string.o ${OBJECTDIR}/u8g2/u8x8_u16toa.o ${OBJECTDIR}/u8g2/u8x8_u8toa.o
POSSIBLE_DEPFILES=${OBJECTDIR}/FrameworkSource/ES_Port.o.d ${OBJECTDIR}/FrameworkSource/ES_Timers.o.d ${OBJECTDIR}/FrameworkSource/ES_LookupTables.o.d ${OBJECTDIR}/FrameworkSource/ES_CheckEvents.o.d ${OBJECTDIR}/FrameworkSource/ES_DeferRecall.o.d ${OBJECTDIR}/FrameworkSource/ES_Framework.o.d ${OBJECTDIR}/FrameworkSource/ES_Queue.o.d ${OBJECTDIR}/FrameworkSource/ES_PostList.o.d ${OBJECTDIR}/FrameworkSource/terminal.o.d ${OBJECTDIR}/ProjectSource/main.o.d ${OBJECTDIR}/ProjectSource/EventCheckers.o.d ${OBJECTDIR}/ProjectSource/dbprintf.o.d ${OBJECTDIR}/ProjectSource/Locomotion.o.d ${OBJECTDIR}/ProjectSource/LocomotionTestHarness.o.d ${OBJECTDIR}/u8g2/spi_master.o.d ${OBJECTDIR}/u8g2/u8g2_bitmap.o.d ${OBJECTDIR}/u8g2/u8g2_box.o.d ${OBJECTDIR}/u8g2/u8g2_buffer.o.d ${OBJECTDIR}/u8g2/u8g2_circle.o.d ${OBJECTDIR}/u8g2/u8g2_cleardisplay.o.d ${OBJECTDIR}/u8g2/u8g2_d_memory.o.d ${OBJECTDIR}/u8g2/u8g2_d_setup.o.d ${OBJECTDIR}/u8g2/u8g2_font.o.d ${OBJECTDIR}/u8g2/u8g2_fonts.o.d ${OBJECTDIR}/u8g2/u8g2_hvline.o.d ${OBJECTDIR}/u8g2/u8g2_input_value.o.d ${OBJECTDIR}/u8g2/u8g2_intersection.o.d ${OBJECTDIR}/u8g2/u8g2_kerning.o.d ${OBJECTDIR}/u8g2/u8g2_line.o.d ${OBJECTDIR}/u8g2/u8g2_ll_hvline.o.d ${OBJECTDIR}/u8g2/u8g2_message.o.d ${OBJECTDIR}/u8g2/u8g2_pic32mz.o.d ${OBJECTDIR}/u8g2/u8g2_polygon.o.d ${OBJECTDIR}/u8g2/u8g2_selection_list.o.d ${OBJECTDIR}/u8g2/u8g2_setup.o.d ${OBJECTDIR}/u8g2/u8log.o.d ${OBJECTDIR}/u8g2/u8log_u8g2.o.d ${OBJECTDIR}/u8g2/u8log_u8x8.o.d ${OBJECTDIR}/u8g2/u8x8_8x8.o.d ${OBJECTDIR}/u8g2/u8x8_byte.o.d ${OBJECTDIR}/u8g2/u8x8_cad.o.d ${OBJECTDIR}/u8g2/u8x8_d_ssd1306_128x64_noname.o.d ${OBJECTDIR}/u8g2/u8x8_debounce.o.d ${OBJECTDIR}/u8g2/u8x8_display.o.d ${OBJECTDIR}/u8g2/u8x8_fonts.o.d ${OBJECTDIR}/u8g2/u8x8_gpio.o.d ${OBJECTDIR}/u8g2/u8x8_input_value.o.d ${OBJECTDIR}/u8g2/u8x8_message.o.d ${OBJECTDIR}/u8g2/u8x8_selection_list.o.d ${OBJECTDIR}/u8g2/u8x8_setup.o.d ${OBJECTDIR}/u8g2/u8x8_string.o.d ${OBJECTDIR}/u8g2/u8x8_u16toa.o.d ${OBJECTDIR}/u8g2/u8x8_u8toa.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/FrameworkSource/ES_Port.o ${OBJECTDIR}/FrameworkSource/ES_Timers.o ${OBJECTDIR}/FrameworkSource/ES_LookupTables.o ${OBJECTDIR}/FrameworkSource/ES_CheckEvents.o ${OBJECTDIR}/FrameworkSource/ES_DeferRecall.o ${OBJECTDIR}/FrameworkSource/ES_Framework.o ${OBJECTDIR}/FrameworkSource/ES_Queue.o ${OBJECTDIR}/FrameworkSource/ES_PostList.o ${OBJECTDIR}/FrameworkSource/terminal.o ${OBJECTDIR}/ProjectSource/main.o ${OBJECTDIR}/ProjectSource/EventCheckers.o ${OBJECTDIR}/ProjectSource/dbprintf.o ${OBJECTDIR}/ProjectSource/Locomotion.o ${OBJECTDIR}/ProjectSource/LocomotionTestHarness.o ${OBJECTDIR}/u8g2/spi_master.o ${OBJECTDIR}/u8g2/u8g2_bitmap.o ${OBJECTDIR}/u8g2/u8g2_box.o ${OBJECTDIR}/u8g2/u8g2_buffer.o ${OBJECTDIR}/u8g2/u8g2_circle.o ${OBJECTDIR}/u8g2/u8g2_cleardisplay.o ${OBJECTDIR}/u8g2/u8g2_d_memory.o ${OBJECTDIR}/u8g2/u8g2_d_setup.o ${OBJECTDIR}/u8g2/u8g2_font.o ${OBJECTDIR}/u8g2/u8g2_fonts.o ${OBJECTDIR}/u8g2/u8g2_hvline.o ${OBJECTDIR}/u8g2/u8g2_input_value.o ${OBJECTDIR}/u8g2/u8g2_intersection.o ${OBJECTDIR}/u8g2/u8g2_kerning.o ${OBJECTDIR}/u8g2/u8g2_line.o ${OBJECTDIR}/u8g2/u8g2_ll_hvline.o ${OBJECTDIR}/u8g2/u8g2_message.o ${OBJECTDIR}/u8g2/u8g2_pic32mz.o ${OBJECTDIR}/u8g2/u8g2_polygon.o ${OBJECTDIR}/u8g2/u8g2_selection_list.o ${OBJECTDIR}/u8g2/u8g2_setup.o ${OBJECTDIR}/u8g2/u8log.o ${OBJECTDIR}/u8g2/u8log_u8g2.o ${OBJECTDIR}/u8g2/u8log_u8x8.o ${OBJECTDIR}/u8g2/u8x8_8x8.o ${OBJECTDIR}/u8g2/u8x8_byte.o ${OBJECTDIR}/u8g2/u8x8_cad.o ${OBJECTDIR}/u8g2/u8x8_d_ssd1306_128x64_noname.o ${OBJECTDIR}/u8g2/u8x8_debounce.o ${OBJECTDIR}/u8g2/u8x8_display.o ${OBJECTDIR}/u8g2/u8x8_fonts.o ${OBJECTDIR}/u8g2/u8x8_gpio.o ${OBJECTDIR}/u8g2/u8x8_input_value.o ${OBJECTDIR}/u8g2/u8x8_message.o ${OBJECTDIR}/u8g2/u8x8_selection_list.o ${OBJECTDIR}/u8g2/u8x8_setup.o ${OBJECTDIR}/u8g2/u8x8_string.o ${OBJECTDIR}/u8g2/u8x8_u16toa.o ${OBJECTDIR}/u8g2/u8x8_u8toa.o

# Source Files
SOURCEFILES=FrameworkSource/ES_Port.c FrameworkSource/ES_Timers.c FrameworkSource/ES_LookupTables.c FrameworkSource/ES_CheckEvents.c FrameworkSource/ES_DeferRecall.c FrameworkSource/ES_Framework.c FrameworkSource/ES_Queue.c FrameworkSource/ES_PostList.c FrameworkSource/terminal.c ProjectSource/main.c ProjectSource/EventCheckers.c ProjectSource/dbprintf.c ProjectSource/Locomotion.c ProjectSource/LocomotionTestHarness.c u8g2/spi_master.c u8g2/u8g2_bitmap.c u8g2/u8g2_box.c u8g2/u8g2_buffer.c u8g2/u8g2_circle.c u8g2/u8g2_cleardisplay.c u8g2/u8g2_d_memory.c u8g2/u8g2_d_setup.c u8g2/u8g2_font.c u8g2/u8g2_fonts.c u8g2/u8g2_hvline.c u8g2/u8g2_input_value.c u8g2/u8g2_intersection.c u8g2/u8g2_kerning.c u8g2/u8g2_line.c u8g2/u8g2_ll_hvline.c u8g2/u8g2_message.c u8g2/u8g2_pic32mz.c u8g2/u8g2_polygon.c u8g2/u8g2_selection_list.c u8g2/u8g2_setup.c u8g2/u8log.c u8g2/u8log_u8g2.c u8g2/u8log_u8x8.c u8g2/u8x8_8x8.c u8g2/u8x8_byte.c u8g2/u8x8_cad.c u8g2/u8x8_d_ssd1306_128x64_noname.c u8g2/u8x8_debounce.c u8g2/u8x8_display.c u8g2/u8x8_fonts.c u8g2/u8x8_gpio.c u8g2/u8x8_input_value.c u8g2/u8x8_message.c u8g2/u8x8_selection_list.c u8g2/u8x8_setup.c u8g2/u8x8_string.c u8g2/u8x8_u16toa.c u8g2/u8x8_u8toa.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-FrameworkWith_u8g2.mk dist/${CND_CONF}/${IMAGE_TYPE}/Locomotion.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MX170F256B
MP_LINKER_FILE_OPTION=
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/FrameworkSource/ES_Port.o: FrameworkSource/ES_Port.c  .generated_files/2161ae499c841179a0a2148a7e9c4a7bbb2c9dcc.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/FrameworkSource" 
	@${RM} ${OBJECTDIR}/FrameworkSource/ES_Port.o.d 
	@${RM} ${OBJECTDIR}/FrameworkSource/ES_Port.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/FrameworkSource/ES_Port.o.d" -o ${OBJECTDIR}/FrameworkSource/ES_Port.o FrameworkSource/ES_Port.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FrameworkSource/ES_Timers.o: FrameworkSource/ES_Timers.c  .generated_files/91f4a908e38e473f35fb4bb747604bd425f31180.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/FrameworkSource" 
	@${RM} ${OBJECTDIR}/FrameworkSource/ES_Timers.o.d 
	@${RM} ${OBJECTDIR}/FrameworkSource/ES_Timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/FrameworkSource/ES_Timers.o.d" -o ${OBJECTDIR}/FrameworkSource/ES_Timers.o FrameworkSource/ES_Timers.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FrameworkSource/ES_LookupTables.o: FrameworkSource/ES_LookupTables.c  .generated_files/d7947c8c44f7307b89d056da6c53efa579288bf5.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/FrameworkSource" 
	@${RM} ${OBJECTDIR}/FrameworkSource/ES_LookupTables.o.d 
	@${RM} ${OBJECTDIR}/FrameworkSource/ES_LookupTables.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/FrameworkSource/ES_LookupTables.o.d" -o ${OBJECTDIR}/FrameworkSource/ES_LookupTables.o FrameworkSource/ES_LookupTables.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FrameworkSource/ES_CheckEvents.o: FrameworkSource/ES_CheckEvents.c  .generated_files/bd7dcacb567834a65dfd36fe68b663180172f03c.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/FrameworkSource" 
	@${RM} ${OBJECTDIR}/FrameworkSource/ES_CheckEvents.o.d 
	@${RM} ${OBJECTDIR}/FrameworkSource/ES_CheckEvents.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/FrameworkSource/ES_CheckEvents.o.d" -o ${OBJECTDIR}/FrameworkSource/ES_CheckEvents.o FrameworkSource/ES_CheckEvents.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FrameworkSource/ES_DeferRecall.o: FrameworkSource/ES_DeferRecall.c  .generated_files/c172257391ee3bed2cb3d8cd726f0463cccea3cf.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/FrameworkSource" 
	@${RM} ${OBJECTDIR}/FrameworkSource/ES_DeferRecall.o.d 
	@${RM} ${OBJECTDIR}/FrameworkSource/ES_DeferRecall.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/FrameworkSource/ES_DeferRecall.o.d" -o ${OBJECTDIR}/FrameworkSource/ES_DeferRecall.o FrameworkSource/ES_DeferRecall.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FrameworkSource/ES_Framework.o: FrameworkSource/ES_Framework.c  .generated_files/479c6a0188d910c5a52bbc5931b7ef0587e83db6.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/FrameworkSource" 
	@${RM} ${OBJECTDIR}/FrameworkSource/ES_Framework.o.d 
	@${RM} ${OBJECTDIR}/FrameworkSource/ES_Framework.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/FrameworkSource/ES_Framework.o.d" -o ${OBJECTDIR}/FrameworkSource/ES_Framework.o FrameworkSource/ES_Framework.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FrameworkSource/ES_Queue.o: FrameworkSource/ES_Queue.c  .generated_files/b098f3156dc3bd8926ea6e6917d5cb391f1aa4ea.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/FrameworkSource" 
	@${RM} ${OBJECTDIR}/FrameworkSource/ES_Queue.o.d 
	@${RM} ${OBJECTDIR}/FrameworkSource/ES_Queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/FrameworkSource/ES_Queue.o.d" -o ${OBJECTDIR}/FrameworkSource/ES_Queue.o FrameworkSource/ES_Queue.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FrameworkSource/ES_PostList.o: FrameworkSource/ES_PostList.c  .generated_files/bbb1307ee1553273fe7718496d40d96ccbbcc02b.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/FrameworkSource" 
	@${RM} ${OBJECTDIR}/FrameworkSource/ES_PostList.o.d 
	@${RM} ${OBJECTDIR}/FrameworkSource/ES_PostList.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/FrameworkSource/ES_PostList.o.d" -o ${OBJECTDIR}/FrameworkSource/ES_PostList.o FrameworkSource/ES_PostList.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FrameworkSource/terminal.o: FrameworkSource/terminal.c  .generated_files/8e5a9e2b173a9f101b78b4bbbe4856b73ebfac9a.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/FrameworkSource" 
	@${RM} ${OBJECTDIR}/FrameworkSource/terminal.o.d 
	@${RM} ${OBJECTDIR}/FrameworkSource/terminal.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/FrameworkSource/terminal.o.d" -o ${OBJECTDIR}/FrameworkSource/terminal.o FrameworkSource/terminal.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/ProjectSource/main.o: ProjectSource/main.c  .generated_files/6fb713b02f3ccd22b20112c30980027decc0e84d.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/ProjectSource" 
	@${RM} ${OBJECTDIR}/ProjectSource/main.o.d 
	@${RM} ${OBJECTDIR}/ProjectSource/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/ProjectSource/main.o.d" -o ${OBJECTDIR}/ProjectSource/main.o ProjectSource/main.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/ProjectSource/EventCheckers.o: ProjectSource/EventCheckers.c  .generated_files/2649cdb826963d98640172acf429ccb39b9d19c9.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/ProjectSource" 
	@${RM} ${OBJECTDIR}/ProjectSource/EventCheckers.o.d 
	@${RM} ${OBJECTDIR}/ProjectSource/EventCheckers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/ProjectSource/EventCheckers.o.d" -o ${OBJECTDIR}/ProjectSource/EventCheckers.o ProjectSource/EventCheckers.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/ProjectSource/dbprintf.o: ProjectSource/dbprintf.c  .generated_files/c2966cb86b8db5e3f7c8d1928762eddf1438f1db.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/ProjectSource" 
	@${RM} ${OBJECTDIR}/ProjectSource/dbprintf.o.d 
	@${RM} ${OBJECTDIR}/ProjectSource/dbprintf.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/ProjectSource/dbprintf.o.d" -o ${OBJECTDIR}/ProjectSource/dbprintf.o ProjectSource/dbprintf.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/ProjectSource/Locomotion.o: ProjectSource/Locomotion.c  .generated_files/fe5547a8baf729111d537674ff01507deb943d6c.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/ProjectSource" 
	@${RM} ${OBJECTDIR}/ProjectSource/Locomotion.o.d 
	@${RM} ${OBJECTDIR}/ProjectSource/Locomotion.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/ProjectSource/Locomotion.o.d" -o ${OBJECTDIR}/ProjectSource/Locomotion.o ProjectSource/Locomotion.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/ProjectSource/LocomotionTestHarness.o: ProjectSource/LocomotionTestHarness.c  .generated_files/6405ce1508cfd306b8e8a61f035f81f1dbc01065.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/ProjectSource" 
	@${RM} ${OBJECTDIR}/ProjectSource/LocomotionTestHarness.o.d 
	@${RM} ${OBJECTDIR}/ProjectSource/LocomotionTestHarness.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/ProjectSource/LocomotionTestHarness.o.d" -o ${OBJECTDIR}/ProjectSource/LocomotionTestHarness.o ProjectSource/LocomotionTestHarness.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/spi_master.o: u8g2/spi_master.c  .generated_files/f4d5994de19afd87d7f080a03e7d3c95429a9a91.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/spi_master.o.d 
	@${RM} ${OBJECTDIR}/u8g2/spi_master.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/spi_master.o.d" -o ${OBJECTDIR}/u8g2/spi_master.o u8g2/spi_master.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_bitmap.o: u8g2/u8g2_bitmap.c  .generated_files/3cb3dfd7163b8a29e650ddae6e6692e9f3c49539.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_bitmap.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_bitmap.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_bitmap.o.d" -o ${OBJECTDIR}/u8g2/u8g2_bitmap.o u8g2/u8g2_bitmap.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_box.o: u8g2/u8g2_box.c  .generated_files/8333a7247158cadb2c6d18d09271a1b74953a973.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_box.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_box.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_box.o.d" -o ${OBJECTDIR}/u8g2/u8g2_box.o u8g2/u8g2_box.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_buffer.o: u8g2/u8g2_buffer.c  .generated_files/50c66490d83bc0e8aaa089ef37630446e884628d.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_buffer.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_buffer.o.d" -o ${OBJECTDIR}/u8g2/u8g2_buffer.o u8g2/u8g2_buffer.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_circle.o: u8g2/u8g2_circle.c  .generated_files/2997b0fbc5b8f39ae523638b9e66c34d5a4c8ff8.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_circle.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_circle.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_circle.o.d" -o ${OBJECTDIR}/u8g2/u8g2_circle.o u8g2/u8g2_circle.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_cleardisplay.o: u8g2/u8g2_cleardisplay.c  .generated_files/17f113f8f02e0c8b29e183b9a17fd74c0ff13ac1.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_cleardisplay.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_cleardisplay.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_cleardisplay.o.d" -o ${OBJECTDIR}/u8g2/u8g2_cleardisplay.o u8g2/u8g2_cleardisplay.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_d_memory.o: u8g2/u8g2_d_memory.c  .generated_files/1a95402f3eb1c8fc0fccef01e02bc676cb43ad61.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_d_memory.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_d_memory.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_d_memory.o.d" -o ${OBJECTDIR}/u8g2/u8g2_d_memory.o u8g2/u8g2_d_memory.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_d_setup.o: u8g2/u8g2_d_setup.c  .generated_files/c0e7043d6d7ebd9fe1982872f353c214441da468.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_d_setup.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_d_setup.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_d_setup.o.d" -o ${OBJECTDIR}/u8g2/u8g2_d_setup.o u8g2/u8g2_d_setup.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_font.o: u8g2/u8g2_font.c  .generated_files/61ff5f6ae8383aff2a254d6e0717a4cd2c6613fa.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_font.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_font.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_font.o.d" -o ${OBJECTDIR}/u8g2/u8g2_font.o u8g2/u8g2_font.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_fonts.o: u8g2/u8g2_fonts.c  .generated_files/836a4376449f3c6507ce5312a7598d085a88c2d6.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_fonts.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_fonts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_fonts.o.d" -o ${OBJECTDIR}/u8g2/u8g2_fonts.o u8g2/u8g2_fonts.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_hvline.o: u8g2/u8g2_hvline.c  .generated_files/84f896b07bfbc4c95427983c91465e69d90fe1e9.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_hvline.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_hvline.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_hvline.o.d" -o ${OBJECTDIR}/u8g2/u8g2_hvline.o u8g2/u8g2_hvline.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_input_value.o: u8g2/u8g2_input_value.c  .generated_files/28bd55bdb71a58592778339c68e15a09c60e580c.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_input_value.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_input_value.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_input_value.o.d" -o ${OBJECTDIR}/u8g2/u8g2_input_value.o u8g2/u8g2_input_value.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_intersection.o: u8g2/u8g2_intersection.c  .generated_files/4291a599616477bb43ef86195ccae6079f2aeecf.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_intersection.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_intersection.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_intersection.o.d" -o ${OBJECTDIR}/u8g2/u8g2_intersection.o u8g2/u8g2_intersection.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_kerning.o: u8g2/u8g2_kerning.c  .generated_files/3c2729b6a75166b8588199ea1a3f4b8b59382bc8.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_kerning.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_kerning.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_kerning.o.d" -o ${OBJECTDIR}/u8g2/u8g2_kerning.o u8g2/u8g2_kerning.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_line.o: u8g2/u8g2_line.c  .generated_files/19ee9b6cb8aa6b74d4b2b7d64bade3bd45b42f61.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_line.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_line.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_line.o.d" -o ${OBJECTDIR}/u8g2/u8g2_line.o u8g2/u8g2_line.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_ll_hvline.o: u8g2/u8g2_ll_hvline.c  .generated_files/a4f5997016bc888bcccf6dd359640233f8bf3195.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_ll_hvline.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_ll_hvline.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_ll_hvline.o.d" -o ${OBJECTDIR}/u8g2/u8g2_ll_hvline.o u8g2/u8g2_ll_hvline.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_message.o: u8g2/u8g2_message.c  .generated_files/9fc2b1b2671bc4b76348303a32775b181769db4f.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_message.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_message.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_message.o.d" -o ${OBJECTDIR}/u8g2/u8g2_message.o u8g2/u8g2_message.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_pic32mz.o: u8g2/u8g2_pic32mz.c  .generated_files/7dd34ae423554a2e086d0591784a09f851287724.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_pic32mz.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_pic32mz.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_pic32mz.o.d" -o ${OBJECTDIR}/u8g2/u8g2_pic32mz.o u8g2/u8g2_pic32mz.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_polygon.o: u8g2/u8g2_polygon.c  .generated_files/a2ae6b2ea493b374933af1f3791002cb87379b06.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_polygon.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_polygon.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_polygon.o.d" -o ${OBJECTDIR}/u8g2/u8g2_polygon.o u8g2/u8g2_polygon.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_selection_list.o: u8g2/u8g2_selection_list.c  .generated_files/4ec0998fab68961016306287f9e86f0c26abcfa3.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_selection_list.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_selection_list.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_selection_list.o.d" -o ${OBJECTDIR}/u8g2/u8g2_selection_list.o u8g2/u8g2_selection_list.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_setup.o: u8g2/u8g2_setup.c  .generated_files/946b40a2049b26fe9295c14c0d014e21a0297191.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_setup.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_setup.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_setup.o.d" -o ${OBJECTDIR}/u8g2/u8g2_setup.o u8g2/u8g2_setup.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8log.o: u8g2/u8log.c  .generated_files/d3a83fab20ed6c23b0808e41be01a363339bd276.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8log.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8log.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8log.o.d" -o ${OBJECTDIR}/u8g2/u8log.o u8g2/u8log.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8log_u8g2.o: u8g2/u8log_u8g2.c  .generated_files/17807692298266abdc9b38a6edf9487f3acb2d05.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8log_u8g2.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8log_u8g2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8log_u8g2.o.d" -o ${OBJECTDIR}/u8g2/u8log_u8g2.o u8g2/u8log_u8g2.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8log_u8x8.o: u8g2/u8log_u8x8.c  .generated_files/558d44c0d1d840b29e46be0ce70f75805753f2a0.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8log_u8x8.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8log_u8x8.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8log_u8x8.o.d" -o ${OBJECTDIR}/u8g2/u8log_u8x8.o u8g2/u8log_u8x8.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8x8_8x8.o: u8g2/u8x8_8x8.c  .generated_files/fbfbdbdd7ee6493b59124225b73b6b43c4606167.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_8x8.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_8x8.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8x8_8x8.o.d" -o ${OBJECTDIR}/u8g2/u8x8_8x8.o u8g2/u8x8_8x8.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8x8_byte.o: u8g2/u8x8_byte.c  .generated_files/64112a333b49df5e8859da40dd5d2cb143a70af9.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_byte.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_byte.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8x8_byte.o.d" -o ${OBJECTDIR}/u8g2/u8x8_byte.o u8g2/u8x8_byte.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8x8_cad.o: u8g2/u8x8_cad.c  .generated_files/868b5751d7a975850ade8a77deab966823dbcb3.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_cad.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_cad.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8x8_cad.o.d" -o ${OBJECTDIR}/u8g2/u8x8_cad.o u8g2/u8x8_cad.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8x8_d_ssd1306_128x64_noname.o: u8g2/u8x8_d_ssd1306_128x64_noname.c  .generated_files/b0a3ae6c28e788c50c2ac668c8a518fbae02e989.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1306_128x64_noname.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1306_128x64_noname.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_ssd1306_128x64_noname.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_ssd1306_128x64_noname.o u8g2/u8x8_d_ssd1306_128x64_noname.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8x8_debounce.o: u8g2/u8x8_debounce.c  .generated_files/a87f53d99a242c0439174d9b3a0afc7534b3c99a.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_debounce.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_debounce.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8x8_debounce.o.d" -o ${OBJECTDIR}/u8g2/u8x8_debounce.o u8g2/u8x8_debounce.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8x8_display.o: u8g2/u8x8_display.c  .generated_files/2c60854d3cdcf00c8c6689c62160e26105b6c95e.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_display.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_display.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8x8_display.o.d" -o ${OBJECTDIR}/u8g2/u8x8_display.o u8g2/u8x8_display.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8x8_fonts.o: u8g2/u8x8_fonts.c  .generated_files/cb4e7367a721ac24af935b5d2352e07a251e4f3e.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_fonts.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_fonts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8x8_fonts.o.d" -o ${OBJECTDIR}/u8g2/u8x8_fonts.o u8g2/u8x8_fonts.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8x8_gpio.o: u8g2/u8x8_gpio.c  .generated_files/3f119aadc74cbcd3a6d571bd6b3e2af1179fe9b1.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_gpio.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8x8_gpio.o.d" -o ${OBJECTDIR}/u8g2/u8x8_gpio.o u8g2/u8x8_gpio.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8x8_input_value.o: u8g2/u8x8_input_value.c  .generated_files/3db79b0874cb560bba9ada0c93bade45185155d9.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_input_value.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_input_value.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8x8_input_value.o.d" -o ${OBJECTDIR}/u8g2/u8x8_input_value.o u8g2/u8x8_input_value.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8x8_message.o: u8g2/u8x8_message.c  .generated_files/d485269524d155e1a49c6a6d65946dc4bf7c1396.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_message.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_message.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8x8_message.o.d" -o ${OBJECTDIR}/u8g2/u8x8_message.o u8g2/u8x8_message.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8x8_selection_list.o: u8g2/u8x8_selection_list.c  .generated_files/4d0d208999de53cd4c36c35b1fb411fc97016ee8.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_selection_list.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_selection_list.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8x8_selection_list.o.d" -o ${OBJECTDIR}/u8g2/u8x8_selection_list.o u8g2/u8x8_selection_list.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8x8_setup.o: u8g2/u8x8_setup.c  .generated_files/58f82f8cb5fb05decc5538dee3c82992c593dffd.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_setup.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_setup.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8x8_setup.o.d" -o ${OBJECTDIR}/u8g2/u8x8_setup.o u8g2/u8x8_setup.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8x8_string.o: u8g2/u8x8_string.c  .generated_files/66ba49a15e912728e441ce8b93bc9b3055fd54d3.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_string.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_string.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8x8_string.o.d" -o ${OBJECTDIR}/u8g2/u8x8_string.o u8g2/u8x8_string.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8x8_u16toa.o: u8g2/u8x8_u16toa.c  .generated_files/1084f9adeaff778822aff0210babbd8b594dc052.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_u16toa.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_u16toa.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8x8_u16toa.o.d" -o ${OBJECTDIR}/u8g2/u8x8_u16toa.o u8g2/u8x8_u16toa.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8x8_u8toa.o: u8g2/u8x8_u8toa.c  .generated_files/93e711a4ff247b44ed00782dbb0f3c3d303a3bfc.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_u8toa.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_u8toa.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8x8_u8toa.o.d" -o ${OBJECTDIR}/u8g2/u8x8_u8toa.o u8g2/u8x8_u8toa.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/FrameworkSource/ES_Port.o: FrameworkSource/ES_Port.c  .generated_files/8c8d6772a23fc6e072170ead3c3f1b3134201b71.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/FrameworkSource" 
	@${RM} ${OBJECTDIR}/FrameworkSource/ES_Port.o.d 
	@${RM} ${OBJECTDIR}/FrameworkSource/ES_Port.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/FrameworkSource/ES_Port.o.d" -o ${OBJECTDIR}/FrameworkSource/ES_Port.o FrameworkSource/ES_Port.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FrameworkSource/ES_Timers.o: FrameworkSource/ES_Timers.c  .generated_files/2fd5a8abf998b6ac20cbbf6efec9ac25392650ff.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/FrameworkSource" 
	@${RM} ${OBJECTDIR}/FrameworkSource/ES_Timers.o.d 
	@${RM} ${OBJECTDIR}/FrameworkSource/ES_Timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/FrameworkSource/ES_Timers.o.d" -o ${OBJECTDIR}/FrameworkSource/ES_Timers.o FrameworkSource/ES_Timers.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FrameworkSource/ES_LookupTables.o: FrameworkSource/ES_LookupTables.c  .generated_files/955470f3c1c3d821be4e741ae33f01bd5502ac44.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/FrameworkSource" 
	@${RM} ${OBJECTDIR}/FrameworkSource/ES_LookupTables.o.d 
	@${RM} ${OBJECTDIR}/FrameworkSource/ES_LookupTables.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/FrameworkSource/ES_LookupTables.o.d" -o ${OBJECTDIR}/FrameworkSource/ES_LookupTables.o FrameworkSource/ES_LookupTables.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FrameworkSource/ES_CheckEvents.o: FrameworkSource/ES_CheckEvents.c  .generated_files/81816cd5ab913386c191dec89157defb835e0bf.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/FrameworkSource" 
	@${RM} ${OBJECTDIR}/FrameworkSource/ES_CheckEvents.o.d 
	@${RM} ${OBJECTDIR}/FrameworkSource/ES_CheckEvents.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/FrameworkSource/ES_CheckEvents.o.d" -o ${OBJECTDIR}/FrameworkSource/ES_CheckEvents.o FrameworkSource/ES_CheckEvents.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FrameworkSource/ES_DeferRecall.o: FrameworkSource/ES_DeferRecall.c  .generated_files/53f6ce9480de20a7ccf226fec2797748f3cadea0.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/FrameworkSource" 
	@${RM} ${OBJECTDIR}/FrameworkSource/ES_DeferRecall.o.d 
	@${RM} ${OBJECTDIR}/FrameworkSource/ES_DeferRecall.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/FrameworkSource/ES_DeferRecall.o.d" -o ${OBJECTDIR}/FrameworkSource/ES_DeferRecall.o FrameworkSource/ES_DeferRecall.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FrameworkSource/ES_Framework.o: FrameworkSource/ES_Framework.c  .generated_files/a4c550cdad4262b4310aca76fdbe34dca6d9a7fd.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/FrameworkSource" 
	@${RM} ${OBJECTDIR}/FrameworkSource/ES_Framework.o.d 
	@${RM} ${OBJECTDIR}/FrameworkSource/ES_Framework.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/FrameworkSource/ES_Framework.o.d" -o ${OBJECTDIR}/FrameworkSource/ES_Framework.o FrameworkSource/ES_Framework.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FrameworkSource/ES_Queue.o: FrameworkSource/ES_Queue.c  .generated_files/9fd6e6efd01967714afadac44dd830b9c2578ec.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/FrameworkSource" 
	@${RM} ${OBJECTDIR}/FrameworkSource/ES_Queue.o.d 
	@${RM} ${OBJECTDIR}/FrameworkSource/ES_Queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/FrameworkSource/ES_Queue.o.d" -o ${OBJECTDIR}/FrameworkSource/ES_Queue.o FrameworkSource/ES_Queue.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FrameworkSource/ES_PostList.o: FrameworkSource/ES_PostList.c  .generated_files/ee054ea2c874fd861a4cc8bf42195e7c5acb7d49.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/FrameworkSource" 
	@${RM} ${OBJECTDIR}/FrameworkSource/ES_PostList.o.d 
	@${RM} ${OBJECTDIR}/FrameworkSource/ES_PostList.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/FrameworkSource/ES_PostList.o.d" -o ${OBJECTDIR}/FrameworkSource/ES_PostList.o FrameworkSource/ES_PostList.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FrameworkSource/terminal.o: FrameworkSource/terminal.c  .generated_files/19b6a4f16f3773822d90e266d7a5e5610c91e440.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/FrameworkSource" 
	@${RM} ${OBJECTDIR}/FrameworkSource/terminal.o.d 
	@${RM} ${OBJECTDIR}/FrameworkSource/terminal.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/FrameworkSource/terminal.o.d" -o ${OBJECTDIR}/FrameworkSource/terminal.o FrameworkSource/terminal.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/ProjectSource/main.o: ProjectSource/main.c  .generated_files/fa95ec59450cc066ad5a60c9201bff3aca106cf1.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/ProjectSource" 
	@${RM} ${OBJECTDIR}/ProjectSource/main.o.d 
	@${RM} ${OBJECTDIR}/ProjectSource/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/ProjectSource/main.o.d" -o ${OBJECTDIR}/ProjectSource/main.o ProjectSource/main.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/ProjectSource/EventCheckers.o: ProjectSource/EventCheckers.c  .generated_files/df8042d42589b3ba429d25c103b64402e29d48c2.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/ProjectSource" 
	@${RM} ${OBJECTDIR}/ProjectSource/EventCheckers.o.d 
	@${RM} ${OBJECTDIR}/ProjectSource/EventCheckers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/ProjectSource/EventCheckers.o.d" -o ${OBJECTDIR}/ProjectSource/EventCheckers.o ProjectSource/EventCheckers.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/ProjectSource/dbprintf.o: ProjectSource/dbprintf.c  .generated_files/7397b6096f340ad170d561f93d9be9bb1a62eb26.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/ProjectSource" 
	@${RM} ${OBJECTDIR}/ProjectSource/dbprintf.o.d 
	@${RM} ${OBJECTDIR}/ProjectSource/dbprintf.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/ProjectSource/dbprintf.o.d" -o ${OBJECTDIR}/ProjectSource/dbprintf.o ProjectSource/dbprintf.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/ProjectSource/Locomotion.o: ProjectSource/Locomotion.c  .generated_files/333e1543fbdbedbcb983e6d8ba2d072ed2d22f09.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/ProjectSource" 
	@${RM} ${OBJECTDIR}/ProjectSource/Locomotion.o.d 
	@${RM} ${OBJECTDIR}/ProjectSource/Locomotion.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/ProjectSource/Locomotion.o.d" -o ${OBJECTDIR}/ProjectSource/Locomotion.o ProjectSource/Locomotion.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/ProjectSource/LocomotionTestHarness.o: ProjectSource/LocomotionTestHarness.c  .generated_files/acc7120948df18e68960099a146c29c4376d8473.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/ProjectSource" 
	@${RM} ${OBJECTDIR}/ProjectSource/LocomotionTestHarness.o.d 
	@${RM} ${OBJECTDIR}/ProjectSource/LocomotionTestHarness.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/ProjectSource/LocomotionTestHarness.o.d" -o ${OBJECTDIR}/ProjectSource/LocomotionTestHarness.o ProjectSource/LocomotionTestHarness.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/spi_master.o: u8g2/spi_master.c  .generated_files/5130f0f8c9f41394043f1df91893e51702c9a325.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/spi_master.o.d 
	@${RM} ${OBJECTDIR}/u8g2/spi_master.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/spi_master.o.d" -o ${OBJECTDIR}/u8g2/spi_master.o u8g2/spi_master.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_bitmap.o: u8g2/u8g2_bitmap.c  .generated_files/cbde9c4c23a6a9cf42805c3a0c90ddab6da9d994.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_bitmap.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_bitmap.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_bitmap.o.d" -o ${OBJECTDIR}/u8g2/u8g2_bitmap.o u8g2/u8g2_bitmap.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_box.o: u8g2/u8g2_box.c  .generated_files/d4adb2ed8580e9caa4f1b42a031f5cca7f68425d.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_box.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_box.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_box.o.d" -o ${OBJECTDIR}/u8g2/u8g2_box.o u8g2/u8g2_box.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_buffer.o: u8g2/u8g2_buffer.c  .generated_files/f26ec0991e38abc3d6a00bfc8416fbeacf50234d.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_buffer.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_buffer.o.d" -o ${OBJECTDIR}/u8g2/u8g2_buffer.o u8g2/u8g2_buffer.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_circle.o: u8g2/u8g2_circle.c  .generated_files/e4105f2d520832badebb6f5cb33a3a76974e1926.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_circle.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_circle.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_circle.o.d" -o ${OBJECTDIR}/u8g2/u8g2_circle.o u8g2/u8g2_circle.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_cleardisplay.o: u8g2/u8g2_cleardisplay.c  .generated_files/582faf80748d111e77151773bf49776236308f70.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_cleardisplay.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_cleardisplay.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_cleardisplay.o.d" -o ${OBJECTDIR}/u8g2/u8g2_cleardisplay.o u8g2/u8g2_cleardisplay.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_d_memory.o: u8g2/u8g2_d_memory.c  .generated_files/76a85ae0e49d36050d498e0e33e38b362e22c.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_d_memory.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_d_memory.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_d_memory.o.d" -o ${OBJECTDIR}/u8g2/u8g2_d_memory.o u8g2/u8g2_d_memory.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_d_setup.o: u8g2/u8g2_d_setup.c  .generated_files/a2940b03d22d98c118fb1baf8fae5d5e201b5551.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_d_setup.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_d_setup.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_d_setup.o.d" -o ${OBJECTDIR}/u8g2/u8g2_d_setup.o u8g2/u8g2_d_setup.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_font.o: u8g2/u8g2_font.c  .generated_files/f5699fe071eb78369417293c98f00d03cd1300b.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_font.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_font.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_font.o.d" -o ${OBJECTDIR}/u8g2/u8g2_font.o u8g2/u8g2_font.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_fonts.o: u8g2/u8g2_fonts.c  .generated_files/e465747113ee70b8b76bd2567eb566c8eb8f56aa.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_fonts.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_fonts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_fonts.o.d" -o ${OBJECTDIR}/u8g2/u8g2_fonts.o u8g2/u8g2_fonts.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_hvline.o: u8g2/u8g2_hvline.c  .generated_files/65e80231272fb913c354cee9c5e18a73e4e2384a.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_hvline.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_hvline.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_hvline.o.d" -o ${OBJECTDIR}/u8g2/u8g2_hvline.o u8g2/u8g2_hvline.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_input_value.o: u8g2/u8g2_input_value.c  .generated_files/202ec30366202f70a5de2855682a948d880a1f7f.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_input_value.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_input_value.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_input_value.o.d" -o ${OBJECTDIR}/u8g2/u8g2_input_value.o u8g2/u8g2_input_value.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_intersection.o: u8g2/u8g2_intersection.c  .generated_files/74bf51ea19b6f96e260e03f832d292553b9b02ff.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_intersection.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_intersection.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_intersection.o.d" -o ${OBJECTDIR}/u8g2/u8g2_intersection.o u8g2/u8g2_intersection.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_kerning.o: u8g2/u8g2_kerning.c  .generated_files/dea3f21eb2ed17aa45924caa997c7e2f982bc6f4.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_kerning.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_kerning.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_kerning.o.d" -o ${OBJECTDIR}/u8g2/u8g2_kerning.o u8g2/u8g2_kerning.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_line.o: u8g2/u8g2_line.c  .generated_files/cf4eece4e5d8e1f27f1769038046c97244165656.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_line.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_line.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_line.o.d" -o ${OBJECTDIR}/u8g2/u8g2_line.o u8g2/u8g2_line.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_ll_hvline.o: u8g2/u8g2_ll_hvline.c  .generated_files/f1ebfe794b24aa32761337348f2f5b213303d459.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_ll_hvline.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_ll_hvline.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_ll_hvline.o.d" -o ${OBJECTDIR}/u8g2/u8g2_ll_hvline.o u8g2/u8g2_ll_hvline.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_message.o: u8g2/u8g2_message.c  .generated_files/789c6e32890b12f674aa2e534b6293751e0df552.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_message.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_message.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_message.o.d" -o ${OBJECTDIR}/u8g2/u8g2_message.o u8g2/u8g2_message.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_pic32mz.o: u8g2/u8g2_pic32mz.c  .generated_files/f22fed510222ddbfcd6d26d22f5665720a183c0a.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_pic32mz.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_pic32mz.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_pic32mz.o.d" -o ${OBJECTDIR}/u8g2/u8g2_pic32mz.o u8g2/u8g2_pic32mz.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_polygon.o: u8g2/u8g2_polygon.c  .generated_files/fe50a9ae3efb795ecd573a825b42645b88f18cea.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_polygon.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_polygon.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_polygon.o.d" -o ${OBJECTDIR}/u8g2/u8g2_polygon.o u8g2/u8g2_polygon.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_selection_list.o: u8g2/u8g2_selection_list.c  .generated_files/12261682895c89f16833a31c3b0a18a5d93f9332.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_selection_list.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_selection_list.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_selection_list.o.d" -o ${OBJECTDIR}/u8g2/u8g2_selection_list.o u8g2/u8g2_selection_list.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_setup.o: u8g2/u8g2_setup.c  .generated_files/3350378df861e4870fb1d1bdb5ede144d9d5183a.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_setup.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_setup.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_setup.o.d" -o ${OBJECTDIR}/u8g2/u8g2_setup.o u8g2/u8g2_setup.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8log.o: u8g2/u8log.c  .generated_files/20ef50e4f318681f2ffbd4957a30151aebe3abd3.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8log.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8log.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8log.o.d" -o ${OBJECTDIR}/u8g2/u8log.o u8g2/u8log.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8log_u8g2.o: u8g2/u8log_u8g2.c  .generated_files/c9bacaf8bb2e32e8166d9eb8fbac9dda2ba45a06.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8log_u8g2.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8log_u8g2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8log_u8g2.o.d" -o ${OBJECTDIR}/u8g2/u8log_u8g2.o u8g2/u8log_u8g2.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8log_u8x8.o: u8g2/u8log_u8x8.c  .generated_files/cca7564e7c6f24727ca5dde5fe9c75ba7560aab3.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8log_u8x8.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8log_u8x8.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8log_u8x8.o.d" -o ${OBJECTDIR}/u8g2/u8log_u8x8.o u8g2/u8log_u8x8.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8x8_8x8.o: u8g2/u8x8_8x8.c  .generated_files/52c96de716d21dcd2931420ccaefc5619f138785.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_8x8.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_8x8.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8x8_8x8.o.d" -o ${OBJECTDIR}/u8g2/u8x8_8x8.o u8g2/u8x8_8x8.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8x8_byte.o: u8g2/u8x8_byte.c  .generated_files/1f10f69a92ef0ddf433bf3c2850e544cdd5a4de4.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_byte.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_byte.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8x8_byte.o.d" -o ${OBJECTDIR}/u8g2/u8x8_byte.o u8g2/u8x8_byte.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8x8_cad.o: u8g2/u8x8_cad.c  .generated_files/fba1e0c8eb8d754fa5bcca9ac32bb2e5be7c2fd6.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_cad.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_cad.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8x8_cad.o.d" -o ${OBJECTDIR}/u8g2/u8x8_cad.o u8g2/u8x8_cad.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8x8_d_ssd1306_128x64_noname.o: u8g2/u8x8_d_ssd1306_128x64_noname.c  .generated_files/ceae9062d0ea360fe4118afd77ea1e99dd9c652a.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1306_128x64_noname.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1306_128x64_noname.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_ssd1306_128x64_noname.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_ssd1306_128x64_noname.o u8g2/u8x8_d_ssd1306_128x64_noname.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8x8_debounce.o: u8g2/u8x8_debounce.c  .generated_files/33c3029fdac3c5a19ec3df365e812512dadd0097.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_debounce.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_debounce.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8x8_debounce.o.d" -o ${OBJECTDIR}/u8g2/u8x8_debounce.o u8g2/u8x8_debounce.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8x8_display.o: u8g2/u8x8_display.c  .generated_files/42f9fdf54f361f712afe6a1619872544bac1694f.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_display.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_display.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8x8_display.o.d" -o ${OBJECTDIR}/u8g2/u8x8_display.o u8g2/u8x8_display.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8x8_fonts.o: u8g2/u8x8_fonts.c  .generated_files/e584f389186049d9c39b51278e752368a41b2b8a.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_fonts.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_fonts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8x8_fonts.o.d" -o ${OBJECTDIR}/u8g2/u8x8_fonts.o u8g2/u8x8_fonts.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8x8_gpio.o: u8g2/u8x8_gpio.c  .generated_files/87dca392163f8ffa662f12269c81e0a91805f943.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_gpio.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8x8_gpio.o.d" -o ${OBJECTDIR}/u8g2/u8x8_gpio.o u8g2/u8x8_gpio.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8x8_input_value.o: u8g2/u8x8_input_value.c  .generated_files/9ddf7dff6cad7ee5fe2561d00b561c2acdcd224.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_input_value.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_input_value.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8x8_input_value.o.d" -o ${OBJECTDIR}/u8g2/u8x8_input_value.o u8g2/u8x8_input_value.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8x8_message.o: u8g2/u8x8_message.c  .generated_files/68d2dbade06aba752e60aa6a8b9fd5a43dfac995.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_message.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_message.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8x8_message.o.d" -o ${OBJECTDIR}/u8g2/u8x8_message.o u8g2/u8x8_message.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8x8_selection_list.o: u8g2/u8x8_selection_list.c  .generated_files/f2e9e1638eeefa8cb6e72b35a70315988275be11.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_selection_list.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_selection_list.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8x8_selection_list.o.d" -o ${OBJECTDIR}/u8g2/u8x8_selection_list.o u8g2/u8x8_selection_list.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8x8_setup.o: u8g2/u8x8_setup.c  .generated_files/91f347c6b96b6c48e26e66c59e5c9d3349fcc27d.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_setup.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_setup.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8x8_setup.o.d" -o ${OBJECTDIR}/u8g2/u8x8_setup.o u8g2/u8x8_setup.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8x8_string.o: u8g2/u8x8_string.c  .generated_files/d4dbffdc7b4658c41da174f6a66274ff7eb7014c.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_string.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_string.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8x8_string.o.d" -o ${OBJECTDIR}/u8g2/u8x8_string.o u8g2/u8x8_string.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8x8_u16toa.o: u8g2/u8x8_u16toa.c  .generated_files/590e46e8678c7f84ec5b5fc302d5ca955ea3fedb.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_u16toa.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_u16toa.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8x8_u16toa.o.d" -o ${OBJECTDIR}/u8g2/u8x8_u16toa.o u8g2/u8x8_u16toa.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8x8_u8toa.o: u8g2/u8x8_u8toa.c  .generated_files/577814f7f06ab36e3f409b266c01ab13f7cf0bae.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_u8toa.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_u8toa.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8x8_u8toa.o.d" -o ${OBJECTDIR}/u8g2/u8x8_u8toa.o u8g2/u8x8_u8toa.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/Locomotion.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/Locomotion.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  -std=gnu99 $(COMPARISON_BUILD)   -mreserve=data@0x0:0x1FC -mreserve=boot@0x1FC00490:0x1FC00BEF  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/Locomotion.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/Locomotion.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  -std=gnu99 $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -mdfp="${DFP_DIR}"
	${MP_CC_DIR}\\xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/Locomotion.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/FrameworkWith_u8g2
	${RM} -r dist/FrameworkWith_u8g2

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
