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
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/InfraredPIC.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/InfraredPIC.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
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
SOURCEFILES_QUOTED_IF_SPACED=FrameworkSource/ES_Port.c FrameworkSource/ES_Timers.c FrameworkSource/ES_LookupTables.c FrameworkSource/ES_CheckEvents.c FrameworkSource/ES_DeferRecall.c FrameworkSource/ES_Framework.c FrameworkSource/ES_Queue.c FrameworkSource/ES_PostList.c FrameworkSource/terminal.c ProjectSource/main.c ProjectSource/EventCheckers.c ProjectSource/dbprintf.c ProjectSource/IR.c ProjectSource/Queue.c u8g2/spi_master.c u8g2/u8g2_bitmap.c u8g2/u8g2_box.c u8g2/u8g2_buffer.c u8g2/u8g2_circle.c u8g2/u8g2_cleardisplay.c u8g2/u8g2_d_memory.c u8g2/u8g2_d_setup.c u8g2/u8g2_font.c u8g2/u8g2_fonts.c u8g2/u8g2_hvline.c u8g2/u8g2_input_value.c u8g2/u8g2_intersection.c u8g2/u8g2_kerning.c u8g2/u8g2_line.c u8g2/u8g2_ll_hvline.c u8g2/u8g2_message.c u8g2/u8g2_pic32mz.c u8g2/u8g2_polygon.c u8g2/u8g2_selection_list.c u8g2/u8g2_setup.c u8g2/u8log.c u8g2/u8log_u8g2.c u8g2/u8log_u8x8.c u8g2/u8x8_8x8.c u8g2/u8x8_byte.c u8g2/u8x8_cad.c u8g2/u8x8_d_ssd1306_128x64_noname.c u8g2/u8x8_debounce.c u8g2/u8x8_display.c u8g2/u8x8_fonts.c u8g2/u8x8_gpio.c u8g2/u8x8_input_value.c u8g2/u8x8_message.c u8g2/u8x8_selection_list.c u8g2/u8x8_setup.c u8g2/u8x8_string.c u8g2/u8x8_u16toa.c u8g2/u8x8_u8toa.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/FrameworkSource/ES_Port.o ${OBJECTDIR}/FrameworkSource/ES_Timers.o ${OBJECTDIR}/FrameworkSource/ES_LookupTables.o ${OBJECTDIR}/FrameworkSource/ES_CheckEvents.o ${OBJECTDIR}/FrameworkSource/ES_DeferRecall.o ${OBJECTDIR}/FrameworkSource/ES_Framework.o ${OBJECTDIR}/FrameworkSource/ES_Queue.o ${OBJECTDIR}/FrameworkSource/ES_PostList.o ${OBJECTDIR}/FrameworkSource/terminal.o ${OBJECTDIR}/ProjectSource/main.o ${OBJECTDIR}/ProjectSource/EventCheckers.o ${OBJECTDIR}/ProjectSource/dbprintf.o ${OBJECTDIR}/ProjectSource/IR.o ${OBJECTDIR}/ProjectSource/Queue.o ${OBJECTDIR}/u8g2/spi_master.o ${OBJECTDIR}/u8g2/u8g2_bitmap.o ${OBJECTDIR}/u8g2/u8g2_box.o ${OBJECTDIR}/u8g2/u8g2_buffer.o ${OBJECTDIR}/u8g2/u8g2_circle.o ${OBJECTDIR}/u8g2/u8g2_cleardisplay.o ${OBJECTDIR}/u8g2/u8g2_d_memory.o ${OBJECTDIR}/u8g2/u8g2_d_setup.o ${OBJECTDIR}/u8g2/u8g2_font.o ${OBJECTDIR}/u8g2/u8g2_fonts.o ${OBJECTDIR}/u8g2/u8g2_hvline.o ${OBJECTDIR}/u8g2/u8g2_input_value.o ${OBJECTDIR}/u8g2/u8g2_intersection.o ${OBJECTDIR}/u8g2/u8g2_kerning.o ${OBJECTDIR}/u8g2/u8g2_line.o ${OBJECTDIR}/u8g2/u8g2_ll_hvline.o ${OBJECTDIR}/u8g2/u8g2_message.o ${OBJECTDIR}/u8g2/u8g2_pic32mz.o ${OBJECTDIR}/u8g2/u8g2_polygon.o ${OBJECTDIR}/u8g2/u8g2_selection_list.o ${OBJECTDIR}/u8g2/u8g2_setup.o ${OBJECTDIR}/u8g2/u8log.o ${OBJECTDIR}/u8g2/u8log_u8g2.o ${OBJECTDIR}/u8g2/u8log_u8x8.o ${OBJECTDIR}/u8g2/u8x8_8x8.o ${OBJECTDIR}/u8g2/u8x8_byte.o ${OBJECTDIR}/u8g2/u8x8_cad.o ${OBJECTDIR}/u8g2/u8x8_d_ssd1306_128x64_noname.o ${OBJECTDIR}/u8g2/u8x8_debounce.o ${OBJECTDIR}/u8g2/u8x8_display.o ${OBJECTDIR}/u8g2/u8x8_fonts.o ${OBJECTDIR}/u8g2/u8x8_gpio.o ${OBJECTDIR}/u8g2/u8x8_input_value.o ${OBJECTDIR}/u8g2/u8x8_message.o ${OBJECTDIR}/u8g2/u8x8_selection_list.o ${OBJECTDIR}/u8g2/u8x8_setup.o ${OBJECTDIR}/u8g2/u8x8_string.o ${OBJECTDIR}/u8g2/u8x8_u16toa.o ${OBJECTDIR}/u8g2/u8x8_u8toa.o
POSSIBLE_DEPFILES=${OBJECTDIR}/FrameworkSource/ES_Port.o.d ${OBJECTDIR}/FrameworkSource/ES_Timers.o.d ${OBJECTDIR}/FrameworkSource/ES_LookupTables.o.d ${OBJECTDIR}/FrameworkSource/ES_CheckEvents.o.d ${OBJECTDIR}/FrameworkSource/ES_DeferRecall.o.d ${OBJECTDIR}/FrameworkSource/ES_Framework.o.d ${OBJECTDIR}/FrameworkSource/ES_Queue.o.d ${OBJECTDIR}/FrameworkSource/ES_PostList.o.d ${OBJECTDIR}/FrameworkSource/terminal.o.d ${OBJECTDIR}/ProjectSource/main.o.d ${OBJECTDIR}/ProjectSource/EventCheckers.o.d ${OBJECTDIR}/ProjectSource/dbprintf.o.d ${OBJECTDIR}/ProjectSource/IR.o.d ${OBJECTDIR}/ProjectSource/Queue.o.d ${OBJECTDIR}/u8g2/spi_master.o.d ${OBJECTDIR}/u8g2/u8g2_bitmap.o.d ${OBJECTDIR}/u8g2/u8g2_box.o.d ${OBJECTDIR}/u8g2/u8g2_buffer.o.d ${OBJECTDIR}/u8g2/u8g2_circle.o.d ${OBJECTDIR}/u8g2/u8g2_cleardisplay.o.d ${OBJECTDIR}/u8g2/u8g2_d_memory.o.d ${OBJECTDIR}/u8g2/u8g2_d_setup.o.d ${OBJECTDIR}/u8g2/u8g2_font.o.d ${OBJECTDIR}/u8g2/u8g2_fonts.o.d ${OBJECTDIR}/u8g2/u8g2_hvline.o.d ${OBJECTDIR}/u8g2/u8g2_input_value.o.d ${OBJECTDIR}/u8g2/u8g2_intersection.o.d ${OBJECTDIR}/u8g2/u8g2_kerning.o.d ${OBJECTDIR}/u8g2/u8g2_line.o.d ${OBJECTDIR}/u8g2/u8g2_ll_hvline.o.d ${OBJECTDIR}/u8g2/u8g2_message.o.d ${OBJECTDIR}/u8g2/u8g2_pic32mz.o.d ${OBJECTDIR}/u8g2/u8g2_polygon.o.d ${OBJECTDIR}/u8g2/u8g2_selection_list.o.d ${OBJECTDIR}/u8g2/u8g2_setup.o.d ${OBJECTDIR}/u8g2/u8log.o.d ${OBJECTDIR}/u8g2/u8log_u8g2.o.d ${OBJECTDIR}/u8g2/u8log_u8x8.o.d ${OBJECTDIR}/u8g2/u8x8_8x8.o.d ${OBJECTDIR}/u8g2/u8x8_byte.o.d ${OBJECTDIR}/u8g2/u8x8_cad.o.d ${OBJECTDIR}/u8g2/u8x8_d_ssd1306_128x64_noname.o.d ${OBJECTDIR}/u8g2/u8x8_debounce.o.d ${OBJECTDIR}/u8g2/u8x8_display.o.d ${OBJECTDIR}/u8g2/u8x8_fonts.o.d ${OBJECTDIR}/u8g2/u8x8_gpio.o.d ${OBJECTDIR}/u8g2/u8x8_input_value.o.d ${OBJECTDIR}/u8g2/u8x8_message.o.d ${OBJECTDIR}/u8g2/u8x8_selection_list.o.d ${OBJECTDIR}/u8g2/u8x8_setup.o.d ${OBJECTDIR}/u8g2/u8x8_string.o.d ${OBJECTDIR}/u8g2/u8x8_u16toa.o.d ${OBJECTDIR}/u8g2/u8x8_u8toa.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/FrameworkSource/ES_Port.o ${OBJECTDIR}/FrameworkSource/ES_Timers.o ${OBJECTDIR}/FrameworkSource/ES_LookupTables.o ${OBJECTDIR}/FrameworkSource/ES_CheckEvents.o ${OBJECTDIR}/FrameworkSource/ES_DeferRecall.o ${OBJECTDIR}/FrameworkSource/ES_Framework.o ${OBJECTDIR}/FrameworkSource/ES_Queue.o ${OBJECTDIR}/FrameworkSource/ES_PostList.o ${OBJECTDIR}/FrameworkSource/terminal.o ${OBJECTDIR}/ProjectSource/main.o ${OBJECTDIR}/ProjectSource/EventCheckers.o ${OBJECTDIR}/ProjectSource/dbprintf.o ${OBJECTDIR}/ProjectSource/IR.o ${OBJECTDIR}/ProjectSource/Queue.o ${OBJECTDIR}/u8g2/spi_master.o ${OBJECTDIR}/u8g2/u8g2_bitmap.o ${OBJECTDIR}/u8g2/u8g2_box.o ${OBJECTDIR}/u8g2/u8g2_buffer.o ${OBJECTDIR}/u8g2/u8g2_circle.o ${OBJECTDIR}/u8g2/u8g2_cleardisplay.o ${OBJECTDIR}/u8g2/u8g2_d_memory.o ${OBJECTDIR}/u8g2/u8g2_d_setup.o ${OBJECTDIR}/u8g2/u8g2_font.o ${OBJECTDIR}/u8g2/u8g2_fonts.o ${OBJECTDIR}/u8g2/u8g2_hvline.o ${OBJECTDIR}/u8g2/u8g2_input_value.o ${OBJECTDIR}/u8g2/u8g2_intersection.o ${OBJECTDIR}/u8g2/u8g2_kerning.o ${OBJECTDIR}/u8g2/u8g2_line.o ${OBJECTDIR}/u8g2/u8g2_ll_hvline.o ${OBJECTDIR}/u8g2/u8g2_message.o ${OBJECTDIR}/u8g2/u8g2_pic32mz.o ${OBJECTDIR}/u8g2/u8g2_polygon.o ${OBJECTDIR}/u8g2/u8g2_selection_list.o ${OBJECTDIR}/u8g2/u8g2_setup.o ${OBJECTDIR}/u8g2/u8log.o ${OBJECTDIR}/u8g2/u8log_u8g2.o ${OBJECTDIR}/u8g2/u8log_u8x8.o ${OBJECTDIR}/u8g2/u8x8_8x8.o ${OBJECTDIR}/u8g2/u8x8_byte.o ${OBJECTDIR}/u8g2/u8x8_cad.o ${OBJECTDIR}/u8g2/u8x8_d_ssd1306_128x64_noname.o ${OBJECTDIR}/u8g2/u8x8_debounce.o ${OBJECTDIR}/u8g2/u8x8_display.o ${OBJECTDIR}/u8g2/u8x8_fonts.o ${OBJECTDIR}/u8g2/u8x8_gpio.o ${OBJECTDIR}/u8g2/u8x8_input_value.o ${OBJECTDIR}/u8g2/u8x8_message.o ${OBJECTDIR}/u8g2/u8x8_selection_list.o ${OBJECTDIR}/u8g2/u8x8_setup.o ${OBJECTDIR}/u8g2/u8x8_string.o ${OBJECTDIR}/u8g2/u8x8_u16toa.o ${OBJECTDIR}/u8g2/u8x8_u8toa.o

# Source Files
SOURCEFILES=FrameworkSource/ES_Port.c FrameworkSource/ES_Timers.c FrameworkSource/ES_LookupTables.c FrameworkSource/ES_CheckEvents.c FrameworkSource/ES_DeferRecall.c FrameworkSource/ES_Framework.c FrameworkSource/ES_Queue.c FrameworkSource/ES_PostList.c FrameworkSource/terminal.c ProjectSource/main.c ProjectSource/EventCheckers.c ProjectSource/dbprintf.c ProjectSource/IR.c ProjectSource/Queue.c u8g2/spi_master.c u8g2/u8g2_bitmap.c u8g2/u8g2_box.c u8g2/u8g2_buffer.c u8g2/u8g2_circle.c u8g2/u8g2_cleardisplay.c u8g2/u8g2_d_memory.c u8g2/u8g2_d_setup.c u8g2/u8g2_font.c u8g2/u8g2_fonts.c u8g2/u8g2_hvline.c u8g2/u8g2_input_value.c u8g2/u8g2_intersection.c u8g2/u8g2_kerning.c u8g2/u8g2_line.c u8g2/u8g2_ll_hvline.c u8g2/u8g2_message.c u8g2/u8g2_pic32mz.c u8g2/u8g2_polygon.c u8g2/u8g2_selection_list.c u8g2/u8g2_setup.c u8g2/u8log.c u8g2/u8log_u8g2.c u8g2/u8log_u8x8.c u8g2/u8x8_8x8.c u8g2/u8x8_byte.c u8g2/u8x8_cad.c u8g2/u8x8_d_ssd1306_128x64_noname.c u8g2/u8x8_debounce.c u8g2/u8x8_display.c u8g2/u8x8_fonts.c u8g2/u8x8_gpio.c u8g2/u8x8_input_value.c u8g2/u8x8_message.c u8g2/u8x8_selection_list.c u8g2/u8x8_setup.c u8g2/u8x8_string.c u8g2/u8x8_u16toa.c u8g2/u8x8_u8toa.c



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
	${MAKE}  -f nbproject/Makefile-FrameworkWith_u8g2.mk dist/${CND_CONF}/${IMAGE_TYPE}/InfraredPIC.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

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
${OBJECTDIR}/FrameworkSource/ES_Port.o: FrameworkSource/ES_Port.c  .generated_files/22816f649315fb484717c27bc0e2bf0285768dc.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/FrameworkSource" 
	@${RM} ${OBJECTDIR}/FrameworkSource/ES_Port.o.d 
	@${RM} ${OBJECTDIR}/FrameworkSource/ES_Port.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/FrameworkSource/ES_Port.o.d" -o ${OBJECTDIR}/FrameworkSource/ES_Port.o FrameworkSource/ES_Port.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FrameworkSource/ES_Timers.o: FrameworkSource/ES_Timers.c  .generated_files/f0cf8dc6ca6e23841a7234f93805806d57c78ec8.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/FrameworkSource" 
	@${RM} ${OBJECTDIR}/FrameworkSource/ES_Timers.o.d 
	@${RM} ${OBJECTDIR}/FrameworkSource/ES_Timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/FrameworkSource/ES_Timers.o.d" -o ${OBJECTDIR}/FrameworkSource/ES_Timers.o FrameworkSource/ES_Timers.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FrameworkSource/ES_LookupTables.o: FrameworkSource/ES_LookupTables.c  .generated_files/125d7e0e3be7e4276a850e9ddcc4fd269f24e5b9.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/FrameworkSource" 
	@${RM} ${OBJECTDIR}/FrameworkSource/ES_LookupTables.o.d 
	@${RM} ${OBJECTDIR}/FrameworkSource/ES_LookupTables.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/FrameworkSource/ES_LookupTables.o.d" -o ${OBJECTDIR}/FrameworkSource/ES_LookupTables.o FrameworkSource/ES_LookupTables.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FrameworkSource/ES_CheckEvents.o: FrameworkSource/ES_CheckEvents.c  .generated_files/afb0a06ec6a145502dfec507584077eb5868e7aa.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/FrameworkSource" 
	@${RM} ${OBJECTDIR}/FrameworkSource/ES_CheckEvents.o.d 
	@${RM} ${OBJECTDIR}/FrameworkSource/ES_CheckEvents.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/FrameworkSource/ES_CheckEvents.o.d" -o ${OBJECTDIR}/FrameworkSource/ES_CheckEvents.o FrameworkSource/ES_CheckEvents.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FrameworkSource/ES_DeferRecall.o: FrameworkSource/ES_DeferRecall.c  .generated_files/c3277b61fe62c8c9b097c2268391b632861a19f8.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/FrameworkSource" 
	@${RM} ${OBJECTDIR}/FrameworkSource/ES_DeferRecall.o.d 
	@${RM} ${OBJECTDIR}/FrameworkSource/ES_DeferRecall.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/FrameworkSource/ES_DeferRecall.o.d" -o ${OBJECTDIR}/FrameworkSource/ES_DeferRecall.o FrameworkSource/ES_DeferRecall.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FrameworkSource/ES_Framework.o: FrameworkSource/ES_Framework.c  .generated_files/83c113737e5385ae5cad149b5c2fcecb1bfd748a.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/FrameworkSource" 
	@${RM} ${OBJECTDIR}/FrameworkSource/ES_Framework.o.d 
	@${RM} ${OBJECTDIR}/FrameworkSource/ES_Framework.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/FrameworkSource/ES_Framework.o.d" -o ${OBJECTDIR}/FrameworkSource/ES_Framework.o FrameworkSource/ES_Framework.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FrameworkSource/ES_Queue.o: FrameworkSource/ES_Queue.c  .generated_files/2548d3a571d09207807bb6163537422cdbd54162.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/FrameworkSource" 
	@${RM} ${OBJECTDIR}/FrameworkSource/ES_Queue.o.d 
	@${RM} ${OBJECTDIR}/FrameworkSource/ES_Queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/FrameworkSource/ES_Queue.o.d" -o ${OBJECTDIR}/FrameworkSource/ES_Queue.o FrameworkSource/ES_Queue.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FrameworkSource/ES_PostList.o: FrameworkSource/ES_PostList.c  .generated_files/983a2791a199729b0ec290707f91251992dcb4d3.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/FrameworkSource" 
	@${RM} ${OBJECTDIR}/FrameworkSource/ES_PostList.o.d 
	@${RM} ${OBJECTDIR}/FrameworkSource/ES_PostList.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/FrameworkSource/ES_PostList.o.d" -o ${OBJECTDIR}/FrameworkSource/ES_PostList.o FrameworkSource/ES_PostList.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FrameworkSource/terminal.o: FrameworkSource/terminal.c  .generated_files/c7d739d8727b5963ba63f78515999023bbd65d91.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/FrameworkSource" 
	@${RM} ${OBJECTDIR}/FrameworkSource/terminal.o.d 
	@${RM} ${OBJECTDIR}/FrameworkSource/terminal.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/FrameworkSource/terminal.o.d" -o ${OBJECTDIR}/FrameworkSource/terminal.o FrameworkSource/terminal.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/ProjectSource/main.o: ProjectSource/main.c  .generated_files/61e8dd6d2256de78805cabde4345853a69c4c7dd.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/ProjectSource" 
	@${RM} ${OBJECTDIR}/ProjectSource/main.o.d 
	@${RM} ${OBJECTDIR}/ProjectSource/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/ProjectSource/main.o.d" -o ${OBJECTDIR}/ProjectSource/main.o ProjectSource/main.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/ProjectSource/EventCheckers.o: ProjectSource/EventCheckers.c  .generated_files/19c9e929acd941cb466f3a4d83729699632d7a23.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/ProjectSource" 
	@${RM} ${OBJECTDIR}/ProjectSource/EventCheckers.o.d 
	@${RM} ${OBJECTDIR}/ProjectSource/EventCheckers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/ProjectSource/EventCheckers.o.d" -o ${OBJECTDIR}/ProjectSource/EventCheckers.o ProjectSource/EventCheckers.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/ProjectSource/dbprintf.o: ProjectSource/dbprintf.c  .generated_files/9bddce1b7b2d2a3e27653b2e9941d19bd79cdc60.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/ProjectSource" 
	@${RM} ${OBJECTDIR}/ProjectSource/dbprintf.o.d 
	@${RM} ${OBJECTDIR}/ProjectSource/dbprintf.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/ProjectSource/dbprintf.o.d" -o ${OBJECTDIR}/ProjectSource/dbprintf.o ProjectSource/dbprintf.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/ProjectSource/IR.o: ProjectSource/IR.c  .generated_files/c8fe0ddf5f81eb821b9f7d7ad83224b2a7b0a303.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/ProjectSource" 
	@${RM} ${OBJECTDIR}/ProjectSource/IR.o.d 
	@${RM} ${OBJECTDIR}/ProjectSource/IR.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/ProjectSource/IR.o.d" -o ${OBJECTDIR}/ProjectSource/IR.o ProjectSource/IR.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/ProjectSource/Queue.o: ProjectSource/Queue.c  .generated_files/81f63d560f4028ed76867923ee18228a26af379.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/ProjectSource" 
	@${RM} ${OBJECTDIR}/ProjectSource/Queue.o.d 
	@${RM} ${OBJECTDIR}/ProjectSource/Queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/ProjectSource/Queue.o.d" -o ${OBJECTDIR}/ProjectSource/Queue.o ProjectSource/Queue.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/spi_master.o: u8g2/spi_master.c  .generated_files/efc970f73ba446bb24fa89b6cb552b3c584bb3a5.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/spi_master.o.d 
	@${RM} ${OBJECTDIR}/u8g2/spi_master.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/spi_master.o.d" -o ${OBJECTDIR}/u8g2/spi_master.o u8g2/spi_master.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_bitmap.o: u8g2/u8g2_bitmap.c  .generated_files/3cce10a04b58480593c4324126c97ac74478c787.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_bitmap.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_bitmap.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_bitmap.o.d" -o ${OBJECTDIR}/u8g2/u8g2_bitmap.o u8g2/u8g2_bitmap.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_box.o: u8g2/u8g2_box.c  .generated_files/32f6350b363a55bbf760015609309302789793dc.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_box.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_box.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_box.o.d" -o ${OBJECTDIR}/u8g2/u8g2_box.o u8g2/u8g2_box.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_buffer.o: u8g2/u8g2_buffer.c  .generated_files/4bf9f1673ac136d84300509df75085b40f0b3696.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_buffer.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_buffer.o.d" -o ${OBJECTDIR}/u8g2/u8g2_buffer.o u8g2/u8g2_buffer.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_circle.o: u8g2/u8g2_circle.c  .generated_files/520156190acc7b3bcd1770e65e314df6c2e553d2.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_circle.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_circle.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_circle.o.d" -o ${OBJECTDIR}/u8g2/u8g2_circle.o u8g2/u8g2_circle.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_cleardisplay.o: u8g2/u8g2_cleardisplay.c  .generated_files/788ea9920461bae1d3a1b7e88c141c00026aa22a.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_cleardisplay.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_cleardisplay.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_cleardisplay.o.d" -o ${OBJECTDIR}/u8g2/u8g2_cleardisplay.o u8g2/u8g2_cleardisplay.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_d_memory.o: u8g2/u8g2_d_memory.c  .generated_files/66fc72e379e95e03c72ad6914178e7af0c9aaad0.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_d_memory.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_d_memory.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_d_memory.o.d" -o ${OBJECTDIR}/u8g2/u8g2_d_memory.o u8g2/u8g2_d_memory.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_d_setup.o: u8g2/u8g2_d_setup.c  .generated_files/b3f485931d21892cdd341f754fbd56485afa19b4.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_d_setup.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_d_setup.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_d_setup.o.d" -o ${OBJECTDIR}/u8g2/u8g2_d_setup.o u8g2/u8g2_d_setup.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_font.o: u8g2/u8g2_font.c  .generated_files/451a5aa5705f129bae5f8caaf704c7f7b6d06664.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_font.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_font.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_font.o.d" -o ${OBJECTDIR}/u8g2/u8g2_font.o u8g2/u8g2_font.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_fonts.o: u8g2/u8g2_fonts.c  .generated_files/2e24df8073fb74d12dfcde4c76d81e0526143dd.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_fonts.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_fonts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_fonts.o.d" -o ${OBJECTDIR}/u8g2/u8g2_fonts.o u8g2/u8g2_fonts.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_hvline.o: u8g2/u8g2_hvline.c  .generated_files/9596a752973849496670bbb6b121a0f97b2e3616.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_hvline.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_hvline.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_hvline.o.d" -o ${OBJECTDIR}/u8g2/u8g2_hvline.o u8g2/u8g2_hvline.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_input_value.o: u8g2/u8g2_input_value.c  .generated_files/9e640656d73ca1aa832bfdf47ec8703ba91ee6de.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_input_value.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_input_value.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_input_value.o.d" -o ${OBJECTDIR}/u8g2/u8g2_input_value.o u8g2/u8g2_input_value.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_intersection.o: u8g2/u8g2_intersection.c  .generated_files/ec6b56911278f03214641a47df89396511f22f18.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_intersection.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_intersection.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_intersection.o.d" -o ${OBJECTDIR}/u8g2/u8g2_intersection.o u8g2/u8g2_intersection.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_kerning.o: u8g2/u8g2_kerning.c  .generated_files/32f85d844ea91560d8299c5af89c2d36268b1322.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_kerning.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_kerning.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_kerning.o.d" -o ${OBJECTDIR}/u8g2/u8g2_kerning.o u8g2/u8g2_kerning.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_line.o: u8g2/u8g2_line.c  .generated_files/3846ebd9a215d5ee91cf564788f4667073fbc926.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_line.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_line.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_line.o.d" -o ${OBJECTDIR}/u8g2/u8g2_line.o u8g2/u8g2_line.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_ll_hvline.o: u8g2/u8g2_ll_hvline.c  .generated_files/72c52c3837a3823741cc6dc08d215f3d536926cc.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_ll_hvline.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_ll_hvline.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_ll_hvline.o.d" -o ${OBJECTDIR}/u8g2/u8g2_ll_hvline.o u8g2/u8g2_ll_hvline.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_message.o: u8g2/u8g2_message.c  .generated_files/cfd68b3b5e26a5eb1bffb51bce69cd52e54f774c.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_message.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_message.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_message.o.d" -o ${OBJECTDIR}/u8g2/u8g2_message.o u8g2/u8g2_message.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_pic32mz.o: u8g2/u8g2_pic32mz.c  .generated_files/518fe2ffa0872732f7c1ad734dee0beece7ee739.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_pic32mz.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_pic32mz.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_pic32mz.o.d" -o ${OBJECTDIR}/u8g2/u8g2_pic32mz.o u8g2/u8g2_pic32mz.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_polygon.o: u8g2/u8g2_polygon.c  .generated_files/7c8aeac449f308e38c7d38d8ad38cd1d903dfa8b.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_polygon.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_polygon.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_polygon.o.d" -o ${OBJECTDIR}/u8g2/u8g2_polygon.o u8g2/u8g2_polygon.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_selection_list.o: u8g2/u8g2_selection_list.c  .generated_files/9b448d5c5756129116cef652793831bf506224e3.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_selection_list.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_selection_list.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_selection_list.o.d" -o ${OBJECTDIR}/u8g2/u8g2_selection_list.o u8g2/u8g2_selection_list.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_setup.o: u8g2/u8g2_setup.c  .generated_files/5caafa10e4c5fba4545ac06488677be1a64ce251.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_setup.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_setup.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_setup.o.d" -o ${OBJECTDIR}/u8g2/u8g2_setup.o u8g2/u8g2_setup.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8log.o: u8g2/u8log.c  .generated_files/67cd59009b3748920122f0b60fef6208f515e751.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8log.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8log.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8log.o.d" -o ${OBJECTDIR}/u8g2/u8log.o u8g2/u8log.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8log_u8g2.o: u8g2/u8log_u8g2.c  .generated_files/8dc04ea390e8c9e49153487c52db0101eb97be18.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8log_u8g2.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8log_u8g2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8log_u8g2.o.d" -o ${OBJECTDIR}/u8g2/u8log_u8g2.o u8g2/u8log_u8g2.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8log_u8x8.o: u8g2/u8log_u8x8.c  .generated_files/7a7dfcc5bcaa7d2024a411c8cba3bf73fa2ae60a.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8log_u8x8.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8log_u8x8.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8log_u8x8.o.d" -o ${OBJECTDIR}/u8g2/u8log_u8x8.o u8g2/u8log_u8x8.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8x8_8x8.o: u8g2/u8x8_8x8.c  .generated_files/e86d74bc2cbdf1a4f95e8afce28e9ec0d16aa75f.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_8x8.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_8x8.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8x8_8x8.o.d" -o ${OBJECTDIR}/u8g2/u8x8_8x8.o u8g2/u8x8_8x8.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8x8_byte.o: u8g2/u8x8_byte.c  .generated_files/6f664a1737daff8984285a97c5df954febd290.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_byte.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_byte.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8x8_byte.o.d" -o ${OBJECTDIR}/u8g2/u8x8_byte.o u8g2/u8x8_byte.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8x8_cad.o: u8g2/u8x8_cad.c  .generated_files/87482a2d71345a220adffebce750da895279ced6.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_cad.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_cad.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8x8_cad.o.d" -o ${OBJECTDIR}/u8g2/u8x8_cad.o u8g2/u8x8_cad.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8x8_d_ssd1306_128x64_noname.o: u8g2/u8x8_d_ssd1306_128x64_noname.c  .generated_files/dd27d41dc8562f9ce8ea291b884506885bc001c4.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1306_128x64_noname.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1306_128x64_noname.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_ssd1306_128x64_noname.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_ssd1306_128x64_noname.o u8g2/u8x8_d_ssd1306_128x64_noname.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8x8_debounce.o: u8g2/u8x8_debounce.c  .generated_files/961cd6f6f46b571882bd58822ba23f19e74fd115.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_debounce.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_debounce.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8x8_debounce.o.d" -o ${OBJECTDIR}/u8g2/u8x8_debounce.o u8g2/u8x8_debounce.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8x8_display.o: u8g2/u8x8_display.c  .generated_files/1f95a944f3fc2f2144b3b8ba2822ff3a3519247e.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_display.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_display.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8x8_display.o.d" -o ${OBJECTDIR}/u8g2/u8x8_display.o u8g2/u8x8_display.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8x8_fonts.o: u8g2/u8x8_fonts.c  .generated_files/42d38b24c6482815a1dff65806b834fa445d3d45.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_fonts.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_fonts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8x8_fonts.o.d" -o ${OBJECTDIR}/u8g2/u8x8_fonts.o u8g2/u8x8_fonts.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8x8_gpio.o: u8g2/u8x8_gpio.c  .generated_files/c947aac8bcda02f0d648df1685814f1086bbe295.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_gpio.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8x8_gpio.o.d" -o ${OBJECTDIR}/u8g2/u8x8_gpio.o u8g2/u8x8_gpio.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8x8_input_value.o: u8g2/u8x8_input_value.c  .generated_files/800cdd3e310a7f9ea51d07fb48c0c3dc4d0a3dd5.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_input_value.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_input_value.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8x8_input_value.o.d" -o ${OBJECTDIR}/u8g2/u8x8_input_value.o u8g2/u8x8_input_value.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8x8_message.o: u8g2/u8x8_message.c  .generated_files/f1d33cadec9de7240cdfcb0ed9d3d3de733e5c25.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_message.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_message.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8x8_message.o.d" -o ${OBJECTDIR}/u8g2/u8x8_message.o u8g2/u8x8_message.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8x8_selection_list.o: u8g2/u8x8_selection_list.c  .generated_files/819583283602fb0a4ac516073ea39cf762f07131.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_selection_list.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_selection_list.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8x8_selection_list.o.d" -o ${OBJECTDIR}/u8g2/u8x8_selection_list.o u8g2/u8x8_selection_list.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8x8_setup.o: u8g2/u8x8_setup.c  .generated_files/4cebc1951eb834627c2e90ece3547bacf61b24ec.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_setup.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_setup.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8x8_setup.o.d" -o ${OBJECTDIR}/u8g2/u8x8_setup.o u8g2/u8x8_setup.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8x8_string.o: u8g2/u8x8_string.c  .generated_files/b9376118e02b03f3ef95bc6f3937cbe54b9edf29.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_string.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_string.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8x8_string.o.d" -o ${OBJECTDIR}/u8g2/u8x8_string.o u8g2/u8x8_string.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8x8_u16toa.o: u8g2/u8x8_u16toa.c  .generated_files/83778aa3e972ad356d6ed59bbbe915b5228b9778.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_u16toa.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_u16toa.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8x8_u16toa.o.d" -o ${OBJECTDIR}/u8g2/u8x8_u16toa.o u8g2/u8x8_u16toa.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8x8_u8toa.o: u8g2/u8x8_u8toa.c  .generated_files/b1b8bdf99a321cfa945c26c407aca931daa17fd5.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_u8toa.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_u8toa.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8x8_u8toa.o.d" -o ${OBJECTDIR}/u8g2/u8x8_u8toa.o u8g2/u8x8_u8toa.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/FrameworkSource/ES_Port.o: FrameworkSource/ES_Port.c  .generated_files/6ca6fbecddac56f818bf1b0cd300302799f783f6.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/FrameworkSource" 
	@${RM} ${OBJECTDIR}/FrameworkSource/ES_Port.o.d 
	@${RM} ${OBJECTDIR}/FrameworkSource/ES_Port.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/FrameworkSource/ES_Port.o.d" -o ${OBJECTDIR}/FrameworkSource/ES_Port.o FrameworkSource/ES_Port.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FrameworkSource/ES_Timers.o: FrameworkSource/ES_Timers.c  .generated_files/345c7780b6fe0b57aaaabb6a859de05c678e9d75.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/FrameworkSource" 
	@${RM} ${OBJECTDIR}/FrameworkSource/ES_Timers.o.d 
	@${RM} ${OBJECTDIR}/FrameworkSource/ES_Timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/FrameworkSource/ES_Timers.o.d" -o ${OBJECTDIR}/FrameworkSource/ES_Timers.o FrameworkSource/ES_Timers.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FrameworkSource/ES_LookupTables.o: FrameworkSource/ES_LookupTables.c  .generated_files/f1edb163c02dec84a97de68a75725e183b581066.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/FrameworkSource" 
	@${RM} ${OBJECTDIR}/FrameworkSource/ES_LookupTables.o.d 
	@${RM} ${OBJECTDIR}/FrameworkSource/ES_LookupTables.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/FrameworkSource/ES_LookupTables.o.d" -o ${OBJECTDIR}/FrameworkSource/ES_LookupTables.o FrameworkSource/ES_LookupTables.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FrameworkSource/ES_CheckEvents.o: FrameworkSource/ES_CheckEvents.c  .generated_files/e2470b7d6936768535db3a064c2d74cf90a6b67e.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/FrameworkSource" 
	@${RM} ${OBJECTDIR}/FrameworkSource/ES_CheckEvents.o.d 
	@${RM} ${OBJECTDIR}/FrameworkSource/ES_CheckEvents.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/FrameworkSource/ES_CheckEvents.o.d" -o ${OBJECTDIR}/FrameworkSource/ES_CheckEvents.o FrameworkSource/ES_CheckEvents.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FrameworkSource/ES_DeferRecall.o: FrameworkSource/ES_DeferRecall.c  .generated_files/8495cdf70505a58fde1c2d137c89999f42aeec03.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/FrameworkSource" 
	@${RM} ${OBJECTDIR}/FrameworkSource/ES_DeferRecall.o.d 
	@${RM} ${OBJECTDIR}/FrameworkSource/ES_DeferRecall.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/FrameworkSource/ES_DeferRecall.o.d" -o ${OBJECTDIR}/FrameworkSource/ES_DeferRecall.o FrameworkSource/ES_DeferRecall.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FrameworkSource/ES_Framework.o: FrameworkSource/ES_Framework.c  .generated_files/93cef307fe8085d94dbfa00275756bf88cdec36.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/FrameworkSource" 
	@${RM} ${OBJECTDIR}/FrameworkSource/ES_Framework.o.d 
	@${RM} ${OBJECTDIR}/FrameworkSource/ES_Framework.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/FrameworkSource/ES_Framework.o.d" -o ${OBJECTDIR}/FrameworkSource/ES_Framework.o FrameworkSource/ES_Framework.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FrameworkSource/ES_Queue.o: FrameworkSource/ES_Queue.c  .generated_files/dc3aaf4f9e56609940996e1dc31903fe9d2f5827.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/FrameworkSource" 
	@${RM} ${OBJECTDIR}/FrameworkSource/ES_Queue.o.d 
	@${RM} ${OBJECTDIR}/FrameworkSource/ES_Queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/FrameworkSource/ES_Queue.o.d" -o ${OBJECTDIR}/FrameworkSource/ES_Queue.o FrameworkSource/ES_Queue.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FrameworkSource/ES_PostList.o: FrameworkSource/ES_PostList.c  .generated_files/907e11c516750a3bc681bbc2cad8d29e8c3868fe.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/FrameworkSource" 
	@${RM} ${OBJECTDIR}/FrameworkSource/ES_PostList.o.d 
	@${RM} ${OBJECTDIR}/FrameworkSource/ES_PostList.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/FrameworkSource/ES_PostList.o.d" -o ${OBJECTDIR}/FrameworkSource/ES_PostList.o FrameworkSource/ES_PostList.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FrameworkSource/terminal.o: FrameworkSource/terminal.c  .generated_files/4a3add0752b48d09b1bfdd7dc015f003bf377071.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/FrameworkSource" 
	@${RM} ${OBJECTDIR}/FrameworkSource/terminal.o.d 
	@${RM} ${OBJECTDIR}/FrameworkSource/terminal.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/FrameworkSource/terminal.o.d" -o ${OBJECTDIR}/FrameworkSource/terminal.o FrameworkSource/terminal.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/ProjectSource/main.o: ProjectSource/main.c  .generated_files/35027b8b41fd81d9d2e4f667a81438ab64ce689f.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/ProjectSource" 
	@${RM} ${OBJECTDIR}/ProjectSource/main.o.d 
	@${RM} ${OBJECTDIR}/ProjectSource/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/ProjectSource/main.o.d" -o ${OBJECTDIR}/ProjectSource/main.o ProjectSource/main.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/ProjectSource/EventCheckers.o: ProjectSource/EventCheckers.c  .generated_files/8034e4c437ac3c05ba633bed349c4ee611b84097.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/ProjectSource" 
	@${RM} ${OBJECTDIR}/ProjectSource/EventCheckers.o.d 
	@${RM} ${OBJECTDIR}/ProjectSource/EventCheckers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/ProjectSource/EventCheckers.o.d" -o ${OBJECTDIR}/ProjectSource/EventCheckers.o ProjectSource/EventCheckers.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/ProjectSource/dbprintf.o: ProjectSource/dbprintf.c  .generated_files/9e4b0389599e14c4435428c9e1ab0a5a4e66ffd4.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/ProjectSource" 
	@${RM} ${OBJECTDIR}/ProjectSource/dbprintf.o.d 
	@${RM} ${OBJECTDIR}/ProjectSource/dbprintf.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/ProjectSource/dbprintf.o.d" -o ${OBJECTDIR}/ProjectSource/dbprintf.o ProjectSource/dbprintf.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/ProjectSource/IR.o: ProjectSource/IR.c  .generated_files/27c7e5737355a248fd05b710d06d2974cee45dc.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/ProjectSource" 
	@${RM} ${OBJECTDIR}/ProjectSource/IR.o.d 
	@${RM} ${OBJECTDIR}/ProjectSource/IR.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/ProjectSource/IR.o.d" -o ${OBJECTDIR}/ProjectSource/IR.o ProjectSource/IR.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/ProjectSource/Queue.o: ProjectSource/Queue.c  .generated_files/1ae9fe8dd2e35e91ca68bbc96e798b5f46cdfee6.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/ProjectSource" 
	@${RM} ${OBJECTDIR}/ProjectSource/Queue.o.d 
	@${RM} ${OBJECTDIR}/ProjectSource/Queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/ProjectSource/Queue.o.d" -o ${OBJECTDIR}/ProjectSource/Queue.o ProjectSource/Queue.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/spi_master.o: u8g2/spi_master.c  .generated_files/c1de78a18cf82caa2e7318b9146b267a4bae42fa.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/spi_master.o.d 
	@${RM} ${OBJECTDIR}/u8g2/spi_master.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/spi_master.o.d" -o ${OBJECTDIR}/u8g2/spi_master.o u8g2/spi_master.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_bitmap.o: u8g2/u8g2_bitmap.c  .generated_files/8a8749079b61b9354cb2d473ad11db947ed8a295.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_bitmap.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_bitmap.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_bitmap.o.d" -o ${OBJECTDIR}/u8g2/u8g2_bitmap.o u8g2/u8g2_bitmap.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_box.o: u8g2/u8g2_box.c  .generated_files/dd7c3219ae9ed6a15a092fbfdc302cb74f42f962.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_box.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_box.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_box.o.d" -o ${OBJECTDIR}/u8g2/u8g2_box.o u8g2/u8g2_box.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_buffer.o: u8g2/u8g2_buffer.c  .generated_files/b395a64cb60306a5fc9cf3b5912207cca06a80b5.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_buffer.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_buffer.o.d" -o ${OBJECTDIR}/u8g2/u8g2_buffer.o u8g2/u8g2_buffer.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_circle.o: u8g2/u8g2_circle.c  .generated_files/a19af5bb1c1f7ca54eebbd978c92af9abcd96666.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_circle.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_circle.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_circle.o.d" -o ${OBJECTDIR}/u8g2/u8g2_circle.o u8g2/u8g2_circle.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_cleardisplay.o: u8g2/u8g2_cleardisplay.c  .generated_files/dd9014b56552b3685f5aeb04e96a5333d5381732.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_cleardisplay.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_cleardisplay.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_cleardisplay.o.d" -o ${OBJECTDIR}/u8g2/u8g2_cleardisplay.o u8g2/u8g2_cleardisplay.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_d_memory.o: u8g2/u8g2_d_memory.c  .generated_files/7b73fe3a180a7ce0be0c0d378bf9dd9362a86165.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_d_memory.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_d_memory.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_d_memory.o.d" -o ${OBJECTDIR}/u8g2/u8g2_d_memory.o u8g2/u8g2_d_memory.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_d_setup.o: u8g2/u8g2_d_setup.c  .generated_files/c6fc46c8b3439793283fd985a4591fc526bdea3d.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_d_setup.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_d_setup.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_d_setup.o.d" -o ${OBJECTDIR}/u8g2/u8g2_d_setup.o u8g2/u8g2_d_setup.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_font.o: u8g2/u8g2_font.c  .generated_files/9d228ffc2dd644a649f661fc67b57c5f8f99e7fd.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_font.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_font.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_font.o.d" -o ${OBJECTDIR}/u8g2/u8g2_font.o u8g2/u8g2_font.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_fonts.o: u8g2/u8g2_fonts.c  .generated_files/483924781acd58b54eacd7f39a24657ed35dce77.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_fonts.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_fonts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_fonts.o.d" -o ${OBJECTDIR}/u8g2/u8g2_fonts.o u8g2/u8g2_fonts.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_hvline.o: u8g2/u8g2_hvline.c  .generated_files/801831a6178762045de1c27c2840961dd872fb8a.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_hvline.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_hvline.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_hvline.o.d" -o ${OBJECTDIR}/u8g2/u8g2_hvline.o u8g2/u8g2_hvline.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_input_value.o: u8g2/u8g2_input_value.c  .generated_files/91854e8d189b06a74d90949a373816b52501cec2.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_input_value.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_input_value.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_input_value.o.d" -o ${OBJECTDIR}/u8g2/u8g2_input_value.o u8g2/u8g2_input_value.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_intersection.o: u8g2/u8g2_intersection.c  .generated_files/3372f37ef034dcf055bafc960348c139cad1a0fb.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_intersection.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_intersection.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_intersection.o.d" -o ${OBJECTDIR}/u8g2/u8g2_intersection.o u8g2/u8g2_intersection.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_kerning.o: u8g2/u8g2_kerning.c  .generated_files/e21dcf93eb912b5f5cef06c5ddad1908ccebdf15.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_kerning.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_kerning.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_kerning.o.d" -o ${OBJECTDIR}/u8g2/u8g2_kerning.o u8g2/u8g2_kerning.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_line.o: u8g2/u8g2_line.c  .generated_files/134baa086b23ad261c558675cd01a1466ca1bcd.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_line.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_line.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_line.o.d" -o ${OBJECTDIR}/u8g2/u8g2_line.o u8g2/u8g2_line.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_ll_hvline.o: u8g2/u8g2_ll_hvline.c  .generated_files/39a22eaccc73aba683b1cd988789d2b972145dde.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_ll_hvline.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_ll_hvline.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_ll_hvline.o.d" -o ${OBJECTDIR}/u8g2/u8g2_ll_hvline.o u8g2/u8g2_ll_hvline.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_message.o: u8g2/u8g2_message.c  .generated_files/d13cef916071b6022bc1dd1db750c247fed5d41f.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_message.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_message.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_message.o.d" -o ${OBJECTDIR}/u8g2/u8g2_message.o u8g2/u8g2_message.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_pic32mz.o: u8g2/u8g2_pic32mz.c  .generated_files/b595a52f084f2b84c4d6e43509fcd3378516db75.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_pic32mz.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_pic32mz.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_pic32mz.o.d" -o ${OBJECTDIR}/u8g2/u8g2_pic32mz.o u8g2/u8g2_pic32mz.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_polygon.o: u8g2/u8g2_polygon.c  .generated_files/9eca6f02591ffbdd21c0331a1e8eb72022899316.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_polygon.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_polygon.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_polygon.o.d" -o ${OBJECTDIR}/u8g2/u8g2_polygon.o u8g2/u8g2_polygon.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_selection_list.o: u8g2/u8g2_selection_list.c  .generated_files/bf81026d605f994706fbceb2e78d8d168985d1ce.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_selection_list.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_selection_list.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_selection_list.o.d" -o ${OBJECTDIR}/u8g2/u8g2_selection_list.o u8g2/u8g2_selection_list.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8g2_setup.o: u8g2/u8g2_setup.c  .generated_files/533b0827d90e589c34120e3679db757d0cfecd5e.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_setup.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8g2_setup.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8g2_setup.o.d" -o ${OBJECTDIR}/u8g2/u8g2_setup.o u8g2/u8g2_setup.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8log.o: u8g2/u8log.c  .generated_files/3b3e1b5a6aaf99d19408e1a1b5421363f3caaaa5.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8log.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8log.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8log.o.d" -o ${OBJECTDIR}/u8g2/u8log.o u8g2/u8log.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8log_u8g2.o: u8g2/u8log_u8g2.c  .generated_files/5e9349d89ced6e93afca1cc022edeb0fdf9d9afa.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8log_u8g2.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8log_u8g2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8log_u8g2.o.d" -o ${OBJECTDIR}/u8g2/u8log_u8g2.o u8g2/u8log_u8g2.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8log_u8x8.o: u8g2/u8log_u8x8.c  .generated_files/d8fc5a02c81ee243e44295a5c06ea5f871095264.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8log_u8x8.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8log_u8x8.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8log_u8x8.o.d" -o ${OBJECTDIR}/u8g2/u8log_u8x8.o u8g2/u8log_u8x8.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8x8_8x8.o: u8g2/u8x8_8x8.c  .generated_files/b3c582cfca3c178e2d7120ef135de13a41dddbc5.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_8x8.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_8x8.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8x8_8x8.o.d" -o ${OBJECTDIR}/u8g2/u8x8_8x8.o u8g2/u8x8_8x8.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8x8_byte.o: u8g2/u8x8_byte.c  .generated_files/e06c22923882e74aac7410a50f96fc2fb8c34110.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_byte.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_byte.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8x8_byte.o.d" -o ${OBJECTDIR}/u8g2/u8x8_byte.o u8g2/u8x8_byte.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8x8_cad.o: u8g2/u8x8_cad.c  .generated_files/22fc84ce9a0007e00d18db050a722b1f34a690ae.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_cad.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_cad.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8x8_cad.o.d" -o ${OBJECTDIR}/u8g2/u8x8_cad.o u8g2/u8x8_cad.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8x8_d_ssd1306_128x64_noname.o: u8g2/u8x8_d_ssd1306_128x64_noname.c  .generated_files/b37297e5eb2f01ee327acebc5bda5312c3585b75.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1306_128x64_noname.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_d_ssd1306_128x64_noname.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8x8_d_ssd1306_128x64_noname.o.d" -o ${OBJECTDIR}/u8g2/u8x8_d_ssd1306_128x64_noname.o u8g2/u8x8_d_ssd1306_128x64_noname.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8x8_debounce.o: u8g2/u8x8_debounce.c  .generated_files/d2f90d6a298f7233091de36954d800d3e9413fcb.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_debounce.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_debounce.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8x8_debounce.o.d" -o ${OBJECTDIR}/u8g2/u8x8_debounce.o u8g2/u8x8_debounce.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8x8_display.o: u8g2/u8x8_display.c  .generated_files/2feaf5535ff0ead1bd540d01a9bde05e5c857586.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_display.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_display.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8x8_display.o.d" -o ${OBJECTDIR}/u8g2/u8x8_display.o u8g2/u8x8_display.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8x8_fonts.o: u8g2/u8x8_fonts.c  .generated_files/f9ef19bc5ac4f1354c178325e0dcfdeb899351a4.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_fonts.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_fonts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8x8_fonts.o.d" -o ${OBJECTDIR}/u8g2/u8x8_fonts.o u8g2/u8x8_fonts.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8x8_gpio.o: u8g2/u8x8_gpio.c  .generated_files/a14ab6b957f1d38c24fa351d65e5381049998907.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_gpio.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8x8_gpio.o.d" -o ${OBJECTDIR}/u8g2/u8x8_gpio.o u8g2/u8x8_gpio.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8x8_input_value.o: u8g2/u8x8_input_value.c  .generated_files/200bed7669711bfd77b05a9d6ddda1a1e99eccca.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_input_value.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_input_value.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8x8_input_value.o.d" -o ${OBJECTDIR}/u8g2/u8x8_input_value.o u8g2/u8x8_input_value.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8x8_message.o: u8g2/u8x8_message.c  .generated_files/266b611ed81d8ed643052630b94689faaed047c2.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_message.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_message.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8x8_message.o.d" -o ${OBJECTDIR}/u8g2/u8x8_message.o u8g2/u8x8_message.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8x8_selection_list.o: u8g2/u8x8_selection_list.c  .generated_files/a2e05ffae8df80e039639763b9f51a588bda956a.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_selection_list.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_selection_list.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8x8_selection_list.o.d" -o ${OBJECTDIR}/u8g2/u8x8_selection_list.o u8g2/u8x8_selection_list.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8x8_setup.o: u8g2/u8x8_setup.c  .generated_files/e26ed9dd0df6d48b8cc2045401d4ec9826e47474.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_setup.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_setup.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8x8_setup.o.d" -o ${OBJECTDIR}/u8g2/u8x8_setup.o u8g2/u8x8_setup.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8x8_string.o: u8g2/u8x8_string.c  .generated_files/200299aca6a4e08e81aec6094a91e4e642b991d9.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_string.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_string.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8x8_string.o.d" -o ${OBJECTDIR}/u8g2/u8x8_string.o u8g2/u8x8_string.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8x8_u16toa.o: u8g2/u8x8_u16toa.c  .generated_files/239f1a99352ab2cb126a709ab43a6410ad7470a6.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/u8g2" 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_u16toa.o.d 
	@${RM} ${OBJECTDIR}/u8g2/u8x8_u16toa.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"FrameworkHeaders" -I"ProjectHeaders" -I"u8g2Headers" -MP -MMD -MF "${OBJECTDIR}/u8g2/u8x8_u16toa.o.d" -o ${OBJECTDIR}/u8g2/u8x8_u16toa.o u8g2/u8x8_u16toa.c    -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu99 -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/u8g2/u8x8_u8toa.o: u8g2/u8x8_u8toa.c  .generated_files/b3d3b76284a6dc58ffda7f91cec0afd0b100a2fd.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
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
dist/${CND_CONF}/${IMAGE_TYPE}/InfraredPIC.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/InfraredPIC.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  -std=gnu99 $(COMPARISON_BUILD)   -mreserve=data@0x0:0x1FC -mreserve=boot@0x1FC00490:0x1FC00BEF  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/InfraredPIC.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/InfraredPIC.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_FrameworkWith_u8g2=$(CND_CONF)  -legacy-libc  -std=gnu99 $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -mdfp="${DFP_DIR}"
	${MP_CC_DIR}\\xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/InfraredPIC.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
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
